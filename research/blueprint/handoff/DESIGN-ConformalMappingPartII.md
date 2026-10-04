# DESIGN-ConformalMappingPartII — planning handoff

Author: Codex — codex-rtOQ9t. Refs #3466.

The complete planning pass covers all 37 CDT routed targets in 98 declaration nodes: 10 definitions, 8 constructions, 38 theorems and 42 lemmas. It includes 68 API items, 54 unit tests, 41 planets and 37 personally checked pinned-baseline declarations. The definitive reader is approximately 14,000 words. Only the five authorized deliverables are changed.

## Coverage and exact continuation

O0, U0, S0, L0, H0, R0, F0, V0, G0 and M0 are all **planned**. None is closed. The packet is **complete** as a planning pass; every implementation status remains **unchecked**. All routed targets have node mappings, and all definitions/constructions have uses, APIs and at least three tests.

No mathematical theorem is claimed formalised. Resolve the eight supplier requests and the fifteen named gaps to close this graph. The gap records list their exact declarations and missing hypotheses, constructions or proofs. In particular:

- Supply complex-analytic initial-value convergence and the exact analytic atlas on the existing universal cover, followed by hyperbolic surface uniformization.
- Verify Hempel’s rationality/cusp proof, the native hypergeometric ODE and continued zero-balanced connection formula, uniform parameter derivatives and the log-Gamma Taylor/remainder proof.
- Identify the reflected polygon cover with the hypergeometric germ and settle the compatible positive derivative/cusp orientation.
- Supply generic quantitative Shimizu in **FuchsianOrbifolds, Part II**, preserving the existing owner of generic projective polygons and cusp geometry. Here retain only its Φ_N specialization.
- Finish the localized divisor/order, integrability and monotonicity adapters, then obtain effective fixed-level mean constants for every 2≤N<N₀. A large-N maximum estimate does not by itself prove the final all-N effective theorem.

The current statements preserve source corrections E2, E3, E8, E9, E15 and E16. They also retain the meromorphic-basis meaning of trivial local monodromy, the boundary/empty Blaschke conventions, analytic-germ branch guards, centre-pole log-r term, the strict rotated exceptional set with its sufficient threshold, and distinct Φ/Ψ/reflection group roles. No additional reciprocal-glyph erratum is asserted from text extraction.

## Verification and native boundary

The actual packet CLI checker, with the pinned declaration index, reports **zero errors and zero warnings**. Read-only assembly against the immutable publication base reports acyclic stage, own-node and scoped graphs, all 36 required supplier-stage pairs reachable, no unresolved references, no skipped links and no pending links. Foreign mathematical payloads are preserved; all new stage edges are incident to this roadmap. The exact graphs and read-path digest are in Verification.json.

The entire published suggested file elaborates on the already existing Mathlib build at 082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean 4.34.0-rc2 (commit 6a10ac8c22beadecabdbb0919c2b50214762f91d), serially, with zero errors and **61 admission warnings only**. The final preflight had 35 GiB available. Compilation uses one thread, an 8192 MiB Lean memory cap and a 1200-second timeout; no Lake setup, cache download, library build or language server is used.

The file contains nine actual scalar/functional definitions, 34 API signatures and 27 admitted examples. Its ten native nodes include the Schwarzian chain-rule signature. It individually omits 88 declarations and one comparison API requiring the exact Tau Ceti carrier. Every omitted declaration, API and test retains its name, mathematical statement and reason. The available compiled Tau Ceti tree differs from the recorded f790474821cf4256814db967cb154e7af3d0c369 source pin and is not imported. Native type elaboration establishes neither admitted mathematics nor the remaining geometric signatures.

The Schwarzian shape follows the personally read open Mathlib PR #24161 at 01d32bb7a38c19914993269bd1a45d9a553bb0c1, with iterated derivatives and its composition naming. Open PR #43859 supplies a compatible positive-log Jensen variant. Neither is counted as available at the pinned baseline. Existing unitDiscMoebius is imported conceptually for the interior Blaschke factor; the new wrapper extends only its boundary parameters.

