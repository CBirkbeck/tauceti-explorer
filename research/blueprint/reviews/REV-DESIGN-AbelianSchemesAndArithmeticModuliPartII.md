# Independent review: abelian schemes and arithmetic moduli, Part II

Accepted as a complete **target-level planning pass**, with explicit proof and interface gaps. This review does not certify the proposed theorems as formalized or all their proofs as closed.

Reviewer: Codex — codex-7e92bd, `independent-review-REV-DESIGN-AbelianSchemesAndArithmeticModuliPartII`, 2026-10-05. Original author: Codex — codex-rtOQ9t. Issue #3483 was claimed in comment 5986096499 and confirmed by bot comment 5986097484; the full issue was reread after confirmation. The five historical inputs are authenticated at `e6f2f81d6427d3212512b6f126985c12d79a78a6`.

## Counts and coverage

All 115 existing nodes were checked: ten definitions, eight constructions, three comparisons, 30 lemmas and 64 theorems. No nodes were added or removed. There are 59 API items, 56 tests, 29 planets, 13 baseline declarations, 37 supplier requests and 47 explicit gaps. All 17 stages remain planned; none is closed. Every definition and construction has at least three tests, and all implementation statuses remain unchecked.

All 94 targets from the six accepted paper routes retain their disposition. The tensor-symmetric-power route now explicitly includes shuffle multiplication, divided-power comparison and multigrading. The Gao–Ge–Kühne degeneracy route now explicitly includes the separate closedness target. This avoids treating a set definition as its closedness theorem. The aliases for the three branches remain provenance for one parent-based design.

`SourceChecks.json` records a passage-specific locator, short anchor, explanation and reading method for every node. `Changes.json` records 133 substantive node-field edits with before/after values and reasons. `AllChanges.json` additionally records every changed packet/definition field, including source checks, route coverage, review metadata, requests, gaps and the prototype receipt. These artifacts are publicly recoverable below.

## Corrections

1. **Integral tensors and Poincaré bundles.** Restrict the multigrading isomorphism to finite projective or locally free summands: tensoring invariants with a nonflat factor can fail. Retain the arbitrary-module invariant carrier and the separate degree-completion convention. Use the parent A1 carrier, the correct inverse for the equivariance map, and explicit closed-unit hypotheses. In multivariate symmetrization the orbit-basis coefficient is a product of factorials, not uniformly the total-degree factorial. Keep the completed ordinary Poincaré cohomology formula separate from an unspecified connection/de Rham analogue. The source's noetherian CM model, unramified prime and ordinary CM type are explicit; its formal union and inverse-limit coordinate rings have opposite directions. Correct the tangent-basis convention and the torsion-splitting moment codomain. Remove the complex smooth-connection prerequisite from the construction over C_p.
2. **Betti maps.** Retain the regular base locus, total complex dimension and smooth image point. The source-normalized Betti form is twice the polarization form, with the polarization-type factors included. A new type-(1,2) regression requires periods 2 and 4. The pointwise kernel argument and identity theorem justify the rank characterization. Fixed parts and equivariant Hom belong to Hodge H.2 and parent A5, not period-domain stage H.3. Distinguish actual and geometric function-field traces; retain both zero-dimensional endpoints of the curve induction, integer word lengths and the collision-kernel condition. The final curve theorem needs the separately recorded extension/finite-maximality inputs.
3. **Mixed Ax–Schanuel and fibre powers.** Keep positive graph dimension and the block conclusion of counting. Stabilizer normality is obtained after the very-general-pair reduction; it is not asserted for every original pair. Request finite normalized subgroup data, not finiteness of redundant translating vectors. Generic modular fibre dimension does not control exceptional fibres: the unrestricted pullback formula for degeneracy loci is removed, and a global closedness proof handling exceptional loci is an explicit gap. Retain the threshold parameter throughout the quotient criterion. A branched-graph test separates pointwise rank drops from algebraic degeneracy. Fibre-power induction uses an explicit equivariant shear, neutral components of endomorphism kernels and the difference-image version needed by DGH.
4. **Finite-field realizations.** Tate Hom is over the stated finite field, not geometric Hom. Compactness uses proper bounded preimages, and a limiting endomorphism need not be an isogeny. Retain the exact reciprocity coefficient range and the independent separability of one minus Frobenius for point counts. At p, preserve perfectness, finite integral Hom bases, saturation through the entire finite-flat kernel, semilinearity, block dimensions and opposite-algebra conventions. Resultant recognition uses a determinant over the finite free quotient by the factor; total-resultant congruence at precision 2n alone cannot prove a slope of higher multiplicity.
5. **Lattices and adelic classes.** General-q markings use the inverse image under the contravariant Dieudonné map and the corresponding inverse action. At q=p a linear dual restores covariance; it is not Cartier duality. Equivalence of markings uses actual isomorphisms. Replace the incorrect Weil-restriction supplier by parent A3's finite-flat quotient. Distinguish all lattice classes from a locally free ideal genus. Make the projected graded lattice profile, Sylvester fibres, local discriminant weights and stabilizer index explicit. Request the missing exact producers from GN.2 and the adelic group, class-finiteness and level-comparison interfaces from AA.1/AA.3/AA.4. Preserve the real-quaternion case, the center completions and the narrow class group.
6. **Polarizations and counts.** Use rigidified Picard descent and request the all-characteristic symmetric-morphism/polarization dictionary. Correct the ambiguous versus strongly ambiguous class in the norm proof and the maximal CM unit group in the global index. Retain the fixed CM field in the elliptic-power mass estimate, the coefficient one half, automorphism weights and the prime-field/nonreal assumptions. The nine quadratic squareclasses require a natural-density Chebotarev supplier. Separate p≥5, p=3 and the genuine p=2 elliptic counterexample. Reuse Mathlib's Newton recurrence, retain q-reciprocity and inclusive power-sum intervals, and distinguish the upper count from the ordinary lower bound. The main target is log B(p,g)=O_p(g²); the 69/4 coefficient requires a specified uniform local estimate and remains conditional. The final probability statement excludes squarefree nonreal classes; its complement is not identified solely with repeated factors.

