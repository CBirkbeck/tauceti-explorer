# Handoff — BP-VectorBundlesAndIsocrystals--VB0 (#1002)

Agent: Codex, session `codex-gUN1xW`, 2026-10-06.
Branch: `codex-gUN1xW-bp-vector-bundles-vb0`.
This completes the target-level pass begun in checkpoint PR #2851. It is a
complete mathematical plan, with explicit proof and supplier refinements, and
is ready for independent review. No declaration is claimed formalized.

## Deliverables and coverage

Only the issue's packet, reader document, suggested Lean file and this handoff
are changed. All thirteen inherited node identifiers are retained. The
classical-point and regular-curve nodes now belong to the early geometric VB1
prefix, retaining their target realizations. The packet has 51 nodes:
6 definitions, 12 constructions, 24 theorems, 7 comparisons and 2 lemmas;
98 API items, 72 discriminating tests, 17 planets, 16 pinned baseline
references, 7 named gaps and 14 supplier/export contracts. All
`implementationStatus` fields remain `unchecked`.

| Stage | Status | Closed? |
| --- | --- | --- |
| VB0 | planned | no |
| VB1 | planned | no |
| VB2 | planned, aggregate of its two children | no |
| VB2:ampleness | planned | no |
| VB2:classification | planned | no |

Every target has a statement, direct inputs, source passage and proof route.
All eighteen definitions/constructions have uses, APIs and at least three
named tests. Stages terminate in the baseline, precise owner contracts or the
named refinements below; `complete` does not claim proof closure.

## Binding ownership and confirmed findings

The latest accepted RS-15 and RS-20 were read and followed. The old handoff's
claim that this roadmap has no restructuring family is superseded. RF3 owns
rank-one O(n), their divisor laws, the graded algebra and homogeneous maps
on the union of nonvanishing loci. This packet owns the full isocrystal
functor, early geometric coverage, general-base global coverage and GAGA.
RF2 supplies the completed untilt local ring; Div¹/BC properness belongs to VB3.
No existing period-space or generic scheme construction is replanned.

Confirmed RT-AREA-padic-1/21 is addressed by this declaration order:
RF3 narrow inputs → early analytic bundles/annuli/cohomology/v-descent →
basic Lubin–Tate and fundamental sequence → twist cohomology → early
geometric chart cover/regularity/Picard/degree/HN → ampleness and GAGA →
geometric classification. The proposed BC retargeting model is acyclic.
The current RF3 and VB3 packets still contain broader aggregate dependencies:
G-INTEGRATION requires atomic supplier integration and does not claim the
current global atlas graph is repaired.

Confirmed RT-AREA-geomlanglands/31 is addressed by the new constant finite
étale algebra theorem: every finite étale O_X-algebra over an algebraically
closed geometric base is O_X⊗_E A, for finite étale A/E. This exports
classification to VS1. SW20 16.3.2–16.3.6 and the Weil map remain VS1-owned,
with Class field theory Layer 9 as its reciprocity supplier.

## Library audit and conventions

The reviewed coverage file has no entry for this roadmap, so this is not an
inferred audited zero-coverage verdict. The pinned declaration index was
searched, and all sixteen baseline statements were read in the source trees
at Mathlib 082e2d3 and Tau Ceti f790474. Mathlib's Witt isocrystal class does
not impose finite dimension, and its classification theorem assumes rank one.
The plan adds the finite general-E category and higher-rank rational blocks,
with an explicit comparison to the existing class. Ring Picard groups,
module-sheaf finite/free APIs, line-bundle class monoids and algebraic Brauer
operations already exist; the curve computations remain new.

Arithmetic q-Frobenius is specified with E. D(s,r) has slope s/r and maps
covariantly to O(−s/r); reduced O(d/h) has rank h and degree d. The arithmetic
cyclic isocrystal endomorphism invariant is −s/r, while End O(d/h) has
invariant d/h. Tensor O(1/2) with itself is O(1) with multiplicity four.
For E′/E of degree n=ef, pullback iterates Frobenius f times and multiplies
slopes by n; induction divides slopes by n and multiplies ranks by n.
Only the sourced pull-left-adjoint coefficient adjunction is asserted.

Positive cohomology vanishing requires affinoid perfectoid S. A positive
open-ball identification has dimension d, not h, and the bounded mixed
characteristic slope range is explicit. Tensor-power global ampleness
admits the zero bundle vacuously; the unit fails against O(−1). These
conventions are covered by the tests.

## Suggested Lean file

