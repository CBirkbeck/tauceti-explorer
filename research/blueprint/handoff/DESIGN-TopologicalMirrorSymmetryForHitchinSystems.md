# DESIGN-TopologicalMirrorSymmetryForHitchinSystems — complete planning pass

Issue: #3442. Worker: Codex, session `codex-CFlcUI`. Branch: `codex-CFlcUI-topological-mirror-symmetry`. The bot confirmed claim comment 6259079603 in reply 6259081261 on 19 October 2026. This run takes no second job.

The deliverables define a new geometric Langlands roadmap, plan its six stages, provide the full reader and a compact elaborated Suggested file. All 36 items routed from PAPER-GROECHENIG-WYSS-ZIEGLER-20 are accounted for in `routedItemCoverage`. The packet is **complete**, part is null, and all six stages are **planned**. No stage is closed, and no mathematical implementation is claimed. Every node retains implementationStatus **unchecked**.

| Layer | Targets | Planets | Status |
|---|---:|---:|---|
| TMS.0 | 8 | 6 | planned |
| TMS.1 | 5 | 4 | planned |
| TMS.2 | 8 | 6 | planned |
| TMS.3 | 10 | 5 | planned |
| TMS.4 | 7 | 6 | planned |
| TMS.5 | 6 | 5 | planned |

Totals: **44 nodes** (6 definitions, 8 constructions, 28 theorems, 2 comparisons), **83 API items**, **56 discriminating definition/construction tests**, **32 planets**, **9 checked baseline declarations**, **27 registered supplier requests**, **12 explicit gaps**. Each definition/construction has four tests and at least two source/consumer uses. The target-level pass stops well below the approximately 300-node budget because all targets are planned; it does not decompose routine proof steps into declarations.

## Mathematical scope and corrections

The reader gives every exact statement, hypothesis, API, proof reduction, source locator and Check. Its six worked normalizations cover weighted quotient stacks, incompatible q=4 square-root evaluations, rank one, rank two in genus two, order-three Fourier orientation and the identity/Jordan-block regression.

Keep these distinctions through review:

- A fixed one-dimensional-character realization is additive. Products convolve characters; it is not generally a ring map. Stack traces include every rational torsor and reciprocal stabilizer order.
- General prime-power evaluations retain their root system. The Katz argument first specializes smooth proper families to a number field and then uses density-one prime residue fields and cyclotomic-fixing root transport. Finite Tate denominators suffice, with ℓ prime to their common denominator and the sheaf on R′[1/ℓ]. Rational shifts compare virtual classes via the requested fractional Hodge–Tate realization.
- Arithmeticity retains the μr band. A point of Split′ is not a neutralization. TMS.2 uses the sufficient local condition on the induced Gm-gerbes, which is what the integral proof consumes. The source’s literal stronger μr-neutrality condition remains G-Kummer. Do not infer arithmetic μn-neutrality from a local section of Split′ in the Hausel–Thaddeus descent proof.
- The full geometric Hochschild–Serre low-degree sequence is already planned by `SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering`, part 3. With the checked SF.3 Picard identifications, it supplies the middle exactness. The apparent missing-interface gap was removed after reading this exact supplier. No duplicate spectral-sequence target remains here.
- The chosen-determinant stable stack is μn-rigidified. Its deformation complex is in degrees 0,1 for automorphism/tangent/obstruction labels H⁰,H¹,H². The source’s Gm and degree-placement slips are recorded separately.
- Spectral fibres have target Nm⁻¹(LM⁻¹), where M=det π_*O_Y. The product and power determinant labels are LL′M⁻¹ and L^e M^(1−e). The degree-zero correction is N=M⁻¹Q^n. The reader tracks actual degree-one lines, not just rational Picard classes.
- The complete published genus range remains a target. For g=1, D=ω≃O and n>1, distinct generic constant eigenvalues force a Higgs-invariant decomposition and an empty stable generic fibre. A smooth spectral cover alone does not certify a nonempty stable torsor or generic freeness; separate low-genus work is explicit.
- The canonical Hodge-number extraction requires sector purity and symplectic age integrality. Age equals half the fixed-locus codimension, so its doubled degree shift is even and preserves signs.
- All-powers fibre traces prove virtual Galois-character equality. Theorem 7.23’s actual representation isomorphism remains a stronger unresolved target. Neither purity nor the proper direct-image argument alone proves arithmetic semisimplicity or ordinary-degree stalk purity.

