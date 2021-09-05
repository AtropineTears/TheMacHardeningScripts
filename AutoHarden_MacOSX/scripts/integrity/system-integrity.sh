#!/bin/bash

# Check File Integrity of Essential Files
shasum -a 256 /etc/hosts
shasum -a 256 /etc/passwd