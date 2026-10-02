# BP-AnabelianGeometryAndNonabelianChabauty — actual quotient cocycle descent checkpoint

Codex — codex-a71f92; 2October2026; Refs #1020. Claim5960047412, confirmed by bot5960049306. Whole issue read before claiming and reread after confirmation. Audit base 804df52206c95795837fda47eb802cd55d9a1d1b includes the predecessor PR #5841.

Publication base ca90231203e7a46dda900c23269053a78f3f929e: the four owned deliverables and governing instructions, reviewed library audit, reserved identifiers and roadmap input are unchanged. Checker, intake and complete atlas comparison were rerun against this base; the graph receipt below is unchanged. The public reconstruction recipe was executed against both immutable proof commits and reproduced the checked Native and Sketch bytes exactly.

## Established sub-obligation and precise frontier

All62 prior statements and62 complete node objects are unchanged. Seven declaration-sized nodes add actual quotient cocycle descent and uniqueness, actual cocycle inflation, both recovery identities, their genuine subtype equivalence, and exact N-fixed quotient gauge witnesses. Native Mathlib already supplies the quotient automorphism action on the native FixedPoints.subgroup N U, so no action or fixed-point carrier is replanned.

For arbitrary normal N, a continuous nonabelian cocycle c identically1 on N descends to a continuous actual cocycle on G/N with values in U^N. The quotient lift is a function lift, never a homomorphism lift of the generally nonhomomorphic c. The native quotient-map criterion proves continuity; no section is chosen and no Hausdorff, closedness, openness, compactness or discrete-coefficient argument is smuggled in. Inflation composes the native quotient projection, quotient cocycle and fixed-subgroup inclusion. Both inverse identities are equality of actual cocycles. These statements hold for groups endowed with topologies and their automorphism action; continuous group operations/joint action are not needed for these cocycle-level maps.

The fixed-witness lemma plus actual quotient induction proves an exact equivalence of global and U^N-valued quotient gauge witnesses. This does not yet define nonabelian H¹ inflation or prove H¹ injectivity. D3 actual pointed-set inflation and same-stage injectivity, D4 image=neutral restriction fibre, and D5 reverse-inclusion transitions/filtered-colimit bijection remain open. The additive/multiplicative canonical comparison to existing TauCeti descendZ1 is also open. General unipotent coefficient topologies and every NC.0 geometric omission remain unchanged. No stage or reserved key is closed.

## Read scope and native ownership

Read all seven reviewed AUDIT08 rows before planning, the current campaign document, all seven original stage descriptions/requires and seventeen touching extract edges; read all29 mentioning link-packet records. Those links are qualified negative screens, not fresh proofs of whole-source absence. All62 inherited mathematical statements and the relevant cocycle, fixed-value and gauge contracts were read. The full predecessor handoff, actual proof prefix and discrete-cocycle proof block were read, preserving their attribution. Nearby full HodgeStructures and JacobianChallenge documents were read for upstream convention/API/test density; their library-state prose is historical, not a new current-pin audit.

Fresh author-hosted Poonen PDF SHA256 42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579 matches the retained edition. Parsed Definition1.3.14 and full Proposition1.3.15 proof on printedpp.11–12 (PDFpages25–26) were read. The direct-limit reduction is motivation; the exact normal-quotient nonabelian proof here is derived, not attributed as a printed theorem. Screenshot returned no viewable image; no visual collation or whole-book reading is claimed. Fresh Stacks0A2H coefficient-definition/stabilizer passages were read; its abelian-module convention does not give generic H¹ a group law. No new paper error or full-paper route closure is claimed.

At exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, read the full OfQuotient file, its underlying normal-fixed-point action/coercion interface, native quotient topology, continuity criterion, coset relation/induction and representative/group formulas. Seven new named baseline citations reflect these positive interfaces. At exact TauCeti f790474821cf4256814db967cb154e7af3d0c369 read the Inflation file with its ambient hypotheses and proof: additive descendZ1, its representative formula and H¹ recovery are three additional baseline references, not new additive nodes. They do not apply to arbitrary noncommutative U. No full-library absence result is claimed from the focused search.

