# Independent review of Arithmetic Galois representations, revision 2

Job `REV-ArithmeticGaloisRepresentations~2`, issue #6907. Reviewer: Codex, session `codex-Uj8N8z`, 8 October 2026. This session wrote neither planning pass being reviewed. The input was the revision at commit `bc922e658f9cacd6d4de086016b81c33ee306d57`.

**Verdict: `needs_changes`. This is a completed independent review, not a checkpoint.** Clear corrections are applied to the [packet](../packets/ArithmeticGaloisRepresentations.json), [reader](../readmes/ArithmeticGaloisRepresentations.md) and [suggested file](../suggested/ArithmeticGaloisRepresentations.lean). Two issues prevent acceptance:

1. The canonical nilpotent monodromy filtration is assigned to LPV.1 by accepted RS-17 O20, but R01.2 still defines it here. The existing LPV export imports Arithmetic R01.2 through its finite-logarithm construction, so reversing that dependency without narrowing the export would introduce a cycle. The packet now requests the exact pure linear-algebra interface and records this ownership conflict explicitly.
2. The suggested file does not meet PROTOCOL §13's correspondence requirement: 92 API entries and 51 test entries have no typed counterpart under the packet's name. They affect 30 definition/construction nodes. Their prose fallbacks are honest, but elaborating the rest of the file does not elaborate those statements. The appendix gives the exact names.

The 300-node budget, seven partial stages and precise open source/proof tasks are acceptable under this review's instructions. They are not reasons for this verdict. Every implementation status remains `unchecked`; none of the prototype's `sorry` proofs is a formalisation.

## Counts and complete scope of the check

| Item | Input | Reviewed packet |
|---|---:|---:|
| Nodes | 300 | 300 |
| Definitions / constructions | 31 / 28 | 31 / 28 |
| Lemmas / theorems / comparisons / applications | 83 / 145 / 9 / 4 | 83 / 145 / 9 / 4 |
| API entries / tests / planets | 550 / 292 / 40 | 550 / 292 / 40 |
| Pinned baseline declarations | 417 | 420 |
| Sources | 53 | 53 |
| Supplier requests / gaps | 60 / 36 | 61 / 37 |
| Source findings / restructuring entries | 47 / 8 | 47 / 8 |

The input's 300 nodes were read independently, including their statements, hypotheses, proof outlines, direct prerequisites, source locators and acceptance cases. All 550 API entries and 292 tests were checked. The review removed one baseline duplication and added one missing proof lemma. The final review object has **200 verified, 98 corrected, one added and one unverifiable** entry. The latter is the monodromy-filtration ownership/interface conflict, not a claim that its displayed nilpotent formulas are false.

| Stage | Nodes | Verified | Corrected | Added | Unverifiable | Coverage | Remaining items |
|---|---:|---:|---:|---:|---:|---|---:|
| G7 | 50 | 33 | 17 | 0 | 0 | partial | 66 |
| R01.1 | 59 | 31 | 28 | 0 | 0 | partial | 17 |
| R01.2 | 27 | 21 | 5 | 0 | 1 | partial | 31 |
| R01.3 | 62 | 33 | 29 | 0 | 0 | partial | 28 |
| R01.4 | 31 | 23 | 8 | 0 | 0 | partial | 19 |
| R01.5 | 53 | 44 | 8 | 1 | 0 | partial | 14 |
| R01.6 | 18 | 15 | 3 | 0 | 0 | partial | 27 |

All seven reviewed library-audit entries were read, together with the complete upstream LocalFieldsRamification and RepresentationTheory/InductionRestriction roadmaps. Each of the 417 input baseline statements was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including ambient section hypotheses and convention-sensitive uses. The three added citations were read at those pins too. Every one of the 29 foreign-node prerequisite edges was checked against the supplier's actual statement and prerequisites; stage requests, the existing gaps, restructuring entries and upstream notes were also checked. No foreign or upstream deliverable was edited.

The 53 recorded public source files were retrieved and their hashes matched. Relevant cited passages were read, using page images where scans or missing symbols made text extraction unreliable. This is a passage-level audit, not a claim to have read every page of all 53 works. The packet retains their public URLs and exact versions. No private source was copied into a deliverable. Source matches and source-finding descriptions state results in the reviewer's words; formulas, theorem numbers and page locators remain precise.

## The previous review and the two handed red-team findings

The [first review](REV-ArithmeticGaloisRepresentations.md) was read in full and its corrections checked against the revision. Its stale-reader concern is resolved: this review synchronizes every node block and the request, gap and restructuring sections. Its granularity concern is handled within the current budget: the revision split 44 bundles into 110 additional nodes and keeps exact remaining splits for partial stages. This review additionally extracts the local symplectic lifting argument used by gluing. It does not demand that the next several hundred refinements fit this pass.