The packet’s 29 source issues are written in mathematical prose with locators and correction reasons. E1–E20 retain the extraction’s independent confirmed verdict as **inherited provenance**, not a review of this packet. E21–E25 retain the confirmed red-team-fix provenance but await their independent source-issue verdicts. E26–E29 are new design findings: the μn/Brauer inference, the rigidifying subgroup, the deformation degree convention and the low-genus certificate. They await independent review. The additional findings were searched against the publisher record, arXiv history and bounded title/author correction searches on 19 October 2026; no matching correction was returned. No claim of an exhaustive correction search is made, and no author was contacted.

## Remaining obligations and ownership

Each gap lists its exact direct consumers, and downstream targets inherit it through prerequisites. Nothing here asks another worker to rediscover the target statements.

| Gate | Required follow-up |
|---|---|
| G-ETII | Register the already-routed coalesced EndoscopicTransferAndUnitaryTraceComparison Part II and supply generic admissible quotient/inertia/age/transgression/integration interfaces. In particular discharge inherited E15’s generic-to-special-fibre cocycle comparison and E16’s admissible root-bound repair. Preserve the action-groupoid, tame-generator and unramified-enlargement corrections. |
| G-MHS | Register the separately proposed geometric HodgeStructures Part III, preserving the occupied nonabelian Hodge Part II. Supply geometric compact-support MHS, finite-monodromy torsor descent, projectors, localization and Künneth, against the existing abstract MHS carrier. |
| G-Groth | Supply the LD.3 equivariant Bittner presentation, with equivariant resolution/compactification and weak factorization; distinguish the scissor group from the further representation quotient. |
| G-HT | Supply CP.3’s equivariant proper-smooth and finite-fractional Hodge–Tate realization, Hodge-number local constancy and specialization compatibility. Preserve virtual signs at overlapping rational weights. |
| G-unitary | Extend HodgeStructuresPartII H.1 to the required rank-one, arbitrary-degree-zero family comparison with unitary principal splittings. This comparison is not needed for the integration theorem. |
| G-local | Extend the actual characteristic-zero R02.4 abelian local-duality/isogeny-index statements to prime-to-p isogenies over F=k((t)), including μr-gerbe characters. The finite-field proof genuinely uses equal characteristic. |
| G-moduli | Supply the relative general-D stable Higgs GIT/properness, spectral Picard/norm-family and abstract-system certificate adapters. Mapping-stack algebraicity and finite quotients alone do not establish properness. |
| G-lowgenus | Verify the geometric certificate in its valid range and give separate low-genus calculations where the generic stable spectral locus is empty. Retain the main theorem’s full range. |
| G-HT-descent | Make the HT03 complex spectral gerbe argument algebraic over the arithmetic model, with coherent Γ-action, actual arithmetic μn-neutrality, normalization independence and both opposite splitting torsors. |
| G-Kummer | Supply any extra Pic/n argument needed for the source’s literal stronger μn-neutrality condition. The sufficient local-Brauer mirror proof does not require this stronger assertion. |
| G-Higgs-purity | Extend CB.9’s canonical GL target to fixed determinant, general D and the canonical finite-order fixed loci/torsor covers, with MHS/projector comparisons and symplectic age parity. |
| G-Galois | Supply arithmetic semisimplicity plus valid fibrewise degree separation, or a geometric comparison, before asserting the stronger actual cohomological representation isomorphism. |

The 27 request records give exact statements and consumers for registered suppliers: R09.1/.2/.4/.5/.7, LD.2/.3, CP.3, R01.1/.5, R02.4, DWP.7, EDC.0, A2/A3, CB.7/.9, HodgeStructuresPartII H.1, ET.2b, SF.2/.3, the five relevant existing JacobianChallenge layers, and existing ClassFieldTheory Layer5. Registered fine-grained imports were read before use, including the generic gerbe, rigidification, Poincaré, isogeny, Frobenius-density, trace-recognition and geometric HS nodes. Requests distinguish existing exports from extensions of their actual scope.

