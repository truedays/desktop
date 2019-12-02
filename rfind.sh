#!/bin/bash
#
# July 23, 2017 version 0.1
# Standardizing the way I organize with find.

# /tank == path to index
# -xdev == do not traverse other filesystems
#find /tank -xdev -printf "$(uname -n)\t%f\t%s\t%Cs\t%Ts\t%p\t%F\t%D\t%y\t%#m\t%i\t%u\t%U\t%g\t%G\n"; }
# %.10A@ == %A@ == unix time with high precission .10A@ == just the first 10 digits unix time of last file ACCESS
# %A@s == is better than that ^
[[ $UID -eq 0 ]] || { echo "Must be run as root"; exit 1; }

indexPath="${1:-/tank}"
indexPathShort="${indexPath##*/}"
#indexPathShort="$(basename ${indexPath})"
saveFile="/rfind_${HOSTNAME:-NO_HOSTNAME}_${indexPathShort}_$(date +%F).out"
indexDate="$(date +%s)"
indexHost="$(uname -n)"  # this or $HOSTNAME ??
df="$(df --block-size=1K --local --print-type --exclude-type=tmpfs $indexPath | sed 's@^@#\t@g')"
rfindVersion='0.1'
progName=$0
progPID=$$
for i in {0..9}; do line+=_;done
progDUMP="# $line $progName BEGIN $line
$(cat /proc/${progPID}/fd/255 | sed 's@^@# @g')
# $line $progName END $line"
#strfmt='%f\t%s\t%As\t%Cs\t%Ts\t%p\t%F\t%D\t%y\t%#m\t%n\t%i\t%u\t%U\t%g\t%G\0'
strfmt='%f|%s|%As|%Cs|%Ts|%p|%F|%D|%y|%#m|%n|%i|%u|%U|%g|%G\n'

function main {
{ # create header
echo -e "# rfind rfindVersion=${rfindVersion} date=$(date +%s) ($(date))
# indexHost=$indexHost \n# indexPath=$indexPath \n# DF: \n$df
#
#\n${progDUMP//\\/\\\\}
#
# strfmt='${strfmt//\\/\\\\}'
#";
#find "${indexPath}" -xdev -printf "$strfmt"; } | tee >(gzip > ${saveFile}.gz)
find "${indexPath}" -xdev -printf "$strfmt"; } | gzip > ${saveFile}.gz
}

#time main
main && echo -e "$line$line$line$line\n  Indexing root@$indexHost:$indexPath completed @ $(date) \n $line$line$line$line\n\tTRY: zless ${saveFile}.gz" || echo something failed..
exit 0

## ~$ COLUMNS=888 man -Pcat find | \grep -Ei '^\s*%' | sed -e 's/^\s*/#  /g'  # <---- ___GENERATE THE BELOW REFERENCE___
#  %%     A literal percent sign.
#  %a     File’s last access time in the format returned by the C ‘ctime’ function.
#  %Ak    File’s last access time in the format specified by k, which is either ‘@’ or a directive for the C ‘strftime’ function.  The possible values for k are listed below; some of them might not be available on all systems, due to differences in ‘strftime’ between systems.
#  %b     The amount of disk space used for this file in 512-byte blocks. Since disk space is allocated in multiples of the filesystem block size this is usually greater than %s/512, but it can also be smaller if the file is a sparse file.
#  %c     File’s last status change time in the format returned by the C ‘ctime’ function.
#  %Ck    File’s last status change time in the format specified by k, which is the same as for %A.
#  %d     File’s depth in the directory tree; 0 means the file is a command line argument.
#  %D     The device number on which the file exists (the st_dev field of struct stat), in decimal.
#  %f     File’s name with any leading directories removed (only the last element).
#  %F     Type of the filesystem the file is on; this value can be used for -fstype.
#  %g     File’s group name, or numeric group ID if the group has no name.
#  %G     File’s numeric group ID.
#  %h     Leading directories of file’s name (all but the last element).  If the file name contains no slashes (since it is in the current directory) the %h specifier expands to ".".
#  %H     Command line argument under which file was found.
#  %i     File’s inode number (in decimal).
#  %k     The amount of disk space used for this file in 1K blocks. Since disk space is allocated in multiples of the filesystem block size this is usually greater than %s/1024, but it can also be smaller if the file is a sparse file.
#  %l     Object of symbolic link (empty string if file is not a symbolic link).
#  %m     File’s permission bits (in octal).  This option uses the ‘traditional’ numbers which most Unix implementations use, but if your particular implementation uses an unusual ordering of octal permissions bits, you will see a difference between the actual value of the file’s mode and the output of %m.   Normally you will want to have a leading zero on this number, and to do this, you should use the # flag (as in, for example, ‘%#m’).
#  %M     File’s permissions (in symbolic form, as for ls).  This directive is supported in findutils 4.2.5 and later.
#  %n     Number of hard links to file.
#  %p     File’s name.
#  %P     File’s name with the name of the command line argument under which it was found removed.
#  %s     File’s size in bytes.
#  %S     File’s sparseness.  This is calculated as (BLOCKSIZE*st_blocks / st_size).  The exact value you will get for an ordinary file of a certain length is system-dependent.  However, normally sparse files will have values less than 1.0, and files which use indirect blocks may have a value which is greater than 1.0.   The value used for BLOCKSIZE is system-dependent, but is usually 512 bytes.   If the file size is zero, the value printed is undefined.  On systems which lack support for st_blocks, a file’s sparseness is assumed to be 1.0.
#  %t     File’s last modification time in the format returned by the C ‘ctime’ function.
#  %Tk    File’s last modification time in the format specified by k, which is the same as for %A.
#  %u     File’s user name, or numeric user ID if the user has no name.
#  %U     File’s numeric user ID.
#  %y     File’s type (like in ls -l), U=unknown type (shouldn’t happen)
#  %Y     File’s type (like %y), plus follow symlinks: L=loop, N=nonexistent
#  %Z     (SELinux only) file’s security context.

