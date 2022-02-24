#! /bin/sh
rm .git/hooks/*
sg release || true