## Sources and reading scope

The published source is [Calegari–Dimitrov–Tang, The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), JAMS 38 (2025), 627–702, DOI 10.1090/jams/1053. On 2026-10-04 the worker personally read §1.1.6 p.632, the Corollary 2.0.5 passage p.636, Lemma 2.3.1 and Remark 2.3.3 pp.639–641, all of §5 pp.667–678, and §6.1 plus the proof in §6.2 pp.679–684. No whole-paper reading is claimed. Original proofs in Hempel, AS92, Goluzin, Carathéodory, EGM, Tsuji and Kraus–Roth were not acquired where identified in the gaps. The six corrections are inherited and passage-confirmed, not new novelty claims or a new exhaustive correction search.

The complete ConformalMapping and UniversalCovers upstream readers, relevant reviewed library-audit targets and every cited supplier-stage description were read. Baseline statements were read in their actual Lean files; all those source files were compared byte-for-byte with the recorded pinned Git blobs. ReadReceipts.json records the precise scope and hashes. The repository contains no PDF or extracted source text.

## Public recovery and replay

The metadata below authenticates the four mathematical deliverables, six compressed artifacts and four exact helpers. Recover all five public deliverables from a fixed 40-character commit using recover.py; its raw-CDN fallback uses the public contents API at that same immutable commit. Recovery never executes Lean. No private scratch file is required by the recovery bundle.

A repository checkout containing the recorded publication base and the pinned declaration index is required for checker/assembly replay. Supply these as TAUCETI_REPO and TAUCETI_INDEX and run verify.py with the recovered directory. The helper reads the base through Git blobs in memory, does not materialize a repository snapshot and refuses repository writes. Compare its JSON report byte-for-byte to recovered Verification.json. Compiler replay requires an already compiled matching Mathlib/Lean build and is guarded by the same memory and time checks.

These commands use caller-supplied paths:

```bash
python3 recover.py "$RECOVERY" "$PUBLIC_COMMIT"
TAUCETI_REPO="$CHECKOUT" TAUCETI_INDEX="$DECLARATION_INDEX" python3 "$RECOVERY/verify.py" "$RECOVERY"
python3 "$RECOVERY/compile-pass.py" "$RECOVERY" "$PINNED_MATHLIB" "$PINNED_LEAN" Published.lean
```

Opening the job PR ends the claim; the worker deletes the job scratch after public recovery is verified and immediately selects the next eligible issue in WORKERS order. The retained public handoff is the complete continuation record.