`lean-check research/blueprint/suggested/VectorBundlesAndIsocrystals--VB0.lean`
finished with exit 0 and only `sorry` warnings. Available memory was 98 GB
before the final run. No Lake build/update/cache command or language server
was started, and no compile is left running.

The shared build has exactly pinned Mathlib 082e2d37e8. The typed core contains
36/98 API specializations, 31/72 example specializations, 3/33 named theorem
signatures in the finite Witt specialization, and 8/18 object interfaces.
The full name/contract index explicitly marks 62 API signatures, 41 examples
and 30 theorem signatures as omitted. Several typed specializations also
require indexed geometric comparisons. The file uses actual finite modules,
semilinear equivalences, finite/free sheaf witnesses, tensor base extension,
projective integral models, cochain complexes, kernels/cokernels, continuous
commuting actions and ranked HN polygons. It uses no arbitrary proposition
in place of an unavailable curve hypothesis.

Three Tau Ceti source modules are recorded in comments:
`TauCeti.Algebra.Category.ModuleCat.Sheaf.FinitePresentation`,
`TauCeti.AlgebraicGeometry.LineBundle.Basic`, and
`TauCeti.AlgebraicGeometry.LineBundle.Class`. Their statements were read at
the pin, but no compiled modules at that Tau Ceti pin were available. Those
imports and their comparisons were not compiled or rebuilt. The successful
elaboration certifies the Mathlib interfaces, with proofs unfinished; it does
not certify the missing FF geometry or a full Tau Ceti comparison.

## Checks

- Packet checker with the pinned declaration index: 0 errors, 0 warnings.
- All thirteen inherited IDs retained; local dependency DAG and proposed
  three-basic-BC-node retargeting model checked acyclic.
- All nine downloaded source hashes reproduced, and all short node excerpts
  matched the cited texts after whitespace/control-character normalization.
- Packet/document/suggested-file names aligned: 98 APIs, 72 tests, 33 named
  theorem/comparison declarations; omission statuses counted explicitly.
- Section 18 source-issue fields and source-version metadata checked using
  the shared validators. The standalone errata command is for errata-v1
  artifacts, not blueprint packets; its source checks were invoked directly.
- All planets obey the six-per-layer and name-length limits; all definitions
  have the required uses/API/tests; all implementation statuses unchecked.
- Four-file intake check and whitespace check are run before submission.

## Source reading and corrections

The reader lists all nine public URLs, exact editions, read passages and
SHA-256 values; the packet repeats their metadata. FS II.2 was read through,
including its proofs, together with the classical-point inputs of II.1 and
relative vanishing II.3.4. FF5.5/5.6, 8.2, 8.5/8.6; KL6.2/6.3, 7.3,
8.7/8.8; CS3.2/3.3; CN3.2; SW13.5.7; Kedlaya's cited Dieudonné–Manin
sections; Lurie's lecture 26; and the GLX tensor-isocrystal consumer were
checked at the passages recorded in the packet.

The current FF author copy restarts main-text pagination. HN and isocrystal
locators are fifty pages lower than the old continuous-pagination edition;
node citations now use the current printed pages and hash. CN's curve
classification is Theorem 3.9 in the actual v4 PDF, not the extraction item
numbers. CS and GLX source titles/authorship were corrected to the actual PDFs.

Fifteen source issues are recorded. Fourteen inherited findings retain
originalFinding/originalReview provenance, without asserting review of this
packet: KL E73–E75, CN E4, FS E9–E11/E75–E77 and FF E105/E106/E138/E143.
FS's quantitative bound and dropped π^{−N} factor are not used. Generation
uses the fully read KL6.2.2–6.2.4 contraction proof on two half annuli;
G-GG asks for its general-E normalization. The corrected HN, slope, adjunction
and ampleness assertions are stated in the nodes and reader.

New E15 awaits independent review: KL v5 Lemma6.3.17 identifies a p^{-n}
eigenspace with M(n) invariants despite Definition6.2.1 scaling Frobenius by
p^{-n}. The plan uses ker(φ−π^n), reindexes the norm proof and includes the
rank-one sign test. Kedlaya's page directs errata to Part II; Appendix A
pp.188–190 was checked and has no correction for that lemma. The SMF full-PDF
link returned HTTP404, so E15 is scoped to the hashed preprint, not the unread
published edition. Edition-specific collation of inherited findings remains
as recorded in their provenance.

## Precise refinements for follow-up

### G-INTEGRATION — Atomic early-layer integration

