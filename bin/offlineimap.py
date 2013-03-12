#!/usr/bin/python2
import os.path
import subprocess
def mailpasswd(acct):
  acct = os.path.basename(acct)
  path = "/home/fliang/.secrets/%s.gpg" % acct
  args = ["gpg", "-q", "--no-tty", "-d", "--use-agent", path]
  try:
      return str(subprocess.check_output(args)).strip()
  except subprocess.CalledProcessError:
      return ""
