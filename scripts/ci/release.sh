#! /bin/sh
rm .git/hooks/*
sg release -i npm || true