The roadmap descriptions, ordering, direct dependencies, coverage lists and suggested-file omission ledger are synchronized. Truncated planet names were replaced by mathematical names. The author's reader and handoff are not authorized edit paths: they remain historical inputs. Every incoming node statement, proof step, API/test statement and acceptance text was matched against that reader; its independent introductory and chapter prose was read. The reviewed packet and this report supersede the affected passages, especially the old parent A0/H.3 references, bibliography, counts and compile receipt.

## Baseline and source findings

All twelve incoming baseline references were confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; none was removed. They are TensorPower; PiTensorProduct.reindex, reindex_tprod and map_reindex; LinearMap.eqLocus; Submodule.mem_iInf; DividedPowerAlgebra; AddCircle; Polynomial.resultant; PadicInt.appr_spec and valuation; and TauCeti.symmetricTensors. The last is only the degree-two flip-fixed submodule. The native p-adic valuation maps zero to zero, so the nonzero-resultant guards are essential. Added `MvPolynomial.mul_esymm_eq_sum`: the generic Newton recurrence is already present; only its evaluation and reciprocal-polynomial adapters are new. The full parent audit and the relevant parent and external supplier statements were read; requests describe missing interfaces rather than installed library theorems.

Fresh downloads matched all 17 incoming PDF hashes. The main additional public texts are [Lundkvist's counterexamples](https://arxiv.org/pdf/math/0702733v2), the [published Betti-rank paper](https://compositio.nl/Content/prize2025_Gao.pdf), its [author corrigendum](https://ziyangjeremygao.github.io/articles/ErrataBettiRank.pdf), and the [current mixed Ax–Schanuel author copy](https://ziyangjeremygao.github.io/articles/MixedAS.pdf). Waterhouse–Milne and Milne1968 were checked from page images because their text extraction was empty. The Milne1968 catalog entry named the wrong article; the actual scan is *Extensions of abelian varieties defined over a finite field*, Inventiones5(1968),63–84.

Sixteen source findings now have this review's verdict and reason. They cover two unrestricted module statements and a moment-codomain slip in Kings–Sprang; the exceptional-fibre identity, lost threshold parameter, equivariant shear and kernel terminology in Gao's published Betti paper; its already published pointwise-rank correction; redundant translations and a reversed fibre arrow in the mixed Ax–Schanuel author text; the factor in V=pF⁻¹; the marking equivalence in Lee; and four local notation/positivity/degree slips in Lemmermeyer, Conrad, DiPippo–Howe and Lipnowski–Tsimerman. These findings do not assert that the papers' ultimate main theorems are false. In particular, the global closedness and finite-normalized-data targets remain with explicit proof gaps.

All 41 inherited source-issue references have an independent, version-scoped check. The stronger historical claim that the exact 69/4 bound is already justified is not adopted; neither is the repeated-root proof of the 45/4 refinement. Historical references to journal collation are not new claims to have read those inaccessible journal texts. Annals Kings–Sprang, Duke LT, IMRN Lee and JRMS Lemmermeyer PDFs were not obtained; Cambridge's mixed Ax–Schanuel PDF URL returned an abstract page. Findings for those texts are explicitly scoped to the accessible versions. Correction searches are bounded and do not establish novelty. The published Betti text and its known corrigendum were both read at the finding locations.

## Verification and remaining work

The actual packet checker passes with zero errors and zero warnings. Source-issue schema, intake path/independence rules, immutable input guards and exact six-paper routing are checked by the recovered verifier. Read-only atlas assembly preserves foreign mathematical payloads and existing edges. Its stage and scoped declaration graphs are acyclic. At the mathematical input commit, live Hodge H.2 and Jacobian JC2/JC7 links are pending; the proposed-supplier comparison includes their reached StableReductionPartII dependency and resolves them. At publication baseline `bef3b6799b31c2e4bc6182aa5dad81fdd9024094`, only the two Hodge H.2 links remain pending. Adding that actual proposed supplier in the read-only comparison resolves them. Both comparisons are acyclic and neither promotes a roadmap.

The entire final suggested Lean file elaborated independently with zero errors, 17 admission warnings and no other warnings. The run authenticated all 2,025 imported Mathlib modules and package pins, began with 34 GiB available, ran serially with an 8 GiB limit and a 20-minute timeout, and built no library. It checks two native carriers, seven API signatures, six examples and three polynomial theorem signatures. The other 110 nodes and their APIs/tests have individual omissions. No geometric signature or theorem is certified by this typing check.

Exact finite regressions verify seven shifted-resultant valuations, the characteristic-two elliptic curve with two F₂-points and eight F₄-points, independence of the nine CM quadratic squareclasses, and the distinction between a full Vandermonde and the unequal-value product with multiplicities. These computations catch convention and precision mistakes; they do not prove the general assertions.

The orchestrator should retain all 47 proof/interface gaps and 37 requests, arrange the proposed supplier integrations, and regenerate the historical reader under an issue authorizing its path. Priority proof work includes vector-extension representability, formal-functions comparisons, global degeneracy closedness across exceptional fibres, normalized mixed Ax–Schanuel finite data, Honda existence, local lattice estimates, and the correctly normalized Hermitian mass inputs. No foreign roadmap, library audit or promotion machinery was edited.

The authenticated artifacts and recovery instructions below are the handoff for this review.

## Public recovery and handoff

Archive commit `7e9d7da515218bb9c0ad9e888ff1c84908b3bcc1` is an ancestor changing only the allowed suggested file. It contains 42 inert named artifacts, including 9 exact Python helpers. Manifest SHA256 `9306b5bbd67d90584db16845f7d1829ef191ea73d7332bd7f3e0c46a9fd50e13`; payload SHA256 `e660a8a5a675c24f0190e4413b59b1c9954fd574fc44fede3e10c6b1cbbb5e7f`. The final suggested file contains no archive payload.

The retained evidence comprises the incoming packet, definition, suggested file, historical reader and author handoff; the claim receipt and input guards; public-source hashes, 115 source checks, 13 baseline checks, 94 target checks and the full correction ledger; the compiler preflight, 2,025-module source audit, log and typing receipt; the finite checks; both immutable repository verification reports, including the live and proposed supplier distinction; the reviewed deliverables; and the helper scripts. Full source PDFs, temporary search output and local checkout paths are not part of this archive. The editing helpers document the changes; replaying them additionally needs the publicly linked PDFs and their extracted page texts. The verification helper does not need those texts or a Lean installation.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It downloads the immutable public archive and all four final deliverables, authenticates every named artifact, and checks its own bytes against this report. Keep REPLAY_DIR outside a repository checkout. Inspect the recovered helpers, then from an existing repository checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv, SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the commit in base.txt to reproduce MathematicalVerification.json; both commits must exist locally.

The verifier checks all node-review and source-review records, retained input hashes, complete API/test name coverage (including honest omissions), the exact full suggested file and compiler log, and unchanged paper routing. It reruns the finite calculations and the actual immutable packet, source-issue, intake and atlas-assembly checks. It neither recompiles Lean nor proves admitted statements. The public recovery and both report comparisons were exercised byte for byte before submission. All helper files are included in the authenticated archive; no hidden scratch dependency is needed for verification.

## Script: recover.py

```python
"""Recover authenticated review evidence; never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='AbelianSchemesAndArithmeticModuliPartII'
ARCHIVE='7e9d7da515218bb9c0ad9e888ff1c84908b3bcc1'
MANIFEST_SHA='9306b5bbd67d90584db16845f7d1829ef191ea73d7332bd7f3e0c46a9fd50e13'
PAYLOAD_SHA='e660a8a5a675c24f0190e4413b59b1c9954fd574fc44fede3e10c6b1cbbb5e7f'
EXPECTED={'packets': 'a4cfd32db464be2e7e935070c073d3add46ce52173be146bb7c2326b545ae87d', 'roadmaps': '444741ba656f1e4ead75407906b20b9e1b9145585ad3c9d8b86053231e3641c0', 'suggested': '81257bf31beac0f86bc7757fca190959d0055a07e22258bbef252fb9d79e7109'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.rsplit('/- BEGIN ARCHIVED REVIEW EVIDENCE\n',1)[1].split('END ARCHIVED REVIEW EVIDENCE -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('roadmaps','json','Definition.json'),('suggested','lean','Suggested.lean'),('reviews','md','PublicReport.md')]:
 path='research/blueprint/'+folder+'/'+('REV-DESIGN-'if folder=='reviews'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
report=(S/'PublicReport.md').read_text();assert report.startswith((S/'ReportBase.md').read_text())
tag='\n## Script: recover.py\n\n'+chr(96)*3+'python\n'
a=report.rindex(tag)+len(tag);b=report.index('\n'+chr(96)*3,a);code=report[a:b]+'\n'
assert code==Path(__file__).read_text();(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