All requests, sourceVersions/sourceIssues/sourceCoverage, historical continuation records, scope, restructure proposals and eleven planet objects are unchanged. RT-AREA-algebraicgeometry/8 keeps NS/Picard number with A2 and its existing request. Chen/BDMTV routes and the shared generic-height Part II boundary remain open and unchanged; no NC.3→NC.0 cycle or reverse height dependency is introduced.

## Exact Lean receipts

Current immutable native proof archive: c584042364b9d867c12929bda16c59766a0afcaf, only the suggested-file path. It is an additional parent of the final PR commit, and itself retains prior native proof commit7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e as an additional parent. Full archive/imported file is not claimed compiled.

Native extraction: 442lines,17 examples(8 inherited,9 new),19 kernel audits,0 errors/0 warnings, no admission dependency. SHA256 301b64014da2e7819d4734dd0d116cbd5d92ffcf1fba377427e8ea087ae1f59b; normalized Lean-output SHA256 59f546ce8f7977b334a01381145c48335d2773213d92247d2750edd14b86480a. Maximum RSS3462660KiB, elapsed0:02.69,62GiB available before final run. Every axiom list is contained in propext/Classical.choice/Quot.sound. All nineteen current named declarations and nine tests have actual proof bodies in the archive/extraction.

Submitted Mathlib-only extraction: 1298lines,59 examples,0 errors,140 expected admission warnings,0 other warnings. SHA256 5121e8d1ad9f55a7317ddd1a94a8631e827c89746ee300782962d2e15e104ffe; normalized Lean-output SHA256 ec7deee6c684ff7021426b7a5ab2e4d75dbe5fe351baf8e48bb0adde7f7f6f34. Maximum RSS3496976KiB, elapsed0:05.21,62GiB available before final run. It removes exactly the TauCeti import and named Abelian section; all other actual suggested text remains. Current nineteen declaration and nine example bodies are admitted per PROTOCOL§13. **The full TauCeti-importing suggested file was not compiled**, because the exact pinned LowDegree compiled artifact remains absent. No library build/cache/update, Lake project or language server was used; one own Lean check ran at a time.

Exact recipe below takes text from the two immutable proof commits and the final submitted suggested file. It returns strings, writes no repository file, and performs no library setup. A reviewer may save each returned string in their own scratch space and run it individually in an already existing exact-pin build after the WORKERS memory check. Logs normalize only the invocation path and exclude the resource footer.

```python
from pathlib import Path
def reconstruct(prior, current, submitted):
    # prior: immutable 7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e suggested file.
    # current: immutable current native-proof archive suggested file.
    head = "\n".join(l for l in prior.splitlines() if l.startswith("import Mathlib.")) + "\n"
    head += "import Mathlib.GroupTheory.GroupAction.OfQuotient\n"
    prefix = prior[prior.index("noncomputable section"):
                   prior.index("variable [IsTopologicalGroup U] [ContinuousSMul G U]")]
    start = prior.index("-- Discrete cocycle descent continuation.")
    stop = prior.index("end TauCeti.NonabelianCohomology", start)
    native = head + prefix + "\nend Z1\nend Basic\n" + prior[start:stop]
    start = current.index("-- Quotient cocycle descent continuation, Codex codex-a71f92.")
    stop = current.index("end TauCeti.NonabelianCohomology", start)
    native += current[start:stop] + "\nend TauCeti.NonabelianCohomology\n"
    names = ["descend","descend_apply","descend_unique","inflate","inflate_apply",
             "inflate_trivialOn","inflate_descend","descend_inflate","descend_one",
             "inflate_one","descendEquiv","descendEquiv_apply","descendEquiv_symm_apply",
             "descend_proof_independent","descend_gauge_iff","inflate_injective",
             "descendEquiv_left_inv","descendEquiv_right_inv","descendEquiv_one"]
    native += "\n".join("#print axioms TauCeti.NonabelianCohomology.Z1."+n
                        for n in names) + "\n"
    broad = "\n".join(l for l in submitted.splitlines()
                       if not l.startswith("import TauCeti.")) + "\n"
    a = broad.index("section Abelian")
    z = broad.index("end Abelian", a) + len("end Abelian")
    return native, broad[:a] + broad[z:]
```