<!-- CONFORMAL PLANNING PASS METADATA
{
  "base": "366566cf6684a97d26c4e242881adb44a6773ae2",
  "roadmapId": "ConformalMappingPartII",
  "agent": "Codex — codex-rtOQ9t",
  "claimComment": "5985153830",
  "botConfirmation": "5985154906",
  "publicHashes": {
    "research/blueprint/roadmaps/ConformalMappingPartII.json": "ca8328bbd3de0082584db40a750ac28c33a6e311d34531a40f5693ec6b571177",
    "research/blueprint/packets/ConformalMappingPartII.json": "10a79dec2ac44fa837363e3451e7441f86592d1e2af612333977046bda5b02d2",
    "research/blueprint/readmes/ConformalMappingPartII.md": "83d804e8e91cac36717619b4ff44202e1f35e55e6e9ea63756d4bb0304b7c560",
    "research/blueprint/suggested/ConformalMappingPartII.lean": "18eb373d0d3c9911a468b9b95e4766192b5bc2b2599f33385803880b60068252"
  },
  "artifacts": {
    "TargetWorklist.json": {
      "bytes": 34088,
      "sha256": "396ac2512656c159f9ddc9b0a8e8f6e568ea26ef2bb8a849f153bdf6c0767319",
      "encoding": "base64(zlib)",
      "data": "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"
    },
    "ReadReceipts.json": {
      "bytes": 11491,
      "sha256": "3fc995a7458176db263715dff256462e2a4baede5b389cce51714f7c8e36b7ca",
      "encoding": "base64(zlib)",
      "data": "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"
    },
    "Verification.json": {
      "bytes": 2685,
      "sha256": "e7e3a666993fbd6ef876735494fd4d06950057a5c340b5d741d39742d700cf74",
      "encoding": "base64(zlib)",
      "data": "eNqVVtuO3DYMfd+vMOYpAXYXlizLVvqUboJg0aSZZoK+FEFBSfSMur5VtveCIP9eyreZWXQL9G18SJHU4RE53y+iaKOhw82baJNImUppCilzASqzXBqBXPA8Z2C1ECCzLAHkm8twyhzQ3KGng9/pk4AW6LsPgW6gts5Cj9d/dU09upPdN2AraEeHpi4aX0H5CdrW1fst+P72dnHseuiHLviZpmpL7HGx1I3FYFD5DNy52nZrCQRYLFztekdp30Qsvlzw/oCNx4rAJF9B09Rd7wczux8NJVYVECL4iPyYs0HrbnusQkK5VDBQtq/Y9QFMxQy2JdQ4QoLNUCC5dDW+Q1OCh5Ay2JNsOeLR49+D61yPZzdaDhKWybXCwET0qj+4Lpp4fx3um7HVgUjchzNJcnaFPbQhOkuXplDOufr8SP8eu9t6Z5oWT1icDTdl06El/Bze0pXrEWfxxZxvg943PsT+49v4/QC+pnafIL4ZerQLqxMbm6ZyPaG/zt3Ox8o2NZF2jws4VTUlf/f2w1GG9+h7Z0afJE6XS6HdT7EytjQJzJMpnSGQNIBrzc1DHXK8FFM9j7iS/lLALvBoX6yRS/68RqWy/w45KsWj3Q1tWzr0W3AjzckoENKkx64p78d2zETTtXZ3rqVKPrr67qQDZvAe6/5t12Gly6ct0tut98+dmkqTBteE/8/7xETPHt2+/gT0ICtqqIFyC08ljYZuS0Wjn4oOt52ajg/v7ShH4yyV+bkun742nx/qL+s0WX3DtHAlzK95phofXX9D/TwR7KrKBTiRpWTn2C80YMIkssdnGw0ddhFld10XPhsqaR1dzeDNOEy3gy5dd0B7XSLU5/bdAXgqgxfLUSdZYmObGKUYAyFzrbRKUWRSMsV1qg3XPFWqSJIkT/M4yfNYyziWOU/5cWRaekjHuBpkIXSmJMlLiVQmaaoQ6YdQoAQqzDJtcoJYZkTGVJEbbpWxaQ5prIU9iUtsHeMaxNRYAVYqOo9pwZIcaDuwLFYCmC2YQY6KKregclXwwgieKSbTFDTKYokL90Cd0iV+cD8H3S7jKHD1OwlmauHmI31Gr+4nIBLXibiOr7zhl9FjLv+U4mqo72pS9hUNyOHxal8PlxGpgMZHJIHFYOhaXCNQ90BbrWPFFNGZxpwRv7xQzF5GX5Cydvh6qY1keSidvhnjhCrinCO3SYa5joVMBIuN1WnCkTFGZCQ2BepVJpYAPQwGe7cbe30MU2QqFpnIOTOFID5zJqxWMjOapQIzKEgGJpHqWZibUdXjqyig7HDpDHoH5Yn8xyXn6a7jUFruglXjnz46KuHTyHROmlq8XYVBNEhrcDrE4+VFhJ1Cg3Xr6o7a4Qo3jZJludB+GzpH7dus+ya0aofgzeGGnnzdHy2uahvff/DQHo5g65umeHD0tGn3rCjQ2GqPn7/9ffytgVaCdzQgR+TbXOi8KrZTvd1pkVTHm6huIjMTGFFTPfinyNLoND3x8hOZ+8jVEToaRz6a/tLYaKqYDtLWPcs2raB363+MHY0y+q/ip81w5vR2e7tuNXFmef8I4V9NsPDszHK+215ahCf480zsRMLreA1MdzfT1RYRrZvEVdXQh4f4hZSzpWNjnpT/u/E4CJTFWKcqkyxIloPkLDc6LxJlFQMOIrWCxkoap0mRM8m5klaioDEmihiyZHPx4+IfLdr5ZQ=="
    },
    "Compilation.json": {
      "bytes": 1240,
      "sha256": "02e5076be9716c9a63e0fcde06d5202ca9cd82f224173cb3ac38623bb8c28e58",
      "encoding": "base64(zlib)",
      "data": "eNpdVF2P7DQMfd9fEc0TSLurJE3S5PIEC7q64oIGVuIFIeQk7ky0bTqk6X4I8d9xW2ZnLi9VfGL72MdO/75hbIevqT6MEXcfGL9dgVLGMr2bL1ByyocFMOIa+THlSOAuYuihQE1jZvOEE4M4pGlazDH3b7s1ZhrnEhaO3X72fZqOGO97hHx9+3gEqc3iIyz6pm0ij01wTghQxnrnnUbVGiOc9NoH6aV2rmuaxmrLG2u5N5wbK7X8L2uN41wvWT2YTvnWmUYap7RptHaIdFAOnEKHbeuDJUi0QbXCdTbI6ELUFjT3Kr5nJYUuWQOiDlFBNI6iUXeisSAgipY7BSJ2IqBER1VHcNZ1sgtKtk4YrcGj6bas8AypB9/jx/QdZW30ii4K/YZl0XKh+kwm++p5A5i6b9Q9vytB3rJXa/406m7OT3l8yXd9yvPr3SHPtyyMw5AqMyA4BGpIegSaGPjoPXfCkYyaS0G6ys6JeMt+RWKd8OutrgHqsU/+Yc2y1MCtRBmbFq3nyjRK8BC9biQKIUiGJmqgCbVqC68wB6zpcZ3vJUnXOq5aZaUInSIdrVDRO9MGL7TCFjoafWiM+yIJhZ9Sj8vOddBPuE0DS4KeoFrmDanHQh0u67pt64DDWN4+J6L+adXW0v5snmnAZUEwjHkLkHzb+ROEJzjgPuWJ5E9dWll/p6vlsod5SjSqtTq2jeURoYTjQ58w1zOehtNY6scCp+MZOpVx7F5SPGCdzhjgNJ7Oxi9/nU8eaiVunHZk/7GWNVIPFeN+q266lES8H1gel2GvEjEaWYHyxmIqGCr1/w1dV5Yyw1SPWFg4Yngix61GCsx44cn0mJ/xe+xSTsuzfkwHguayUrorl2/3nz5VHBa4UVf4D68wnPrVXbZX+M/0n1mF5tf9nFFrv0D/zyDeFxLpkwL0+0XN6WFr5bwWN//c/AuOB2za"
    },
    "Lean.stdout": {
      "bytes": 4332,
      "sha256": "ba6f4b79632694563559ee45649a94e9e77bc89ee17c4719f8c2d9cd58a50b4d",
      "encoding": "base64(zlib)",
      "data": "eNqll82O0zAUhfc8hRWxAKktsRM7P6ygi2HBAmYQG4QYJ7lNrLpOsJNpK8S7j9NZIyGdTRQ7Pp+v77GvlT/J5OlgTT/MSc2SQN5oy+hiwmxczybjHHWsWYztkg1L9JM2VjeW7szHOD6TsW/S7VH3FGL7RzJZvQQTB6yjP5N2D6R9O+ytITevfeY0jX6+83oa1ubkx/FwNl1Pc7hNQGGc1pevv9dno+c5hhThP2NrPJnY7G4TRWLN3Mja8TQZG2O0pvHaX1lnPLXz6K/v4+eZGcfIzAN51g7UHuPAlwii0NGNamOU38kHM7o1BWvQ7M3TSwfLd1m+S7e+FRt2KdUvlW8Xd3Tj2W2tcctl27tlswYRQ2NK81S3ZStEQ7qjVjdd06QVr1rRyFTwvFDiUPFuw+4pzhrobfL31euH/f2Hb/tP774sjTVhoG63RlRnslY1O2vvohE1izirvZ7XoJZAgT2G0fvr47/1JabPM1APzi/zOoX0CtSXmF7l2PoV6L8C818IbP0F6F8B+lcKbP0l6F8J+ldl2PorCeoLTM9TsIDwNEcB4BHgPEUBoAmcoy7wCgQINIkZaiN6E/JMoQA0iTlHAWA14JKDOZCoCxJ1QVYgQKEuKNQFhdaDArzVeIG6UKAulOi9UKI1sUpRgEABYBJFylFAjgIKEMDB0xj/p1AAuJGEALeyEBIFoC4IdCdmYE0UmUQB/2njM/4uyhE="
    },
    "Lean.stderr": {
      "bytes": 776,
      "sha256": "cee5cd4ad69bc8e5f138a1ad17094a1df1ce2e9619da989f2fc42791655abe6f",
      "encoding": "base64(zlib)",
      "data": "eNp9kk1vGkEMhs/Lr7CiVIJDyM4SCOwNIapGalrUNLkPu4YdmA869vLRX9+ZXapIIeI0kt/HHtuvk5kzRtoSlqjsGlgZLHO4ia+rGUSWpnD7fT79AXcbAXfPYzHJ4PZl9mv6e/btflEvtaIKy75GaW86ySuhb4pAl7BwtqReDqIvsk7yciJGcyGm/UEQF+gLtAxuBbPFK3ClCDZuCWvHOUxGXzrJXMsdYQndg9QaCu2Kbe9crMqNyYnAeYhvLJqnoj9MO8l0j16uEaiSPiQzHhlI/Q1J2+WJsWHfqdqeuVKyvMIRy2J7RWfHUn+iP8ujMrUBj6TKOC7hRTsDMchG2cN7sWtwU3MT5u56/FMrHy18uv/Zg13MXMlaM7WUsi1VaKlMxCSsvDT4AX0cPo6DHW9O15alP0GwqV3aQXFRYUDEcCg6yZPdX2FG4+D3IRjWfP5V6bCz1n5ldzVfhsOttXExCpnB2zCrQaLQG4XBLTcZH4UwDqp9PNgoqrWVmqBEHWL+HF00fjVb+7+0h3QSPpkfFUcjuW66+QeSCfk4"
    }
  },
  "helpers": {
    "immutable.py": "526ab7ebf0db3a4bc6dfbaada66326cf9d501e7e35f7c6cf4f11073f34e81892",
    "verify.py": "cd9441f4deb7032508d0975c157332cf046f506c555d93ca22fc56028db47398",
    "compile-pass.py": "7736282c8db846e5c989b24817ac4d8ed0b13ca38fbae576ae98b6d00c9edd81",
    "recover.py": "5cd7ec89732e7a68e226d20f5a559d51e280413f00443ee2fdd62f59385a0576"
  }
}
END CONFORMAL PLANNING PASS METADATA -->

