#!/usr/bin/env ciao-shell
	
%:- module(boxes, [main/1], []).

:- use_package(assertions).
:- use_module(library(system)).
:- use_module(library(format)).
:- use_module(library(process)).
:- use_module(library(pathnames)).
:- use_module(library(stream_utils), [write_string/1]).
:- use_module(library(lists), [member/2]).

% A dummy script, just for testing

main([list]) :- !, cmd_list.
main([info]) :- !, cmd_info.
main(_) :- cmd_help.

cmd_help :-
	write_string("Usage: boxes.pl <cmd>

Where the available commands are:

  list    list available boxes and their base box
  info    get system info for each boxes
").

grep(Args, Out) :-
	process_call(path(grep), Args, [stdout(string(Out)), status(0)]).

vagrant(VagrantDir, Args) :-
	process_call(path(vagrant), Args, [cwd(VagrantDir), status(_)]).

% Enumerate boxes
boxes(Name, VagrantDir, VagrantFile) :-
	directory_files('.', Fs),
	member(F, Fs), % (nondet)
	path_concat(F, 'VagrantFile', VagrantFile),
	file_exists(VagrantFile),
	path_basename(F, Name),
	VagrantDir = Name.

cmd_list :-
	( % (failure-driven loop)
	  boxes(Name, _VD, VF),
	    grep(['config.vm.box = ', VF], Str0),
	    ( append(_, "config.vm.box = \""||Str1, Str0),
	      append(Str, "\""||_, Str1) -> true
	    ; Str = "UNKNOWN"
	    ),
	    format("~w: ~s\n", [Name, Str]),
	    fail
	; true
	).

% TODO:
%   In Windows: ?? (MSYS2, MinGW, Cygwin,...)
%   In Mac OS X: sw_vers
%   In Linux: lsb_release, /etc/*-release, /proc/version?
%   (see http://svn.python.org/projects/python/trunk/Lib/platform.py)
cmd_info :-
	( % (failure-driven loop)
	  boxes(Name, VD, _VF),
	    format("~w: ", [Name]),
	    vagrant(VD, [ssh, '-c', 'uname -s; uname -r']),
	    %nl,
	    fail
	; true
	).

:- doc(bug, "Add provisioning for templates, considering templates for
   basic installation and testing, advanced testing (which may contain
   additional software such as Java), build (containing compilation
   toolchains), generation of distributions, and full development
   environments (containing tools like git, MSYS2, cross-compilers for
   MinGW, etc.)").

:- doc(bug, "Provisioning must be kept synchronized with documentation
   for INSTALLATION.").

:- doc(bug, "Provisioning is missing in many machines").

:- doc(bug, "There is no box for Raspbian (only some instructions)").

:- doc(bug, "Missing templates for Solaris (OpenSolaris no longer exists, OpenIndiana?)").

:- doc(bug, "Windows images are weak (needs activation)").

:- doc(bug, "No Mac OS X images (be careful, EULA states that Mac
   hardware is required)").
% (see https://github.com/AndrewDryga/vagrant-box-osx)