## Current plan and atlas receipts

69nodes:3 definitions,8 constructions,28 lemmas,24 theorems,6 comparisons. 72 total API items/59 tests;60 required definition/construction API items and50 required tests. Eleven planets,89 baseline references,9 gaps,16 requests. NC.0/NC.3 partial, five not_read, zero stages closed; all implementation statuses unchecked.

Indexed checker0 errors/0 warnings, actual four-file intake0 problems, whitespace/private-path and exact62-node preservation checks pass. Every new mathematical statement/API/test appears in the reader, and every new test name is present in the suggested file. The exact extraction matches the actual file bytes; no dummy carrier, assumed cohomology proposition or True-valued theorem is inserted.

Actual read-only assembler, retaining every other promoted part and forcing both the original/candidate packets for a fair checkpoint comparison: 2967 listed stage/planet vertices and8655 edges;69 own declarations and133 internal prerequisite edges;69 reachable declarations; endpoint-complete combined stage/parent/request/prerequisite graph3076 vertices/8893 edges. All three graphs are acyclic. All20 required roadmap, explicit stage-prerequisite and request-supplier paths are reachable. Own pending/skipped links empty, other skipped links and all stage edges unchanged. The additional backwards dependency traversal including baseline identifiers reaches176 identifiers, acyclic. Validator SHA2566cbcd78522e1ee11560edab7266dacd9d6d45800b7123429709afef3b74c84b6. No atlas/application/shared-worktree file was written.

## Resume

Construct the actual H¹ pointed-set inflation using these actual cocycle maps and exact fixed gauge witnesses, exposing base-point/representative formulas and proving same-stage injectivity. Respect the continuous-action hypotheses required to define that quotient action on continuous cocycles; import the pinned TauCeti native continuous fixed-quotient interface where its hypotheses apply. Prove image=neutral restriction fibre with the correct inverse neutralizing gauge; then build reverse-inclusion transitions and compact-discrete colimit bijection. Establish the canonical additive cocycle comparison with the existing TauCeti descent without replanning additive cohomology. Continue the earlier geometric G1, reserved étale K(π,1), source and API/granularity obligations exactly as retained below.

## Retained predecessor handoff (historical)

All following source/compile receipts and resume instructions describe the predecessor checkpoint, not this current run. They retain their original worker attribution.

# BP-AnabelianGeometryAndNonabelianChabauty — native discrete cocycle killing checkpoint

Codex — codex-J6LwjP; 2October2026; Refs #1020. Claim5959359411, bot confirmation5959362739. Full issue reread after bot confirmation. Read base `66270588b75628b25b1550d706f8587ebf227197`. The [immediately preceding full handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/66270588b75628b25b1550d706f8587ebf227197/research/blueprint/handoff/BP-AnabelianGeometryAndNonabelianChabauty.md) preserves the complete D1–D6/G1 mathematical arguments, finite regression program and earlier source-reading history. This checkpoint integrates the stated native preliminaries only; it does not replace the outstanding quotient/pointed-set/geometric proofs by an implementation claim.

## Result and scope

Eleven declaration-sized nodes are added to the existing NC.3 ownership: promoted identity/inverse values; the native cocycle one-fibre Subgroup; clopenness for discrete coefficients; compact normal-open killing; right- and normal left-coset constancy; pointwise coefficient invariance and membership in the imported native FixedPoints.subgroup N U; invariant same-stage gauge witnesses; simultaneous killing of a finite family with varying discrete coefficient groups.