## Script: immutable.py

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('STABLE_VALIDATE_BASE', '366566cf6684a97d26c4e242881adb44a6773ae2')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## Script: verify.py

```python
"""Read-only validation of this new roadmap against the immutable publication base."""
from pathlib import Path
import collections,copy,hashlib,json,os,re,sys
S=Path(sys.argv[1]).resolve();R=Path(os.environ['TAUCETI_REPO']).resolve()
RID='ConformalMappingPartII'
BASE='366566cf6684a97d26c4e242881adb44a6773ae2'
os.environ['STABLE_VALIDATE_BASE']=BASE
sys.path.insert(0,str(S));import immutable
immutable.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,blueprints,build
p=json.loads((S/'Candidate.json').read_text());d=json.loads((S/'Candidate-roadmap.json').read_text())
reader=(S/'Candidate-reader.md').read_text();lean=(S/'Published.lean').read_text()
ids={n['id']:n for n in p['nodes']};ownstage={RID+':'+s['key'] for s in d['stages']}
assert len(ids)==98 and len(ownstage)==10
assert p['status']=='complete' and all(c['status']=='planned' and c['remaining'] for c in p['coverage'])
assert len(ids)<check_blueprint.NODE_BUDGET==300
assert all(n['implementationStatus']=='unchecked' for n in ids.values())
assert d['area']=='analysis' and d['parent']=='tauceti:TauCetiRoadmap/ConformalMapping'
assert p['part'] is None and set(p['scope'])==ownstage
assert all(len(n.get('tests',[]))>=3 and n.get('api') and n.get('uses') for n in ids.values() if n['kind'] in {'definition','construction'})
assert {t['kind'] for n in ids.values() for t in n.get('tests',[])}<={'computation','degenerate','compatibility','characterisation','non-example'}
for n in ids.values():
 assert n['id'] in reader and n['statement'] in reader
 for a in n.get('api',[])+n.get('tests',[]):assert a['name'] in reader and (a['name'] in lean or n['id'] in set(p['prototype']['nativeNodes']) and a['name'].split('.')[-1] in lean)
native=set(p['prototype']['nativeNodes']);omitted={x['nodeId'] for x in p['prototype']['omissions']}
assert native|omitted==set(ids) and not native&omitted and len(native)==10
assert len(p['prototypeApiOmissions'])==1 and p['prototypeApiOmissions'][0]['name'] in lean
assert lean.count('/- Omitted ')==len(omitted)==88
assert len(re.findall(r'\bexample\b',re.sub(r'/-.*?-/', '', lean.split('/- Omitted ')[0], flags=re.S)))==27
assert not re.search(r'def\s+\S+\s*:\s*Prop|\w+\s*:\s*Prop\s*\n',lean)
for text in [reader,lean,json.dumps(p),json.dumps(d)]:
 assert not re.search(r'/(?:home|tmp|Users)/|file:'+chr(47)*2,text)
work=json.loads((S/'TargetWorklist.json').read_text())
routes={i['id'] for source in work for i in source['items']}
assert len(work)==1 and len(routes)==37
for source in work:
 assert hashlib.sha256((R/source['path']).read_bytes()).hexdigest()==source['sha256']
rc={x['id']:x for x in p['routedTargets']}
assert set(rc)==routes
assert all(x['nodes'] and set(x['nodes'])<=set(ids) for x in rc.values())
gapids={x for g in p['gaps'] for x in g['neededBy']}
assert all(g['detail'] and set(g['neededBy'])<=set(ids) for g in p['gaps'])
assert all(q['need'] and q['neededBy'] and set(q['neededBy'])<=set(ids) for q in p['requests'])
context=list(check_blueprint.world())
context[1].update({s:RID for s in ownstage});context[2].add(RID)
context[3].update({n:('blueprint',RID,'Candidate.json') for n in ids})
index=check_blueprint.load_index(os.environ['TAUCETI_INDEX'])
errors,warnings,summary=check_blueprint.check(S/'Candidate.json',index,tuple(context))
assert not errors and not warnings,(errors,warnings)
summary['packet']='Candidate.json'
packets,docs,definitions=blueprints.load_promoted(R)
assert not any(x[1]['roadmapId']==RID for x in packets)
# Add only proposed supplier roadmaps actually reached from this candidate.
defpool={x['id']:x for f in (R/'research/blueprint/roadmaps').glob('*.json') for x in [json.loads(f.read_text())]}
packpool={x['roadmapId']:(f.stem,x) for f in (R/'research/blueprint/packets').glob('*.json') for x in [json.loads(f.read_text())] if x.get('part') is None}
known={x['id'] for x in definitions};needed=set();queue=[p,d]
while queue:
 x=queue.pop()
 refs=[q for n in x.get('nodes',[]) for q in n.get('prerequisites',[])]+[q for st in x.get('stages',[]) for q in st.get('requires',[])]+[q['supplier'] for q in x.get('requests',[])]
 for q in refs:
  owner=context[1].get(q)
  if owner is None and q in context[3]:owner=context[3][q][1]
  if owner in defpool and owner not in known|needed|{RID}:
   needed.add(owner);queue.append(defpool[owner])
   if owner in packpool:queue.append(packpool[owner][1])
sp=[packpool[r] for r in sorted(needed) if r in packpool and not any(z[1]['roadmapId']==r for z in packets)]
sd=[defpool[r] for r in sorted(needed) if r not in known]
def assembly(candidate,supplier=False):
 build.load_promoted=lambda *args:(copy.deepcopy(packets+(sp if supplier else [])+([(RID,p)] if candidate else [])),copy.deepcopy({**docs,**({RID:'research/blueprint/readmes/'+RID+'.md'} if candidate else {})}),copy.deepcopy(definitions+(sd if supplier else [])+([d] if candidate else [])))
 return build.assemble(require_distances=False)[0]
current=assembly(True);currentown=next(r for r in current['roadmaps'] if r['id']==RID)
expectedPending=currentown.get('pendingLinks',[])
assert not currentown['blueprint']['skippedLinks'],currentown['blueprint']['skippedLinks']
a=assembly(True,True);b=assembly(False,True)
stages={s['id']:s for s in a['stages']};stageids=set(stages)|set(context[1])
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(ids)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks'), (ar[RID]['blueprint']['skippedLinks'],ar[RID].get('pendingLinks'))
# Suppliers gain the new consumer links. Their mathematical fields remain identical.
def payload(x):return {k:v for k,v in x.items() if k not in {'consumers','requires','prerequisites','stages','edges'}}
assert all(payload(ar[x])==payload(br[x]) for x in br)
bs={s['id']:s for s in b['stages']}
assert all(payload(stages[x])==payload(bs[x]) for x in bs)
se={(e['source'],e['target']) for e in a['stageEdges']}
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert oldse<=se and {e for e in se-oldse if not any(v.startswith(RID+':') for v in e)}==set()
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for u,v in edges:
  if v not in out[u]:out[u].add(v);indeg[v]+=1
 todo=[v for v in vertices if not indeg[v]];count=0
 while todo:
  u=todo.pop();count+=1
  for v in out[u]:
   indeg[v]-=1
   if not indeg[v]:todo.append(v)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:12]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(ids)
todo=list(ids);seen=set();edges=set();baseline=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for q in world[n].get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:baseline.add(q);continue
  edges.add((q,n))
  if q in world:todo.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,unresolved
edges|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
edges|={(q['supplier'],n) for q in p['requests'] for n in q['neededBy']}
def stageof(v):
 visited=set()
 while v in world and v not in visited:visited.add(v);v=world[v]['parentStageId']
 return v
required={(q,RID+':'+s['key']) for s in d['stages'] for q in s['requires']}
required|={(stageof(q),stageof(n)) for n in ids for q in ids[n]['prerequisites'] if q in world or q in stageids and not q.startswith(('mathlib:','tauceti:TauCeti.AlgebraicGeometry.'))}
required|={(stageof(q['supplier']),stageof(n)) for q in p['requests'] for n in q['neededBy']}
required={e for e in required if e[0]!=e[1]}
following=collections.defaultdict(set)
for u,v in se:following[u].add(v)
def reachable(u,v):
 todo=[u];seen=set()
 while todo:
  w=todo.pop()
  if w==v:return True
  if w not in seen:seen.add(w);todo.extend(following[w])
 return False
assert all(reachable(*e) for e in required),[e for e in required if not reachable(*e)]
comp=json.loads((S/'Compilation.json').read_text())
assert comp['exitCode']==0 and comp['errors']==0 and comp['warnings']==61
assert comp['sourceSha256']==hashlib.sha256(lean.encode()).hexdigest()
assert comp['stdoutSha256']==hashlib.sha256((S/'Lean.stdout').read_bytes()).hexdigest() and comp['stderrSha256']==hashlib.sha256((S/'Lean.stderr').read_bytes()).hexdigest()
assert p['prototype']['compiled'] and not p['prototype']['geometricSignaturesCompiled']
assert p['prototype']['compilationReceipt']==comp
report={'base':BASE,'checker':summary,'errors':errors,'warnings':warnings,'routedItems':37,'omittedNodes':88,'nativeNodes':10,'stageDAG':dag(stages,se),'ownNodeDAG':dag(ids,{(q,n) for n in ids for q in ids[n]['prerequisites'] if q in ids}),'scopedDAG':dag(stageids|seen,se|edges),'requiredSupplierPairs':len(required),'unresolved':[],'ownSkippedLinks':[],'currentAssemblyPendingLinks':expectedPending,'combinedSupplierAssemblyPendingLinks':[],'combinedSuppliers':sorted(needed),'foreignMathematicalPayloadsPreserved':True,'newEdgesIncidentOnlyToOwnRoadmap':True,'compilation':comp,'immutableReadPaths':len(immutable.READS),'immutableReadPathSha256':hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()}
print(json.dumps(report,indent=2))
```

