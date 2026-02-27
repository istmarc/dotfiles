# YCM Config File
import os
import ycm_core

FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-isystem', '/usr/local/include', 
    '-isystem', '/usr/include/c++/9',
    '-I', 'include',
    '-I', 'src',
    '-I', '.',
    # Eigen
    #'-I','/usr/local/opt/eigen/include/eigen3',
    # Boost
    #'-I','/usr/local/include/boost',
    # openBlas
    #'-I','/usr/local/opt/openblas/include',
    # openMP
    #'-I','/usr/local/opt/libomp/include',
    # Protobuf
    #'-I','/usr/local/Cellar/protobuf/3.11.4/include/google/protobuf/'
    # '-I', '/usr/include/google/',
    # OPenCV 
    #'-I', '/usr/local/include/opencv4/'
    # Tenseur
    '-I', '/home/marc/repos/tenseur',
]

def getFLAGS():
    return FLAGS

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if compilation_database_folder:
    database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
    database = None

def DirectoryOfThisScript():
    return os.path.dirname( os.path.abspath( __file__ ) )

def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
    if not working_directory:
        return list( flags )
    new_flags = []
    make_next_absolute = False
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith( '/' ):
                new_flag = os.path.join( working_directory, flag )

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith( path_flag ):
                path = flag[ len( path_flag ): ]
                new_flag = path_flag + os.path.join( working_directory, path )
                break

        if new_flag:
            new_flags.append( new_flag )
    return new_flags

def Settings( filename, **kwargs):
    if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
        compilation_info = database.GetCompilationInfoForFile( filename )
        final_flags = MakeRelativePathsInFlagsAbsolute(
        compilation_info.compiler_flags_,
        compilation_info.compiler_working_dir_ )
    else:
        ext = os.path.splitext(filename)[1]
        flags = getFLAGS()
        # C++
        if (ext in ['.cpp', '.cxx', '.cc', '.C', '.hxx', '.hpp', '.h']) :
            flags += ['-std=c++20', '-x', 'c++']
        # C
        elif (ext in ['.c', '.h']) :
            flags += ['-x', 'c']
        elif (ext in ['.cu', '.cuh']) :
            flags += ['-x', 'cuda', '-std=c++20']
        # relative_to = DirectoryOfThisScript()
        relative_to = os.path.dirname(os.path.abspath(filename))
        final_flags = MakeRelativePathsInFlagsAbsolute( FLAGS, relative_to )
    return {
        'flags': final_flags,
        'do_cache': True
    }