The actual one-fibre K_c consists of g with c(g)=1. Identity, products and inverses follow from the fixed ordered nonabelian cocycle law. It is a subgroup, but generally is neither normal nor a group-homomorphism kernel. For discrete U the singleton{1} is clopen, so continuity makes K_c clopen. The existing compact-group clopen-neighbourhood theorem supplies an open normal N⊂K_c, with finite quotient by the imported open-subgroup theorem. No total disconnectedness of G, finiteness of U or abelian coefficient assumption is imposed.

If c|N=1, c(gn)=c(g). Normality gives c(ng)=c(g), so the cocycle law forces n•c(g)=c(g). The coefficient target is the actual U^N, not all U. If two such cocycles are gauge-equivalent by x, evaluation at n makes1=x(n•x)⁻¹; hence x is already N-fixed, without refinement. That pointwise witness fact does not construct H¹ inflation or prove its quotient-level injectivity. The finite-family proof uses one finite clopen intersection and the existing compact normal-open choice; infinite families are not covered.

Eight actual typed examples check the trivial one-fibre, continuous-homomorphism kernel compatibility, a concrete nonnormal S₃ coboundary, empty/singleton families, full-subgroup invariants/gauge witnesses and the native compact quotient finiteness. In S₃ the one-fibre contains the transposition(01), whereas its conjugate by(12) has nonidentity cocycle value, computed on the actual native permutations. The sample applies to every cocycle with that coboundary formula; no invented finite group or action is used.

Inventory:62 nodes(3 definitions,5 constructions,24 lemmas,24 theorems,6 comparisons),56 API entries(44 required definition/construction APIs),50 test entries(41 required definition/construction tests),11 planets,79 baseline declarations,9 gaps and16 supplier requests. All51 inherited statements and50 complete node objects are preserved; only the continuous-cocycles acceptance sentence is clarified to retain U^N. The reserved étale K(π,1) object, coefficient classes, sourceVersions/sourceIssues/sourceCoverage, requests, restructuring proposals, scope and planet objects are unchanged. NC.0/NC.3 remain partial, the other five stages not_read,0 stages closed. All implementation statuses stay unchecked.

## Actual reading and ownership

Read the full confirmed issue twice, current campaign README, seven original stage descriptions/requires and17 touching stage-edge records. Reviewed AUDIT08 NC.0–NC.6 targets/evidence/duplicates were read before planning; NC.3 owns the missing nonabelian layer, while native topology, subgroups, invariants and quotients are reused. The reserved K(π,1) node and relevant NC.3 cocycle/functoriality contracts were reread. All29 accepted link entries mentioning this roadmap were read: qualified negative screens, not independently established whole-source absence results. A focused cross-packet screen found the specialized nonabelian Shapiro/Weil-restriction application in ExcursionOperatorsAndSpectralAction--ES5, which does not supply these generic compact/discrete cocycle preliminaries. Earlier unrelated packet/source receipts keep their attribution; no fresh whole-packet/transitive-supplier or whole-library absence claim is made.