## Script: compile-pass.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs)
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j1','-M8192',str(out/name)],env=env)
sys.exit(result.returncode)
```

## Script: recover.py

```python
"""Authenticate and recover this pass from public HTTP; never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,urllib.error,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True);head=sys.argv[2]
assert re.fullmatch('[0-9a-f]{40}',head)
root='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
sha=lambda b:hashlib.sha256(b).hexdigest()
paths=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+'ConformalMappingPartII.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def fetch(path):
 try:
  with urllib.request.urlopen(root+head+'/'+path,timeout=30) as r:return r.read()
 except urllib.error.HTTPError as e:
  if e.code!=404:raise
  # Newly pushed commits can temporarily have negative raw-CDN entries.
  # The public contents API still identifies the same immutable commit.
  url='https://api.github.com/repos/CBirkbeck/tauceti-explorer/contents/'+path+'?ref='+head
  req=urllib.request.Request(url,headers={'Accept':'application/vnd.github.raw+json'})
  with urllib.request.urlopen(req,timeout=30) as r:return r.read()
public={path:fetch(path) for path in paths};handoff=public[paths[-1]].decode()
meta=json.loads(re.search(r'<!-- CONFORMAL PLANNING PASS METADATA\n(.*?)\nEND CONFORMAL PLANNING PASS METADATA -->',handoff,re.S).group(1))
assert meta['base']=='366566cf6684a97d26c4e242881adb44a6773ae2'
assert set(meta['publicHashes'])==set(paths[:-1])
for path,h in meta['publicHashes'].items():assert sha(public[path])==h,path
for name,m in meta['artifacts'].items():
 assert Path(name).name==name and name not in {'.','..'}
 b=zlib.decompress(base64.b64decode(m['data']));assert sha(b)==m['sha256'] and len(b)==m['bytes'],name
 (S/name).write_bytes(b)
f=chr(96)*3
for name,h in meta['helpers'].items():
 assert Path(name).name==name and name not in {'.','..'}
 code=handoff.split('## Script: '+name+'\n\n'+f+'python\n',1)[1].split('\n'+f+'\n',1)[0]+'\n'
 assert sha(code.encode())==h,name
 if name=='recover.py':assert code==Path(__file__).read_text()
 (S/name).write_text(code)
for path,name in zip(paths,['Candidate-roadmap.json','Candidate.json','Candidate-reader.md','Published.lean','Candidate-handoff.md']):
 (S/name).write_bytes(public[path])
receipt=dict(publicHead=head,artifactsAuthenticated=len(meta['artifacts']),helpersAuthenticated=len(meta['helpers']),publicDeliverables={p:sha(b) for p,b in public.items()},base=meta['base'],LeanExecuted=False)
(S/'PublicRecovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