The RF0 packet still assigns the full isocrystal functor to RF3 and states a global curve map without chart coverage. Under accepted RS-20 consume only rank-one O(n) descent/sign/divisor compatibility and partial homogeneous charts there; this packet owns the full functor and global coverage. The other VB3 packet still depends on the whole VB1 aggregate for its basic BC nodes. Retarget those inputs to Bundle/Ann/Coh/VD, excluding Tw and geometric degree/HN. Until these changes are integrated atomically, the old aggregate stage graph retains cycles; the proposed direct declaration graph is acyclic.

### G-DM — Dieudonné–Manin proof inputs beyond the pinned rank-one theorem

Ked05 4.5.5–4.5.8 provides the mixed-characteristic ramified-coefficient route, but its eigenvector calculation Lemma 4.3.3 imports [19, Lemma 4.12] without a proof read here. A proof of that specific calculation and a full equal-characteristic bar F_q((π)) proof are required. Lurie26 Theorem 6 is only a statement source. This gap replaces the inherited claim that no higher-rank proof route had been read.

### G-GEOM — Independent geometric chart-cover proof

Complete the transplantation of FS II.2.9 before general-S GAGA: show at least two distinct untilt divisor classes can be represented by degree-one sections, separate every classical point by a nonvanishing section, prove the homogeneous-localization/analytic chart comparison on their overlaps, and establish the chartwise finite-projective equivalence. This is the early prefix demanded by RT-AREA-padic-1/21. The source states II.2.9 after GAGA, so its printed proof alone does not close this reordered prefix.

### G-HN — HN axiom verification without ampleness

Write the curve-specific verification of FF5.5.1, especially meromorphic trivialization with bounded finite divisor poles and a wedge-power upper bound on degrees of saturated subbundles of every fixed rank. The local DVR and torsion degree work is specified by Sat; generic-fiber exactness and boundedness must not be inferred from the classification theorem or from general-S global generation. FS II.2.12 has no expanded proof.

### G-KEY — Equal-characteristic analytic affine-line input

FS II.2.15 supplies the outline: after extending C, a nonclassical image point gives an open image in A¹/E; contraction gives surjectivity, and an E-linear diamond endomorphism of A¹ is scalar-linear. The exact analytic comparison and coefficient-E power-series argument must be supplied with both characteristic hypotheses, and the nonclassical-point/open-image step verified. AdicEtaleGeometry A1 currently plans étale theory, not this precise linear-map statement; its request is an extension in that owner direction. Do not replace it with the unsupported equal-characteristic nonperfectoid assertion.

### G-LEAN — Actual curve carriers for source-level signatures

The pinned libraries contain semilinear isocrystals, module sheaves, line-bundle classes and Brauer operations, but no relative Fargues–Fontaine curve, completed tilted Robba ring, its annular descent or HN bundle objects. The suggested file states genuine algebraic and numerical prototypes and finite locally free carrier signatures. Curve-dependent assertions whose hypotheses require these missing supplier carriers are explicitly omitted and indexed by their planned names, rather than encoded by arbitrary propositions. Replace those omissions when the named supplier carriers exist.

### G-GG — General-E corrected annular contraction comparison

FS II.2.6 estimates (II.2.1) and its π-adic inclusion are false as printed (confirmed FS extraction E75/E76). Use the fully read KL6.2.2–6.2.4 proof, whose two half-annuli and contraction constants are specified in GG, then prove its coefficient/radius normalization for general E and equal characteristic using the RF0 annular ring comparison. This gap does not question the generation theorem, but prevents treating the defective published quantitative proof as closed.

## Supplier and export contracts

