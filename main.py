import argparse
import json
import os
import subprocess
import shlex
import platform


def delete_files(root):
    for r, dirs, files in os.walk(root):
        for name in files:
            if not name.endswith(".json") \
                    and not name.endswith(".obj") \
                    and not name.endswith(".o")\
                    and not name.endswith(".rsp")\
                    and not name.endswith(".a"):
                os.remove(os.path.join(r, name))
        for dir in dirs:
            delete_files(os.path.join(r, dir))


def prepare_commands():
    # change path yo your own cmake
    mycmake = '/home/gleb/Documents/CMake/cmake-build-debug/bin/cmake'
    if platform.system() == "Windows":
        mycmake = "C:\\Users\\gleb3\\Documents\\CMake\\cmake-build-debug\\bin\\cmake.exe -G \"MinGW Makefiles\""

    process1 = subprocess.Popen(f'{mycmake} ..'
                                , shell=True)
    process1.wait()
    print(f'myCMake return code: {process1.returncode}')


    # delete all file exclude objective and some downloaded libraries
    delete_files(os.getcwd())

    # process_delete = subprocess.Popen(
    #     'find . -type f -not \( -name \'*o\' -or -name \'*json\' -or -name \'libippicv.a\' \) -delete'
    #     , shell=True)
    # process_delete.wait()
    #
    # print(f'delete second return code: {process_delete.returncode}')


def write_statistics():
    cmd1 = ['git', 'ls-files']
    cmd2 = ['xargs', 'wc', '-l']
    process1 = subprocess.Popen(cmd1
                                , stdout=subprocess.PIPE)
    process1.wait()
    process2 = subprocess.Popen(cmd2
                                , stdin=process1.stdout
                                , stdout=subprocess.PIPE
                                , stderr=subprocess.PIPE)
    process2.wait()

    stdout, stderr = process2.communicate()
    new_stdout = stdout.decode("utf-8").replace(' ', '').split('\n')
    total_files, total_lines = len(new_stdout) - 2, new_stdout[len(new_stdout) - 2].split('t')[0]
    print(f'total files: {total_files}\n')
    print(f'total lines: {total_lines}')
    with open('statistics', "w") as file:
        file.write(f'total files: {total_files}\n')
        file.write(f'total lines: {total_lines}')


def sort_link_json(tmp_name, link_name):
    with open(link_name, "r") as read_file:
        link_data = json.load(read_file)

    library_items = []
    other_items = []
    shared_items = []
    cmake_items = []
    with open(tmp_name, "w") as json_file:
        json_file.write('[\n')
        for elem in link_data:
            fst_command = elem.get('command').split(' ')[0].split(os.path.sep)
            command = fst_command[len(fst_command) - 1]
            if command == 'ar' or command == 'ranlib' or command == 'ar.exe' or command == 'ranlib.exe':
                library_items.append(elem)
            elif command == "cmake.exe" or command == "cmake":
                cmake_items.append(elem)
            elif elem.get('command').split(' ').count('-shared') > 0:
                shared_items.append(elem)
            else:
                other_items.append(elem)

        for i in range(len(cmake_items)):
            json.dump(cmake_items[i], json_file, indent=2)
            if len(other_items) == 0 and len(shared_items) == 0 and len(library_items) and i == len(cmake_items) - 1:
                json_file.write('\n')
            else:
                json_file.write(',\n')

        for i in range(len(library_items)):
            json.dump(library_items[i], json_file, indent=2)
            if len(other_items) == 0 and len(shared_items) == 0 and i == len(library_items) - 1:
                json_file.write('\n')
            else:
                json_file.write(',\n')

        for i in range(len(shared_items)):
            json.dump(shared_items[i], json_file, indent=2)
            if len(other_items) == 0 and i == len(shared_items) - 1:
                json_file.write('\n')
            else:
                json_file.write(',\n')

        for i in range(len(other_items)):
            json.dump(other_items[i], json_file, indent=2)
            if i != len(other_items) - 1:
                json_file.write(',\n')
            else:
                json_file.write('\n')

        json_file.write(']')

    os.remove(link_name)
    os.rename(tmp_name, link_name)


def main():
    is_windows = platform.system() == "Windows"
    parser = argparse.ArgumentParser()
    compile_name = "compile_commands.json"
    link_name = "link_commands.json"
    tmp_name = "tmp.json"
    parser.add_argument(
        '--i'
        , required=True
        , help='directory with project'
    )

    args = parser.parse_args()
    repo = args.i
    os.chdir(repo)
    build_dir = os.path.join(os.getcwd(), 'build')
    # write_statistics()
    os.chdir(build_dir)
    prepare_commands()

    sort_link_json(tmp_name, link_name)
    print(os.getcwd())
    with open(link_name, "r") as read_file:
        link_data = json.load(read_file)

    # with open(compile_name, "r") as read_file:
    #     compile_data = json.load(read_file)
    # cur_dir = " "
    # for elem in compile_data:
    #     elem_dir = elem.get('directory')
    #     if platform.system() == "Windows":
    #         elem_dir.replace("/", "\\")
    #     if cur_dir != elem_dir:
    #         if not os.path.exists(elem_dir):
    #             raise FileExistsError
    #         cur_dir = elem_dir
    #         os.chdir(cur_dir)

    #     command = shlex.split(elem_dir)
    #     process = subprocess.Popen(command
    #                                , stdout=subprocess.PIPE
    #                                , stderr=subprocess.PIPE)
    #     _, stderr = process.communicate()
    #     return_code = process.returncode
    #     print(process)
    #     print(stderr)
    #     assert (stderr == b'')
    #     assert (return_code == 0)

    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')

    all_commands = len(link_data)
    incorrect_commands = 0
    build_dir = " "
    for elem in link_data:
        elem_dir = elem.get('directory')
        if is_windows:
            elem_dir.replace("/", "\\")
        if build_dir != elem_dir:
            if not os.path.exists(elem_dir):
                raise FileExistsError
            build_dir = elem_dir
            os.chdir(build_dir)
        posix = True
        if is_windows:
            posix = False
        command = shlex.split(elem.get('command'), posix=posix)

        print(os.getcwd())
        print(command)
        process = subprocess.Popen(command
                                   , stdout=subprocess.PIPE
                                   , stderr=subprocess.PIPE)

        _, stderr = process.communicate()
        return_code = process.returncode
        print(process)
        print(stderr)

        if stderr != b'' or return_code != 0:
            incorrect_commands += 1

        # assert (stderr == b'')
        # assert (return_code == 0)
    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')
    print('----------------------------------------------------------------------------')
    print(all_commands)
    print(incorrect_commands)


if __name__ == '__main__':
    main()