Fresh [Poonen author-hosted PDF](https://math.mit.edu/~poonen/papers/Qpoints.pdf): parsed Definition1.3.14 and opening finite-to-infinite argument of Proposition1.3.15, printedp.11. Independently downloaded PDF SHA256 `42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579`, matching the retained edition. The complete proof was read earlier in this continuous worker history, rather than freshly in this job. Browser screenshots returned no viewable image; local rendering libraries were unavailable. No fresh visual PDF verification is claimed. Fresh [Stacks0A2H](https://stacks.math.columbia.edu/tag/0A2H): Definitions59.57.1–2 and the discrete stabilizer/continuous-versus-nondiscrete conventions. That source concerns abelian modules and does not make nonabelian H¹ a group. The specific compact/discrete arguments here are authored deductions, not numbered Poonen/Stacks theorems. No new source error, full-paper collation or rerun of the predecessor45-action regression program is claimed.

At Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 read the complete ClopenNhdofOne file, and the ten additional positive native declarations with relevant ambient hypotheses: clopen singleton/preimage/finite intersection, normal conjugation, fixed-subgroup membership, compact open quotient finiteness, Subgroup and native ConjAct/toConjAct/conjugation formula. Exact statements and roles are in the packet/reader. Other prior baseline receipts keep their attribution. TauCeti remains at f790474821cf4256814db967cb154e7af3d0c369. Full nearby HodgeStructures/JacobianChallenge documents had been read in this continuous session; no new full algebraic-curves document reading is claimed.

## Exact Lean scopes and inherited corrections

[Immutable actual proof source](https://github.com/CBirkbeck/tauceti-explorer/blob/7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e/research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean), commit `7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e`. It contains actual bodies for all12 new named declarations and8 examples; the two promoted existing APIs and inherited extensionality/constant-cocycle instance are given actual proofs in the extraction prefix. The exact proof extraction plus15 axiom prints compiled with0 errors/0 warnings in1.40 seconds, maximum RSS3,484,740KiB,66GB available before compilation. Every audit list contains only a subset of propext, Classical.choice and Quot.sound, with no admission axiom. The public full source is a proof snapshot for this extraction, not a claim that every inherited section compiles.

PR-head admits all20 new bodies per PROTOCOL§13, with equivalent exact declaration signatures; the native one-fibre record body becomes an admitted construction of that same Subgroup type. Its narrow extraction has8 examples,0 errors,24 admission warnings(4 inherited+20 new),0 other warnings,1.40 seconds,maximum RSS3,469,980KiB,66GB available. The broader Mathlib-only extraction removes precisely the TauCeti import and named Abelian section; it includes all other actual source text and all native smoke/omission material. It has50 examples,0 errors,112 admission warnings,0 other warnings,4.00 seconds,maximum RSS3,512,112KiB,66GB available.

The broader run exposed inherited type errors, repaired in the final suggested file: discrete example topology/continuity binders; explicit coefficient action on the C₂ coefficient group(avoiding its unrelated self-multiplication action); explicit G in the connecting example; the correct Twist target coercion; torsor inherited variable scope and registration of its instance fields; and a duplicate universe declaration. No mathematical packet statement changed. **The full TauCeti-importing suggested file was not compiled** because the required exact pinned TauCeti ContCohomology.LowDegree artifact is absent. The Abelian comparison remains unverified; geometric contracts remain mathematical omissions. No Lake setup/update/cache, library build or language server was used.

SHA256 receipts:

- Public full proof source: `a41f414b999b43eab842fe90129e4035a39ee425d9859226087bbba6dc4cd950`.
- Proof native extraction: `fa99c575b9b2e70a5df159db809b4e7901a67e8756c16db8bf7d84f28d44cdbc`.
- Proof extraction with15 axiom prints: `d663e14afda4cc4202d8c2691634a0ce7f80c2427b535ecc5d876fd0faf22b12`.
- Proof audit log: `4798be07a267ca7e509cff53da12d7e313737b5a3702e19d0d67d407fca2324d`.
- Submitted full source: `9e28aa852cea4e109f5f896d47aef30403015439d661c7efc7a8c44f153e98f6`.
- Submitted narrow native extraction: `efa66da9722adcfc74ee0c1ebe47014fa775177919dd67cafe597a38823483fe`.
- Submitted narrow log: `4373b53985c50e8592c78c5ad014402f39d92ee909b06445e90be1d6f4ef9056`.
- Submitted broader Mathlib extraction: `ed53dad8e0ced42e8e5647cbc763d3fe4287afb216a855eafee3db2131f2a5f5`.
- Submitted broader log: `0e4d4e41f491fdef29202e0211a0eef05fdfe92810ab824dd63550d9947f3ac0`.

Logs normalize the invocation path to the extraction filename. Resource figures/log hashes describe this run. Scratch sources and logs are removed after submission; the immutable source, hashes and exact public recipe preserve reviewability.

## Checks and remaining work

Indexed blueprint checker:0 errors/0 warnings. Four-file intake:0 problems. Whitespace,51-statement/50-object preservation,20 admitted-body/signature parity and11 new reader/node checks pass. Actual read-only atlas assembly:3,018 stage/planet vertices(including51 existing virtual supplier endpoints),8,655 stage edges;62 packet nodes/119 internal prerequisite edges;3,069 combined vertices/8,809 edges. The combined graph contains stage/planet edges plus recursively reachable prerequisites, with no extra node-to-realises attachment. All three graphs are acyclic;62 declarations reached; no unresolved prerequisite, pending link or skipped own integration edge. All38 touching assembled stage edges, unrelated skipped links and deferred links are unchanged. No atlas/site output was written.

Resume D2: import/read native quotient action interfaces, build the actual G/N action on the existing U^N, descend the actual continuous cocycle and prove representative compatibility and uniqueness. Openness makes G/N discrete; compactness makes it finite, while U^N may be infinite. Then construct H¹ inflation with base-point/gauge formulas, use the existing fixed-witness lemma for D3 same-stage injectivity, prove D4 image=neutral restriction fibre with the correct inverse neutralizing gauge, and construct D5 reverse-inclusion transitions/filtered-colimit bijection. Finite-family killing is integrated only for actual cocycle representatives; the geometric finite-étale G1 torsor/class/component route remains with the existing IG.0/SF.2 requests and must not introduce an NC.3→NC.0 cycle.

For infinite coordinate-character families on∏C₂, the common one-fibre is nonopen{1}; with nondiscrete U=G and identity cocycle it is also nonopen. The reader supplies the elementary product-topology proof; these are mathematical boundaries, not newly typed Lean examples. Generic nonabelian H¹ still is a pointed set; no abelian group operation or kernel is inserted.

All prior NC.0 finite-cover/ε/Künneth/curve/raw-homotopy/Artin-tower supplier leaves, Chen/BDMTV routes, NC.1 reconstruction, NC.2 unipotent comparison, NC.3 representability/local conditions/Selmer, NC.4 loci, NC.5 heights and NC.6 process restructuring remain open. RT-AREA-algebraicgeometry/8 keeps NS=Pic/Pic⁰, injection/finite rank/ρ with A2; the existing request and BDMTV /9 owner are preserved. Generic heights/mixed extensions/local terms stay with the shared Part II owner, without a reverse NC.5 dependency. No stage is closed by this narrowly checked algebraic work.

## Reproduce exact extractions

Fetch the suggested file from the immutable proof commit as ProofSuggested.lean and the PR-head suggested file as SubmittedSuggested.lean. Run this Python3 recipe, then elaborate each result separately in an already existing exact-pin build, after the WORKERS memory check; do not build/download dependencies.

```python
from pathlib import Path
import re
def extract(s, proof=False):
    head = '\n'.join(x for x in s.splitlines() if x.startswith('import Mathlib.')) + '\n'
    prefix = s[s.index('noncomputable section'):
               s.index('variable [IsTopologicalGroup U] [ContinuousSMul G U]')]
    start = s.index('-- Discrete cocycle descent continuation.')
    block = s[start:s.index('end TauCeti.NonabelianCohomology', start)]
    if proof:
        block = block.removesuffix('\n')
    native = head + prefix + '\nend Z1\nend Basic\n' + block
    native += '\nend TauCeti.NonabelianCohomology\n'
    return native, block
s = Path('ProofSuggested.lean').read_text()
native, block = extract(s, proof=True)
Path('ProofNative.lean').write_text(native)
names = re.findall(r'^(?:def|lemma) (\w+)', block, re.M)
names += ['map_one', 'map_inv', 'ext']
Path('ProofAudit.lean').write_text(native + '\n' + '\n'.join(
    '#print axioms TauCeti.NonabelianCohomology.Z1.' + n for n in names) + '\n')
s = Path('SubmittedSuggested.lean').read_text()
Path('SubmittedNative.lean').write_text(extract(s)[0])
broad = '\n'.join(x for x in s.splitlines() if not x.startswith('import TauCeti.')) + '\n'
a = broad.index('section Abelian')
z = broad.index('end Abelian', a) + len('end Abelian')
Path('SubmittedMathlib.lean').write_text(broad[:a] + broad[z:])
```