These are packet requests, not separately opened GitHub jobs or messages to
other workers. Full consumer IDs are in the packet.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: Supply the completed maximal unramified coefficient field with arithmetic q-Frobenius and finite unramified extensions. Completion and ramified-Witt comparison belong to RF0; the existing unramified Frobenius theory is imported, not replanned.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`: Supply the general cyclic algebra Cyc(E_h/E,arithmetic σ,π^d), its central-simple structure, the algebraic BrauerGroup ↔ cohomological H² comparison, and inv=d/h. Include restriction multiplication by total extension degree and opposite inversion. These general algebraic/arithmetic inputs are owned by Class field theory; this packet only specializes to slope labels.
- `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`: Extend the existing ramified Witt universal property to its fraction field L=breve E and q-Frobenius, plus the general-E/integral tilted Robba coefficient comparison. Normalize π_E and σ_E, preserve topology and Frobenius under E′/E; equal characteristic uses R[[π]] and its fraction field.
- `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`: Apply accepted RS-20: expose only rank-one O(n), π^{-n} sign, tensor/dual and untilt-divisor compatibility at RF3. Remove the general finite-isocrystal functor from this supplier; it is owned by VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor. No full VB1 or ampleness prerequisite is needed for rank-one descent.
- `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`: Apply accepted RS-20: the homogeneous graded ring and maps D(g)→D_+(g) glue only on U=⋃D(g). Expose the local ring maps and overlap localization laws without claiming U=X. Early geometric coverage is VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover; general-S coverage and compatible schematic twists are VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists.
- `SchemeAndStackFoundations:SF.0`: Supply generic locally free sheaf tensor/dual/determinant and exact-sequence identities; QCoh finite-type/global-generation predicates; Proj/localization gluing; extension of sections after clearing homogeneous denominators on qcqs schemes; regular dimension-one torsion-free/coherent and finite-length DVR module facts; finite-support cohomology and affine cohomological criterion. These must apply to the non-finite-type but regular noetherian geometric curve and to the nonnoetherian relative Proj. No algebraic-curve finite-type assumption may be added.
- `SchemeAndStackFoundations:SF.1`: Supply effective finite faithfully flat/Galois descent of finite projective modules, with compatible semilinear endomorphisms, ordinary coefficient extension/restriction adjunction for finite separable field extension, and gluing of such data. V-descent on perfectoid annuli uses the D2 v-theorems in addition; ordinary fpqc descent alone does not establish the analytic v-stack.
- `PerfectoidQuotients:Q4`: Supply FS II.0.2/ECD5.8: a Zariski closed subset of an affinoid perfectoid admits the universal strongly Zariski closed perfectoid quotient, surjective on the ring and almost surjective on the plus ring, compatibly with tilt. The present Q4 packet has radical quotient algebra but no exact named node for this complete geometric statement.
- `KTheoryLowDegrees:Z.2`: Supply the K₀ identity and exact-sequence criterion used in FS II.2.6/KL1.5.3: the kernels in two finite free presentations of the same finite projective module have equal K₀ classes and become isomorphic after finite free stabilization. This is ordinary finite-projective K₀; the Frobenius-compatible lift and annular convergence remain this packet’s proof.
- `AdicEtaleGeometry:A1`: Supply the perfectoid-base analytic comparison needed by FS II.2.15: E-linear maps (A¹_{C♯})^diamond→(A¹_{C♯})^diamond are analytic and their power series satisfying g(πX)=πg(X) are g(X)=aX, in both characteristics. Existing étale-theory targets do not state this. Add it as analytic foundations in AdicEtaleGeometry or its existing adic anchor extension, without duplicating the generic diamond functor.
- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`: Retarget the two-term hypercohomology definition from the entire VB1 stage to VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology and VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology. It must remain H⁰ of derived RΓ for two-term complexes; a cokernel does not define it.
- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`: Provide FS II.2.2–II.2.4, including degree-one untilt divisor/evaluation sequence, connected basic positive spaces and the negative A¹/E presentation. Replace its whole-VB1 prerequisite by VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles, VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent, VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology and VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology; it must not import Tw or HN, since Tw consumes this node.
- `VectorBundlesAndIsocrystals:VB4`: Own FS II.3.4’s relative geometric-slope vanishings: negative fiber slopes imply H⁰=0; nonnegative slopes kill H¹ after pro-étale cover; positive slopes yield an étale neighborhood with vanishing on every affinoid base change. Their proofs consume VB3 positive resolutions and VB4 family trivialization. Do not route them back into the early twist-cohomology stage.
- `VStackSheavesAndLisseCategories:VS1`: Consume VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras for SW20 16.3.2–16.3.6 divisor/Weil-map work. VS1 owns that construction and uses the Class field theory Layer 9 reciprocity input; this packet exports only the constant finite étale algebra theorem required by RT-AREA-geomlanglands/31.


## Where to resume after independent review

All five target passes are done; no second issue was claimed in this run.
Review the source corrections and ownership order first. Refinement work
starts with G-INTEGRATION's atomic RF3/basic-BC retargeting, then the early
geometric chart and HN inputs, the Dieudonné–Manin eigenvector/equal-characteristic
proof and the both-characteristic key-extension argument. Resolve the listed
supplier contracts and G-GG's coefficient normalization. Replace each G-LEAN
omission only after its actual supplier carrier exists, then check the
geometric comparisons and full Tau Ceti imports at the pin. These are the
remaining mathematical obligations, not unfinished target inventories.

No scratch path or downloaded text is needed to resume: all definitions,
contracts, locators, hashes, proof routes, correction evidence and omission
names are preserved in the four deliverables.