The first review's inaccessible-original-source concerns remain precise proof tasks. `saito-conductor-discriminant` is checked against Liu's accessible §2.1, printed pp. 58–59, PDF pp. 9–10, rather than an unread Saito original. `serre-independence-and-connectedness` is checked against Richard–Yafaev Theorem 4.9; the original Serre and Larsen–Pink proofs remain requested. The current instructions allow these openly conditional plans. Their gaps are not silently closed and are not acceptance blockers merely because the original works remain unavailable.

**RT-AREA-langlands-1/17:** R01.1 retains the classical image-algebra and characteristic-polynomial proof of Brauer–Nesbitt, including descent and the trace-only factorial qualification. [Chenevier, Theorem 2.12, proof p. 31](https://arxiv.org/pdf/0809.0415v2), uses Brauer–Nesbitt for uniqueness, so determinant reconstruction must import it. No reverse dependency through IHG.1 was added. The characteristic-p argument cancels equal constituent multiplicities modulo p and then takes p-th roots of the remaining characteristic polynomials; trace equality alone is not substituted.

**RT-AREA-langlands-1/6:** the conductor includes Swan contributions, especially at two and three. Ogg's component count is geometric and without multiplicity on the minimal proper regular model. The type I₀* test uses five components; four is the smooth Néron special-fibre count. R01.3 retains the comparison with the upstream reduction algorithm and its requested inertia/model inputs. Saito and the sharp dyadic Brumer–Kramer input remain scoped gaps. The corrections do not claim the ordinary inertia-invariant factor of a fixed ℓ-adic representation describes the place above ℓ.

## Mathematical corrections applied

**R01.1:** the roots-of-unity comparison depends on a compatible primitive-root choice. Algebraic-closure-valued residual characters need profinite source, or finite image, for finite-field Teichmüller descent. Lattice and homothety arguments now have their direct PID/Nakayama inputs. The integral symplectic model explicitly requires a nondegenerate alternating pairing and multiplier. Absolute irreducibility no longer asserts all stable subspaces are closed for arbitrary coefficient topologies. Diamond–Taylor and other locators were corrected to the actual sections.

**R01.2:** factorisation through the maximal extension unramified outside S requires a closed kernel and the topological closure of the inertia-generated normal subgroup; Hausdorff coefficients suffice. Cyclotomic fields are unramified away from N, which avoids the false assertion that every prime dividing N ramifies (N=2 is a counterexample). Q̄ℓ Weil–Deligne descent uses compact inertia, then adjoins Frobenius matrix entries; the Weil group itself is not compact. Topological hypotheses were propagated to conductor consumers. The canonical filtration's ownership is unresolved as described below.

**R01.3:** the global residual elliptic statement has its actual E/Q and ℓ≥5 hypotheses. Direct conductor prerequisites and Hausdorff hypotheses were added where used. Liu/Saito page references were corrected. E350's argument was replaced by one that produces arbitrarily large wild quotients at a fixed positive level: for F=F_p((t)), take prime-to-p e with 1/e<v, arbitrarily large residue extensions F_{p^f}, and all independent Artin–Schreier classes a/s over s^e=t. Their span is stable under the tame and residue actions, so the composite is Galois over F and has wild group of order p^f with break 1/e. Thus G^v has unbounded index in wild inertia and empty interior. Baire category proves the positive-level union is proper, while finite-quotient images prove its density. A single cyclic order-p example would not suffice.

**R01.4:** the dihedral/induction equivalence now assumes continuity and a topological algebraically closed coefficient field. Kernel fixed fields are taken in the separable closure for imperfect base fields. The p-subgroup classification explicitly requires a finite group. The exceptional and small-characteristic clauses remain intact; rejected E401 is not used to alter Serre's correct perfect-field argument.

**R01.5:** recognition by traces explicitly assumes the comparison subset is dense, and Frobenius-field realisability has a number-field hypothesis. The Wedderburn descent proof uses consistent multiplicity notation. Fixed-form symplectic recognition specifies common perfect alternating form, multiplier and dense polynomial data. Gluing specifies one absolutely irreducible residual representation, cofinal open ideals contained in the maximal ideal, and uses a newly explicit local symplectic lifting lemma. Its proof lifts an invertible matrix C, corrects Q=ν⁻¹CᵀJC by symplectic Gram–Schmidt with corrections in I, and obtains CS with the prescribed reduction and multiplier. It requires no division by two. Unit-group compactness is imported from pinned Mathlib, rather than re-planned.

**R01.6:** the local-polynomial comparison for fixed ℓ is asserted away from ℓ, and a partial Euler product excludes both bad places and places above ℓ. One may choose a different coefficient prime for each individual place; that does not prove a comparison at the coefficient prime. Genuine geometric carriers are retained, while their untyped interfaces are counted honestly in the appendix.

**G7:** tensor induction has specified coherent comparison isomorphisms, not uniqueness of all isomorphisms. Multiplier uniqueness requires positive constant rank. The BLGGT/CHT polarization convention is preserved: symmetry with sign −1 does not imply alternation over characteristic-two rings; alternation is stated separately instead of being added to the source's definition. Monodromy topological claims require Hausdorff coefficients. Sym^{2p−1} refers to algebraic SL₂ rather than the finite group SL₂(F_p). The GSp₄ character twist is formal, rather than pointwise division of a representation. E720's example supplies the missing nondegeneracy clause. Taylor–Wiles auxiliary kernel fields are defined over F(ζ_p) for the restricted representations, and degree parameters are positive. Patrikis and Liu locators were corrected between printed and PDF page conventions. The GL₂(F₃) and SL₂(F₃) abelianizations in the vast/tidy argument are distinguished.

## Baseline citations fixed, imported, and the added node

No cited declaration was removed as nonexistent. Two inherited descriptions overstated their statements and were fixed: `DihedralGroup 0` is infinite, so finite order 2n requires n>0; `ContRepresentation.conj_linHom` requires finite-dimensional source and target. All citing uses were checked with those restrictions.

Three exact pinned imports were added:

- `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`, in `Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean`, needs an element a≠0 with a²≠1. Together with the already cited `isoPSLOfAlgClosed`, it supplies PGL₂ simplicity over an algebraically closed field, including infinite fields. The finite-cardinality wrapper is insufficient there because `Nat.card` of an infinite type is zero. The repeated Iwasawa proof was replaced by these imports.
- `Units.isClosedEmbedding_embedProduct`, in `Mathlib/Topology/Algebra/Group/Units.lean`, supplies the closed graph of a unit and its inverse for a T₁ topological monoid with continuous multiplication. Compactness follows for compact A and is already an instance in that module. The compiled index confirms its generated name `Units.instCompactSpaceOfT1SpaceOfContinuousMul`; the packet cites the named theorem because the repository's textual declaration index omits that generated instance name.
- `Continuous.isClosedEmbedding`, in `Mathlib/Topology/Separation/Hausdorff.lean`, supplies the topology comparison for a continuous injective map from a compact space to a Hausdorff space. It applies to the unit inclusion.

Removed node: `R01.5/unit-group-of-a-compact-ring`, whose entire assertion is already supplied by those Mathlib statements. Its Haar-measure consumer now cites the baseline and the direct Haar-probability uniqueness theorem. The node's unused additive-Haar assumptions are not carried into the baseline claim.

Added node: `R01.5/lifting-symplectic-similitudes`, marked `addedBy: REV-ArithmeticGaloisRepresentations~2`. It is a direct prerequisite of `carayol-gluing` and has a typed matrix signature, `TauCeti.GaloisRep.lift_symplectic_similitude`. [Calegari–Geraghty §6.3, Theorem 6.13 proof, published p. 842](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), is its motivating use; the local-ring lemma and its complete proof outline are reviewer supplied, not attributed as a theorem of that paper.

## Ownership decision and orchestrator questions

Accepted [RS-17 O20](../restructure/RS-17.result.json) assigns the canonical nilpotent monodromy filtration to LPV.1. The supplier's `monodromy-filtration`, `primitive-decomposition` and `monodromy-filtration-tensor-dual` statements were read. Its current filtration edge goes through `finite-monodromy-logarithm`, which imports Arithmetic R01.2. Its primitive indexing and this packet's increasing-filtration indexing also need an explicit compatibility map.

The new request and gap ask LPV.1 to export, without the geometric logarithm or an Arithmetic R01.2 prerequisite, the finite-dimensional nilpotent filtration, uniqueness, scalar invariance, primitive decomposition and tensor/dual comparison. The characteristic-zero tensor proof must name the SL₂ complete-reducibility and weight-decomposition supplier. Arithmetic should keep the Weil–Deligne stability and conductor/rank-sum applications. A blind reverse stage edge was not installed, and no edit was made to the foreign packet.

The orchestrator needs to coordinate that narrowed LPV export and its supplier before the next Arithmetic revision removes the duplicate. The revision should also resolve the exact prototype omissions below, adding typed statements where existing vocabulary suffices and specifying any genuinely unavailable condition without opaque `Prop` placeholders. Existing partial-stage proof work remains in `coverage.remaining`, 61 requests and 37 gaps; it does not have to be closed to fix these two review blockers.

## Independent source-finding decisions

All 47 findings have this review's own `review` object: **43 confirmed and four rejected**. The reader contains the full finding-by-finding reasons, synchronized with the packet. Confirmed findings retain the precise preprint/published scope, and a reported correction is distinguished from direct reading of an unavailable original.

- **E351 rejected:** Brumer–Kramer p. 229 uses additivity for direct sums. Its Lemma 2.4 separately proves exact-sequence Swan additivity. The alleged source assertion of Artin exact-sequence additivity is not there; the roadmap's exact-sequence inequality remains correct.
- **E401 rejected:** an irreducible representation over a finite field becomes semisimple after algebraic-closure extension. Its semisimple image algebra has separable centre. The alleged reducible indecomposable case therefore cannot occur, and Serre's §3.3 direct-sum argument suffices.
- **E752 rejected:** the span of the conjugates of a fixed h is invariant and descends; choosing h with nonzero trace then contradicts the alleged orthogonal annihilator. The quantifier is sufficient in Newton–Thorne Lemma 2.28.
- **E769 rejected:** the published [Qian paper](https://par.nsf.gov/servlets/purl/10388233) cites Definition 6.2.28, Lemma 7.1.6 and Theorem 6.1.2 consistently with [Allen et al. v2](https://arxiv.org/pdf/1812.09999v2). Its preprint Lemma 7.1.5 reference is consistent with [v1](https://arxiv.org/pdf/1812.09999v1). Later Annals numbering does not make those citations wrong. The three additional checked versions have their actual hashes and 8 October reading date in `sourceVersions`.

E754 remains confirmed for the cited preprint, with the version-of-record comparison still requested. E755 is confirmed as a gap in the cited Gee–Newton argument, despite an earlier coverage sentence calling it rejected; that sentence was corrected. E650/E651 and other inherited source passages were rewritten as mathematical descriptions rather than reproduced prose. Tate's E301 is confirmed as Ulmer's §6 report and by the two-dimensional Steinberg conductor check; the unavailable original Tate article was not independently collated.

## Finite cohomology checks

The following independent finite-field computations support concrete cases in the image-condition plans. They are ordinary exact arithmetic, not Lean certificates and not a proof for all extension degrees. Existing general and finite-enumeration gaps remain open.

| Group | Coefficient module | dim Z¹ | dim B¹ | dim H¹ |
|---|---|---:|---:|---:|
| SL₂(F_4) | gl₂ | 3 | 3 | 0 |
| SL₂(F_8) | gl₂ | 3 | 3 | 0 |
| SL₂(F_16) | gl₂ | 3 | 3 | 0 |
| SL₂(F_3) | sl₂ | 3 | 3 | 0 |
| SL₂(F_5) | sl₂ | 4 | 3 | 1 |
| SL₂(F_7) | sl₂ | 3 | 3 | 0 |
| SL₂(F_11) | sl₂ | 3 | 3 | 0 |
| SL₂(F_13) | sl₂ | 3 | 3 | 0 |
| GL₂(F_5) | sl₂ | 3 | 3 | 0 |
| GL₂(F_5) | sl₂⊗det^1 | 3 | 3 | 0 |
| GL₂(F_5) | sl₂⊗det^2 | 4 | 3 | 1 |
| GL₂(F_5) | sl₂⊗det^3 | 3 | 3 | 0 |
| det⁻¹({±1})⊂GL₂(F_5) | sl₂ | 4 | 3 | 1 |
| SL₂(F_9) | sl₂ | 3 | 3 | 0 |

Reproduction method: represent F₄, F₈, F₁₆ by F₂[x] modulo x²+x+1, x³+x+1, x⁴+x+1, and F₉ by F₃[x]/(x²+1). Generate SL₂ using upper transvections for a field basis and one lower transvection; adjoin diag(u,1) for primitive u to obtain GL₂, or diag(−1,1) for determinant ±1. Check the enumerated group orders. Give the cocycle arbitrary values on the generators, propagate c(gs)=c(g)+g·c(s) along a Cayley spanning tree, and impose that equality on every remaining edge. Row reduction gives Z¹. The rank of v↦((s−1)v)_s gives B¹. For gl₂ use matrix units, and for sl₂ use E₁₂, diag(1,−1), E₂₁, with conjugation and the indicated determinant twist. This records enough to reproduce the computations without the deleted scratch scripts.

## Validation and limits of the suggested-file check

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations.json`: zero errors and zero warnings, including all 420 final baseline names in the pinned textual index.
- `source_issues.check_issues` and `check_errata.versions_checked`, applied to the packet's corresponding fields: no errors. The standalone errata checker expects an `errata-v1` document; this packet remains `blueprint-v1`.
- Independent consistency checks: every retained node has exactly one current review entry; all source findings have this reviewer; the 300-node own-prerequisite graph is acyclic; every definition/construction has at least three discriminating test outlines; all implementation statuses are unchecked; node statements, hypotheses, prerequisites, proof plans, APIs and tests agree with the reader. The auxiliary prose index was regenerated from its own nodes to prevent shared-hypothesis replacements from crossing between entries.
- `git diff --check`: passed. Only the three reviewed files, this report and this job's handoff are changed.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations.lean`: elaborates at the pinned Mathlib, with 849 `sorry` warnings and no errors or other warnings. Memory exceeded the 20 GB threshold and the run finished within twenty minutes. The check covers typed signatures, including the added lifting lemma. It does not elaborate geometric comments, prove theorems or execute `sorry` examples.

The inventory below strips nested block and line comments, follows namespaces and sections, includes named instances and structure projections, and matches anonymous examples by their unit-test labels. It finds 754 explicit declarations, 39 recorded projections and 241 labelled anonymous examples. It avoids treating a mere occurrence of a name in a comment as a declaration. The 109 retained auxiliary split entries in the prose index are likewise not 109 newly elaborated declarations; many point to existing bundled prototypes.

## Appendix A: every corrected node and changed field

The mathematical changes are explained above. This table records every node-level field changed during this review, including locator and paraphrase corrections. Added and removed nodes are identified separately above. Register-wide changes are the three baseline imports and their independent check notes, all 47 source-review decisions, three checked comparison versions, G7's updated source-reading tasks, the new ownership request/gap/restructuring proposal, the summary/review object and the synchronized reader and suggested index.

| Node (roadmap prefix omitted) | Fields changed |
|---|---|
| `R01.1/continuous-representation` | source.locator |
| `R01.1/exterior-power-base-change` | source.locator |
| `R01.1/exterior-powers-of-finite-projective-modules` | source.locator |
| `R01.1/exterior-power-rank` | source.locator |
| `R01.1/rank-one-projective-modules-are-invertible` | source.locator |
| `R01.1/determinant-through-a-complement` | source.locator |
| `R01.1/framed-representation` | source.locator |
| `R01.1/restriction-dual-tensor-twist` | proofSteps, source.locator |
| `R01.1/tate-twist` | source.locator, statement |
| `R01.1/finite-coefficients-and-finite-quotients` | source.locator |
| `R01.1/finite-galois-factorisation` | source.locator |
| `R01.1/artin-representations-have-finite-image` | source.locator |
| `R01.1/no-small-subgroups-in-a-normed-algebra` | source.locator |
| `R01.1/residual-descent-to-a-finite-field` | source.locator |
| `R01.1/lattices-are-compact-open` | prerequisites, source.locator |
| `R01.1/compact-subgroups-stabilise-lattices` | source.locator |
| `R01.1/continuous-representations-have-stable-lattices` | source.locator |
| `R01.1/semisimplification` | source.locator |
| `R01.1/absolutely-irreducible` | hypotheses, source.match |
| `R01.1/continuity-descent-and-lattice-independence` | source.locator |
| `R01.1/teichmuller-lift-of-a-residual-character` | statement |
| `R01.1/ribet-nonsplit-lattice` | source.match |
| `R01.1/stable-lattice-unique-up-to-homothety` | sources.match |
| `R01.1/self-dual-lattice-for-absolutely-irreducible-residual` | prerequisites, sources.match |
| `R01.1/integral-symplectic-model` | hypotheses, prerequisites, sources.match, statement |
| `R01.1/semisimple-if-restriction-semisimple` | source.locator |
| `R01.1/restriction-to-open-subgroup-semisimple` | source.locator |
| `R01.1/semisimplicity-under-restriction-and-induction` | source.locator |
| `R01.2/unramified-and-ramification-set` | api, proofSteps, statement |
| `R01.2/unramified-character-lambda` | hypotheses, prerequisites |
| `R01.2/cyclotomic-and-dirichlet-characters` | proofSteps |
| `R01.2/tame-inertia-and-fundamental-characters` | sources.locator |
| `R01.2/grothendieck-quasi-unipotence` | statement |
| `R01.3/breaks-and-swan-conductor` | hypotheses |
| `R01.3/wild-action-factors-through-a-finite-galois-extension` | hypotheses, statement |
| `R01.3/finite-wild-factorisation-equivariant` | hypotheses, statement |
| `R01.3/finite-wild-factorisation-enlargement` | hypotheses, statement |
| `R01.3/finite-inertia-factorisation` | hypotheses, statement |
| `R01.3/artin-conductor-with-its-wild-part` | hypotheses |
| `R01.3/conductor-of-a-character` | hypotheses, statement |
| `R01.3/artin-conductor-integral-finite-group` | hypotheses, statement |
| `R01.3/hasse-arf-integrality` | hypotheses, statement |
| `R01.3/conductor-independence-of-choices` | hypotheses, prerequisites, statement |
| `R01.3/conductor-vanishing-criteria` | hypotheses, statement |
| `R01.3/swan-conductor-orbit-formula` | prerequisites |
| `R01.3/swan-additive` | hypotheses, statement |
| `R01.3/additivity-twist-and-unramified-invariance` | hypotheses, statement |
| `R01.3/conductor-dual` | hypotheses, statement |
| `R01.3/conductor-twist-unramified-tame` | hypotheses, statement |
| `R01.3/conductor-twist-dominant-character` | hypotheses, statement |
| `R01.3/conductor-unramified-base-change` | hypotheses, statement |
| `R01.3/conductor-tame-base-change` | hypotheses, statement |
| `R01.3/conductor-extend-scalars` | hypotheses, statement |
| `R01.3/swan-conductor-of-reduction` | sources.match |
| `R01.3/reduction-does-not-increase-the-conductor` | sources.match |
| `R01.3/global-conductor-of-reduction` | sources.match |
| `R01.3/ogg-formula-descent` | sources.match |
| `R01.3/ogg-formula-tame` | sources.match |
| `R01.3/ogg-formula` | sources.match |
| `R01.3/saito-conductor-discriminant` | sources.locator |
| `R01.3/saito-genus-one` | sources.locator |
| `R01.3/residual-elliptic-conductor-away-from-ell` | hypotheses |
| `R01.4/conjugacy-of-standard-projective-images` | sources.match |
| `R01.4/p-subgroups-and-borel-subgroups` | statement |
| `R01.4/subgroups-of-psl2-with-several-sylow-p-subgroups` | sources.match |
| `R01.4/two-transvections-generate-sl2-over-a-prime-field` | sources.match |
| `R01.4/dihedral-projective-image-iff-induced` | hypotheses, statement |
| `R01.4/irreducible-with-abelian-projective-image-is-klein` | sources.match |
| `R01.4/image-of-restriction-to-a-subfield` | hypotheses, prerequisites, statement |
| `R01.4/minimal-index-of-proper-subgroups-of-psl2` | sources.match |
| `R01.5/recognition-by-traces` | hypotheses, statement |
| `R01.5/residual-realisability-over-frobenius-field` | hypotheses, statement |
| `R01.5/rational-eigenvalue-descent` | proofSteps |
| `R01.5/additive-haar-invariant-under-units` | sources.match |
| `R01.5/haar-measure-on-open-subgroups-of-gl-n` | prerequisites, sources.match |
| `R01.5/additive-measure-of-gl-n-of-integers` | sources.match |
| `R01.5/carayol-symplectic` | hypotheses, prerequisites, proofSteps, statement |
| `R01.5/lifting-symplectic-similitudes` | added node |
| `R01.5/carayol-gluing` | hypotheses, prerequisites/proofSteps, statement |
| `R01.6/specialisation-of-torsion-at-good-reduction` | acceptance |
| `R01.6/comparison-with-weierstrass-local-polynomial` | proofSteps, statement |
| `R01.6/local-euler-factor-of-an-abelian-variety` | statement |
| `G7/tensor-induction-independent-of-transversal` | statement |
| `G7/similitude-groups` | hypotheses, statement |
| `G7/polarized-representation` | hypotheses, statement |
| `G7/polarization-sign-and-determinant` | hypotheses, statement |
| `G7/clozel-harris-taylor-group` | proofSteps |
| `G7/symmetric-power-polarization` | statement |
| `G7/gsp4-and-symplectic-induction` | proofSteps |
| `G7/strong-irreducibility` | hypotheses, statement |
| `G7/zariski-closure-and-monodromy-groups` | hypotheses, statement |
| `G7/simplicity-of-pgl2-over-an-algebraically-closed-field` | prerequisites, proofSteps |
| `G7/lifting-projective-representations` | sources.locator |
| `G7/roots-of-characters-up-to-finite-order` | sources.locator |
| `G7/lifting-projective-representations-hodge-tate` | sources.locator |
| `G7/vast-tidy-and-enormous-gsp4-subgroups` | acceptance |
| `G7/gsp4-big-image-verification` | hypotheses, statement |
| `G7/image-in-the-3-cyclotomic-tower-for-sl2-wreath-products` | sources.match |
| `G7/taylor-wiles-image-lemmas` | hypotheses, proofSteps |

## Appendix B: exact missing typed API and test entries

These are missing typed counterparts, not missing mathematical prose. Names listed as both API and test count once in each inventory. A labelled anonymous example is accepted as a test counterpart; structure projections and named instances count as declarations. The following 30 nodes account for the 92 API and 51 test entries.

### `R01.1/reduction-and-residual-semisimplification`

API: `TauCeti.GaloisLattice.IntegralModel.reduction_baseChange`, `TauCeti.GaloisLattice.IntegralModel.reduction_tensor`.

### `R01.1/coefficient-frobenius-twist`

API: `TauCeti.ContinuousRep.residual_coeffTwist`.

Tests: `TauCeti.ContinuousRep.residual_coeffTwist_inertia`.

### `R01.2/decomposition-group-at-a-place`

API: `TauCeti.GaloisRep.localEmbeddingMap_comp`.

### `R01.2/local-restriction`

API: `TauCeti.GaloisRep.localRestriction_restrict`, `TauCeti.GaloisRep.localRestriction_induced`, `TauCeti.GaloisRep.localRestriction_kernelField`.

### `R01.2/unramified-and-ramification-set`

Tests: `TauCeti.GaloisRep.isUnramifiedAt_not_of_reduction`.

### `R01.2/ell-adic-tame-character`

API: `TauCeti.GaloisRep.tameCharacter_restrict`, `TauCeti.GaloisRep.tameCharacter_eq_tame`.

Tests: `TauCeti.GaloisRep.tameCharacter_restrict_ramified`.

### `R01.2/tame-inertia-and-fundamental-characters`

API: `TauCeti.GaloisRep.fundamentalCharacter_one_eq_cyclotomic`, `TauCeti.GaloisRep.fundamentalCharacter_restrict`.

Tests: `TauCeti.GaloisRep.fundamentalCharacter_one_Qp`, `TauCeti.GaloisRep.fundamentalCharacter_teichmuller`.

### `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`

API: `TauCeti.WeilDeligneRep.ofEllAdic_restrict`, `TauCeti.WeilDeligneRep.ofEllAdic_induced`.

Tests: `TauCeti.WeilDeligneRep.ofEllAdic_tateCurve`, `TauCeti.WeilDeligneRep.ofEllAdic_not_semisimplification`.

### `R01.2/frobenius-semisimplification`

API: `TauCeti.WeilDeligneRep.indecomposable_iso_tensor_special`.

Tests: `TauCeti.WeilDeligneRep.three_objects_differ`.

### `R01.2/local-epsilon-factor`

API: `TauCeti.WeilDeligneRep.epsilonWeil_induced`, `TauCeti.WeilDeligneRep.epsilonWeil_character`, `TauCeti.WeilDeligneRep.epsilonWeil_unique`, `TauCeti.WeilDeligneRep.epsilon_unramified_twist`, `TauCeti.WeilDeligneRep.epsilon_dual`.

Tests: `TauCeti.WeilDeligneRep.epsilon_eq_tate`.

### `R01.3/breaks-and-swan-conductor`

API: `TauCeti.Conductor.map_absUpperRamificationGroup`, `TauCeti.Conductor.swanConductor_eq_lowerSum`, `TauCeti.Conductor.lowerRamificationGroup_completion`.

Tests: `TauCeti.Conductor.swanConductor_unweighted_fails`, `TauCeti.Conductor.swanConductor_eq_lowerSum_any`.

### `R01.3/artin-conductor-with-its-wild-part`

API: `TauCeti.Conductor.artinConductor_eq_lowerSum`, `TauCeti.Conductor.artinConductor_eq_characterConductorExp`.

Tests: `TauCeti.Conductor.artinConductor_tateCurve`, `TauCeti.Conductor.artinConductor_lift_fails`.

### `R01.3/conductor-of-a-weil-deligne-representation`

Tests: `TauCeti.Conductor.artinConductor_eq_wdConductor_tate`.

### `R01.3/global-conductor-and-prime-to-p-conductor`

Tests: `TauCeti.Conductor.primeToPConductor_11a1`.

### `R01.6/tate-module-of-an-abelian-variety`

API: `TauCeti.AlgebraicGeometry.AbelianVariety.torsionPoints`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.toTorsion`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_free`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.modPowEquiv`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.ext`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModuleRep`, `TauCeti.AlgebraicGeometry.AbelianVariety.rationalTateModule`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.map`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.baseChange`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.kernel_mod_pow`, `TauCeti.AlgebraicGeometry.AbelianVariety.adelicTateModule`, `TauCeti.AlgebraicGeometry.AbelianVariety.torsionPoints_card`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_isModuleTopology`.

Tests: `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_rank_eq`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_of_dim_zero`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_ne_limit_rational_torsion`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_char_p_excluded`, `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_mod_pow_equiv_galois`.

### `R01.6/weil-pairing-on-tate-modules`

API: `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing`, `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_mod_pow`, `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_perfect`, `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_galois`, `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_map_dual`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_alternating`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_perfect_iff`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_rosati`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_prod`, `TauCeti.AlgebraicGeometry.AbelianVariety.image_le_GSp`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_galois`.

Tests: `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_galois`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_elliptic_det`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_zero_dim`, `TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_not_perfect`, `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_target_twist`.

### `R01.6/local-euler-factor-of-an-abelian-variety`

API: `TauCeti.AlgebraicGeometry.AbelianVariety.firstCohomologyRep`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_eq_coinvariants`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_of_goodReduction`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_isogeny`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_prod`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_natDegree_le`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_eq_weilDeligne`.

Tests: `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_goodReduction`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_zero`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_compare_localPolynomial`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_not_on_V`, `TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_tate_curve`.

### `R01.6/tate-module-with-endomorphism-coefficients`

API: `TauCeti.AlgebraicGeometry.AbelianVariety.tateModule.endAction`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule.decomposition`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_finrank`, `TauCeti.AlgebraicGeometry.AbelianVariety.integralLambdaTateModule`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTorsion`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_det`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_odd`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_frobenius`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule.coefficientExtension`, `TauCeti.AlgebraicGeometry.AbelianVariety.integralLambdaTateModule_free`.

Tests: `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_cm_rank_one`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_rationals`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_not_over_smaller_field`, `TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_sum`.

### `R01.6/galois-generic-abelian-varieties`

API: `TauCeti.AlgebraicGeometry.AbelianVariety.pAdicImage`, `TauCeti.AlgebraicGeometry.AbelianVariety.IsPGaloisGeneric`, `TauCeti.AlgebraicGeometry.AbelianVariety.IsGaloisGeneric`, `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_iff_finiteIndex`, `TauCeti.AlgebraicGeometry.AbelianVariety.IsGaloisGeneric.isPGaloisGeneric`, `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_baseChange_iff`, `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_iff_framed`, `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_polarization_indep`.

Tests: `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_cm`, `TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_iff_finiteIndex`, `TauCeti.AlgebraicGeometry.AbelianVariety.not_open_in_Sp`, `TauCeti.AlgebraicGeometry.AbelianVariety.isGaloisGeneric_baseChange`.

### `G7/symmetric-and-exterior-powers`

Tests: `TauCeti.ContinuousRep.symPower_not_dual_char_p`.

### `G7/tensor-induction`

API: `TauCeti.ContinuousRep.tensorInd_tprod`, `TauCeti.ContinuousRep.trace_tensorInd`, `TauCeti.ContinuousRep.tensorInd_trans`, `TauCeti.ContinuousRep.tensorInd_baseChange`, `TauCeti.ContinuousRep.charpoly_tensorInd`.

Tests: `TauCeti.ContinuousRep.asai_restrict`, `TauCeti.ContinuousRep.tensorInd_ne_ind`.

### `G7/restriction-of-scalars`

API: `TauCeti.ContinuousRep.resScalarsBaseChangeEquiv`.

Tests: `TauCeti.ContinuousRep.resScalars_baseChange_split`, `TauCeti.ContinuousRep.resScalars_ne_ind`.

### `G7/operations-on-polarized-representations`

API: `TauCeti.PolarizedRep.baseChange`.

### `G7/clozel-harris-taylor-group`

API: `TauCeti.CHTGroup.ind`.

Tests: `TauCeti.CHTGroup.equivTriple_trivial`.

### `G7/gsp4-and-symplectic-induction`

API: `TauCeti.GSp4Rep.adZero_symplecticInd`.

Tests: `TauCeti.GSp4Rep.ad_not_adZero_add_nu`.

### `G7/strong-irreducibility`

API: `TauCeti.GaloisRep.IsStronglyIrreducible.baseChange_iff`, `TauCeti.GaloisRep.isAbsStronglyIrreducible_iff_identityComponent`.

Tests: `TauCeti.GaloisRep.not_stronglyIrreducible_induced`, `TauCeti.GaloisRep.stronglyIrreducible_iff_identityComponent`.

### `G7/zariski-closure-and-monodromy-groups`

API: `TauCeti.AlgebraicGroup.zariskiClosure_commutator`, `TauCeti.GaloisRep.isReductive_identityComponent_of_semisimple`.

Tests: `TauCeti.GaloisRep.monodromyGroup_cyclotomic`.

### `G7/enormous-image-and-its-coefficient-extension-invariance`

Tests: `TauCeti.ResidualImage.not_isEnormous_Q8_tensor_Q8`.

### `G7/characteristic-zero-enormous-subgroups`

API: `TauCeti.ResidualImage.isEnormousCharZero_of_zariskiClosure`, `TauCeti.ResidualImage.isEnormousCharZero_of_derived`.

### `G7/vast-tidy-and-enormous-gsp4-subgroups`

Tests: `TauCeti.ResidualImage.GSp4.isWeaklyEnormous_not_isEnormous_wreath_ZMod5`, `TauCeti.ResidualImage.GSp4.isEnormous_SL2wr_ZMod3`.