Unregistered SC-ETII and SC-MHS contracts are separate metadata, never fictitious resolvable stage IDs. SC-bundles imports current upstream AlgebraicVectorBundles. Restructuring entries are proposals within this packet; no other roadmap or generated atlas data was edited. No notion was moved out of an upstream roadmap.

## Library and source record

The reviewed `data/library-coverage.json` was read before design. There is no audited row for this new roadmap. Relevant supplier rows and fresh searches are recorded under `libraryAudit`; stale audit absences do not override actual pinned declarations.

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. The nine baseline statements were read in the Lean source, including the existing abstract MHS, integral Tate structure, invertible sheaves/line classes, abelian variety, finite character orthogonality, finite-support rational monoid algebra and matrix trace.

Current upstream roadmap main: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current upstream Tau Ceti library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The HodgeStructures and AlgebraicVectorBundles readers were read fully, and the latter’s relevant Suggested inventory was checked. All nine roadmaps newer than the atlas snapshot and both current and pinned libraries were searched for ownership. Generic vector-bundle tensor/exterior/determinant/total-space theory is imported from current AlgebraicVectorBundles. These directories were read only; no build or dependency operation ran there.

Public source files read on 19 October 2026, with versioned URLs and SHA-256 in both packet and reader:

- GWZ20, published Inventiones 221 (2020), 505–596: definitions and realization arguments at pp.512–528, the Hasse/transgression comparison and retained gates at pp.560–564, the relative splittings/abstract comparison at pp.565–575, and the stable spectral/degree/mirror/refined comparison proofs at pp.575–594. Earlier generic local-integration findings remain inherited extraction/red-team provenance; this run does not claim to re-prove all their supplier theory.
- HT03, arXiv math/0205236v1, numbered preprint pp.8–13, §3 Propositions3.2/3.6 and proofs; pp.17–18, §6 purity/comparison statements.
- Ito, arXiv math/0211378v3, numbered preprint pp.12–16, §4 Lemma4.3/Remark4.2 and §5 generalized fractional Hodge–Tate realization.
- Bittner, arXiv math/0111062v1, numbered preprint p.18, §7 Lemma7.1 and its equivariant proof/presentation distinction.

Primary Nitsure/Faltings relative Higgs properness and Ngô regular-centralizer/codimension proofs were not checked directly. Their exact needed consequences remain G-moduli/G-lowgenus and supplier contracts, not claimed proof closure. The private library index was inspected, but this job needed no private book and no private text or file was copied.

## Validation and submission

The 128-line Suggested file follows the current WORKERS fixed shape: full mathematics stays in the reader; Lean states only forms over actual pinned carriers, with light definitions having real bodies. It uses existing Tate and character APIs, numerical weighted sums, the corrected group determinant-label formula and explicit trace/fixed-vector examples. It has no geometric stand-ins or data placeholders. `suggestedCoverage` and the reader explain each omitted target group.

Validation on 19 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/TopologicalMirrorSymmetryForHitchinSystems.json`: **0 errors, 0 warnings**, with the available pinned declaration index.
- `lean-check research/blueprint/suggested/TopologicalMirrorSymmetryForHitchinSystems.lean`: **exit 0**, only 15 intended admitted-proof warnings; no errors, deprecations or other warnings. Memory was checked before each sequential run; no language server or library build ran. The initial import/linter warnings were corrected and the file re-elaborated.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/TopologicalMirrorSymmetryForHitchinSystems.lean`: passed; every data definition has a real body.
- Intake path/JSON checks: passed for all five deliverables.
- Additional scratch verification: all 44 exact target statements, hypotheses and proof steps agree with the reader; all 83 API names and 56 tests occur there; all 36 routed items have targets; the internal dependency graph is acyclic; local anchors resolve; roadmap edges use stages; coverage/gap IDs agree; no forbidden scheduling labels, source excerpts, local paths or Lean blocks occur in the packet/reader/roadmap. The source-version metadata check passed.

This is ready for the roadmap’s independent review, not mathematical closure or upstream packaging. Review should first check E26–E29 and the strong/weak distinctions above, then discharge supplier gates in dependency order. The scratch sources and scripts are disposable; the complete target statements, source checksums, current upstream commits, correction provenance, remaining contracts and validation results are all preserved in the five deliverables. Once the PR is open, the run records its URL externally and deletes scratch. No process is left running and no second issue is claimed.
