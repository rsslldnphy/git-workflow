function git-release {
  local tag=`git tag | tail -n 1`
  git tag -a `date +%Y%m%d` -m "`git log "$tag".. --pretty=format:"%s" |
    grep -v "Merge branch 'release" |
    sed 's/\(.*\)/*   \1 /g' |
    sed "s/*   Merge branch 'feature\/\([^']*\)'.*/\\
Feature: \1/g"`"
}
