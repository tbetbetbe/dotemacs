#!/bin/bash
cd $(dirname $0)

rsync -av .emacs ~
rsync -av .screenrc ~
rsync -av .gitconfig ~
