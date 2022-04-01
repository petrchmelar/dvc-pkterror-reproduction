# dvcpktread-reproduction

Run the reproduction script to reproduce pkt error:

```
./reproduce.sh
```

=>

```
╰─❯ ./reproduce.sh 
[+] Building 0.1s (8/8) FINISHED                                                                                                                                                                                                              
 => [internal] load build definition from Dockerfile                                                                                                                                                                                     0.0s
 => => transferring dockerfile: 97B                                                                                                                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/python:3.8                                                                                                                                                                            0.0s
 => [1/4] FROM docker.io/library/python:3.8                                                                                                                                                                                              0.0s
 => CACHED [2/4] RUN mkdir -p ~/.ssh/     && ssh-keyscan github.com >> ~/.ssh/known_hosts     && chmod 700 ~/.ssh     && chmod 644 ~/.ssh/known_hosts                                                                                    0.0s
 => CACHED [3/4] RUN pip install dvc[s3]==2.10.0                                                                                                                                                                                         0.0s
 => CACHED [4/4] WORKDIR /mnt/workspace                                                                                                                                                                                                  0.0s
 => exporting to image                                                                                                                                                                                                                   0.1s
 => => exporting layers                                                                                                                                                                                                                  0.0s
 => => writing image sha256:651a17dda25f7fcdf84f8ba55d61868c85ce356c55561683f650238a3158ec89                                                                                                                                             0.0s
 => => naming to docker.io/library/reproduction                                                                                                                                                                                          0.0s
2022-04-01 12:27:56,310 DEBUG: Creating external repo git@github.com:iterative/example-get-started.git@None
2022-04-01 12:27:56,310 DEBUG: erepo: git clone 'git@github.com:iterative/example-get-started.git' to a temporary dir
2022-04-01 12:27:57,953 ERROR: failed to list 'git@github.com:iterative/example-get-started.git' - Failed to clone repo 'git@github.com:iterative/example-get-started.git' to '/tmp/tmp8mvwnvkbdvc-clone'                                     
------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/local/lib/python3.8/site-packages/scmrepo/git/backend/dulwich/__init__.py", line 193, in clone
    repo = clone_from()
  File "/usr/local/lib/python3.8/site-packages/dulwich/porcelain.py", line 443, in clone
    return client.clone(
  File "/usr/local/lib/python3.8/site-packages/dulwich/client.py", line 535, in clone
    result = self.fetch(path, target, progress=progress, depth=depth)
  File "/usr/local/lib/python3.8/site-packages/dulwich/client.py", line 601, in fetch
    result = self.fetch_pack(
  File "/usr/local/lib/python3.8/site-packages/dulwich/client.py", line 1125, in fetch_pack
    self._handle_upload_pack_tail(
  File "/usr/local/lib/python3.8/site-packages/dulwich/client.py", line 911, in _handle_upload_pack_tail
    self._read_side_band64k_data(
  File "/usr/local/lib/python3.8/site-packages/dulwich/client.py", line 665, in _read_side_band64k_data
    for pkt in proto.read_pkt_seq():
  File "/usr/local/lib/python3.8/site-packages/dulwich/protocol.py", line 290, in read_pkt_seq
    pkt = self.read_pkt_line()
  File "/usr/local/lib/python3.8/site-packages/dulwich/protocol.py", line 245, in read_pkt_line
    raise GitProtocolError(
dulwich.errors.GitProtocolError: Length of pkt read 0005 does not match length prefix 2004

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/lib/python3.8/site-packages/dvc/scm.py", line 106, in clone
    return Git.clone(url, to_path, progress=pbar.update_git, **kwargs)
  File "/usr/local/lib/python3.8/site-packages/scmrepo/git/__init__.py", line 143, in clone
    backend.clone(url, to_path, **kwargs)
  File "/usr/local/lib/python3.8/site-packages/scmrepo/git/backend/dulwich/__init__.py", line 196, in clone
    raise CloneError(url, to_path) from exc
scmrepo.exceptions.CloneError: Failed to clone repo 'git@github.com:iterative/example-get-started.git' to '/tmp/tmp8mvwnvkbdvc-clone'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.8/site-packages/dvc/commands/ls/__init__.py", line 31, in run
    entries = Repo.ls(
  File "/usr/local/lib/python3.8/site-packages/dvc/repo/ls.py", line 31, in ls
    with Repo.open(url, rev=rev, subrepos=True, uninitialized=True) as repo:
  File "/usr/local/lib/python3.8/contextlib.py", line 113, in __enter__
    return next(self.gen)
  File "/usr/local/lib/python3.8/site-packages/dvc/external_repo.py", line 36, in external_repo
    path = _cached_clone(url, rev, for_write=for_write)
  File "/usr/local/lib/python3.8/site-packages/dvc/external_repo.py", line 162, in _cached_clone
    clone_path, shallow = _clone_default_branch(url, rev, for_write=for_write)
  File "/usr/local/lib/python3.8/site-packages/funcy/decorators.py", line 45, in wrapper
    return deco(call, *dargs, **dkwargs)
  File "/usr/local/lib/python3.8/site-packages/funcy/flow.py", line 274, in wrap_with
    return call()
  File "/usr/local/lib/python3.8/site-packages/funcy/decorators.py", line 66, in __call__
    return self._func(*self._args, **self._kwargs)
  File "/usr/local/lib/python3.8/site-packages/dvc/external_repo.py", line 232, in _clone_default_branch
    git = clone(url, clone_path)
  File "/usr/local/lib/python3.8/site-packages/dvc/scm.py", line 108, in clone
    raise CloneError(str(exc))
dvc.scm.CloneError: Failed to clone repo 'git@github.com:iterative/example-get-started.git' to '/tmp/tmp8mvwnvkbdvc-clone'
------------------------------------------------------------
2022-04-01 12:27:58,009 DEBUG: Analytics is enabled.
2022-04-01 12:27:58,053 DEBUG: Trying to spawn '['daemon', '-q', 'analytics', '/tmp/tmpfukqgasg']'
2022-04-01 12:27:58,054 DEBUG: Spawned '['daemon', '-q', 'analytics', '/tmp/tmpfukqgasg']'

```