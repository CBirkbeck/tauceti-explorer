# Independent review of R18.3

**Verdict: accepted as a corrected planning pass.** R18.3 is planned, not
closed, under Protocol section 0. Every target has a specification and its
prerequisites end in library declarations, supplier targets, explicit requests
or recorded gaps. The five remaining obligations are retained; acceptance does
not certify their proofs or a formalization.

Reviewer: Codex / GPT-6, session `codex-rHSTAa`, 13 October 2026.
The input plan was written in the separate `codex-Wlk3qi` session. This review
did not write that plan.

## Inventory and result

- Checked all 12 new targets and all 19 targets imported from the accepted
  R18.2 packet. Six new targets were corrected; six were verified. Five imported
  targets have explicit assembly corrections/refinements, and the other 14
  retain their verified specifications and stated qualifications.
- Added no mathematical nodes. Confirmed the original 10 baseline declarations
  and added seven existing declarations: four SU(2) declarations and three
  polynomial-evaluation/kernel declarations. All 17 were checked at their pins.
- Read seven source texts at the applicable locators, including the
  maintainer-cleared Platonov–Rapinchuk–Rapinchuk volume. No passage or source
  file from that book was copied into the repository or scratch files.
- Checked 11 supplier requests and the relevant finer supplier targets. Retained
  five explicit gaps, 19 stable imported IDs and six accepted planets.
- Confirmed the existing local sign-inference finding and added one scoped
  action-normalization finding. Both refer to the dated KW author copy, whose
  hash is recorded. The publisher text was unavailable and is not claimed to
  have been collated.
- The suggested file has 150 lines, four light definitions on existing
  carriers, representative signatures and examples. It elaborates at the
  pinned baseline with only eight `sorry` warnings.

The report, packet and reader describe imported targets as they must be
assembled. The accepted R18.2 packet was not edited. `dependencyReplacements`
and `importRefinements` are explicit assembly instructions, not an assertion
that an extra JSON field has already changed its dependency graph.

## New targets

| Target suffix | Verdict | Evidence and qualification |
| --- | --- | --- |
| effective-neat-level | Verified | AA.4 neat-level-exists and neat-torsion-free apply to the adjoint group PGL₁(D). The finite effective stabilizer injects into the resulting torsion-free arithmetic group and is trivial. This chooses level without a field-degree assertion. |
| division-parity-character | Verified | PRR §1.4.2, pp.31–33, equation (1.16), gives the division valuation input. Scalar norm is already square in Tau Ceti. A chosen root r²=ψ(Nrd Π)⁻¹ gives coefficient action r and right action r⁻¹. The nontrivial-central-character test excludes arbitrary sign values. |
| finite-quaternion-transfer | Corrected | JL Theorems 14.2 and 14.4 are global. Replace them by Theorem 4.3(i),(v) and its degree-one special case, p.66; Proposition 15.5, pp.246–248; Theorem 15.1, p.239, and its proof, p.248. These supply local twists, central characters, the opposite elliptic-character relation and the square-integrable image. |
| real-quaternion-weight-transfer | Corrected | Import existing pinned SU(2) representations and classification. BR Remark 9.6, pp.18–20, and §13.1, pp.32–33, supply the real comparison. Retain Taylor Lemma 1.3's dual coefficient realization and Carayol §0.10's norm twist. |
| quaternion-spectral-transfer | Corrected | Require a global quaternion division algebra for the dimension-greater-than-one assertion. A globally split algebra has Eisenstein representations. BR Theorem 18.1 and Proposition 18.2, pp.44–45, supply the proved transfer; exclude norm characters and retain the classical local restriction, rather than declaring the full extended image cuspidal. |
| liftable-reduction-image | Verified | Invariants in a free DVR lattice are saturated, so reduction of that submodule injects. The global image is the sum of these liftable components. The sign C₂-action, trivial action, odd-order averaging and direct-sum tests distinguish it from all residual invariants. |
| tw-twist-reduction-image | Verified | KW Lemma 7.4(1), pp.64–65, identifies integral evaluation components after stabilizer annihilation. Their reduction images agree and are Hecke stable. There is no asserted integral Hecke intertwiner or unrestricted reduction surjectivity. |
| dyadic-level-norm-squares | Corrected | Remove its dependency on the norm twist it justifies; add it as a prerequisite of that twist. KW §§7.4–7.5, pp.63–66, uses Δ′/Δ′[N]. For a>b, its ratio kernel consists of squares; det=(a_v/d_v)d_v². The equality case fails. |
| iwahori-selected-root | Verified | SR.2 normalized induction and Iwahori/Jacquet comparison, Taylor Lemma 1.6(2), pp.744–745, and Lemma 2.2, pp.746–747, give the polynomial and selected-root map. The old-pair matrix acts on (A,−1) with eigenvalue A only when A is an actual root. Integral projectors require unit root difference. |
| early-eigenform-galois-compatibility | Corrected | Add R18.4/cohomological-eigenspaces beside finite-cohomology. Extract the Galois multiplicity factor, not all isotypic H¹. Carayol §§0.3–0.11, pp.409–412, has a finite discrete-series hypothesis at even degree and gives compatibility away from p. The Taylor extension and p-adic special-type computation remain explicit obligations. |
| steinberg-residual-obstruction | Verified | For q≡1 mod p the special representation's diagonal Frobenius factors have the same residual root. This contradicts distinct residual roots. The genuine stable lattice and early local compatibility are required; no patching argument is used. |
| ramified-unramified-sign-control | Corrected | Arithmetic γ(Frob) equals the right-translation eigenvalue λ, with λ=r⁻¹ at full division level. Retain the odd-prime identifiability qualification and the full-level character at every ramified finite place in the dyadic case. The upper-right extension can vary. |

## Imported targets, APIs and tests

All imported targets were checked against their statements, uses and source
locators, principally KW §7, pp.57–67, and Taylor pp.737–748.

| Imported targets | Result |
| --- | --- |
| definite-class-set; quaternion-weight | Effective scalar quotient, representative transport and central compatibility retained. The tensor coefficient is the AF.4 specialization. Its pairing is not asserted perfect without its source range. |
| definite-specialisation | Added assembly API for inverse evaluation/recovery, representative transport and coefficient intertwiners. Added three discriminating tests: trivial stabilizers; integral sign versus mod-two invariants; changed representatives with transported values. |
| neatness-base-change; integral-pairing | Averaging requires unit effective isotropy orders. Perfect pairing additionally requires a perfect coefficient pairing and its exact norm similitude. Taylor's automatic smallness hypotheses and weight range are retained. The distinct Khare field-degree lemma remains a source gap. |
| split-hecke-normalisation; norm-branch; definite-degeneracy | Arithmetic constant term is qS. Norm factoring uses strong approximation for D¹, not transfer. Degeneracy is the residual definite statement with trivial coefficient action at the auxiliary place and away-place localization. |
| definite-jl | Characteristic-zero comparison uses the corrected local/real/global targets and actual rational models. No integral JL lattice equality or integral cusp/norm direct sum is inferred. |
| isotropy-exponent; base-change-annihilator | Corrected the reduction argument to inject only p-subgroups, since the kernel is pro-residue-characteristic. The norm sequence is left exact. Exact character orders and complete splitting remain hypotheses of the annihilator result. |
| tw-level; tw-stabilisers; tw-freeness | Retained N-torsion quotient, effective stabilizer equality, free diamond fibers and group-algebra rank. Invariant DVR lattices are free even at bad isotropy orders; this does not imply arbitrary base change. |
| tw-localised-control | Selected roots, early compatibility, Steinberg exclusion and definite residual degeneracy precede control. The R19 prerequisite is replaced by the early target. Prime selection and patching remain consumers. |
| dyadic-norm-twist; dyadic-hecke-twist | Square norms precede the level-preserving twist. The direct double-coset identities require no Galois/control input. A nontrivial diamond twist transports the correspondingly twisted coinvariants; untwisted augmentation is not automatic. |
| dyadic-sign-extension | Corrected the assembly wording to chosen central-compatible roots at all specified division factors, including those away from two. Its three tests cover the empty set, distinct integral signs with equal reduction, and a nontrivial central character. |
| residual-hecke-ideal | Confirmed maximality from coefficient-surjective evaluation. ActingFactor requires relation-kernel inclusion and uniqueness, not an R19 realization prerequisite. Added the relation T_v=0/trace=1 non-example. CDN's geometric convention supplies the kernel construction pattern, not an unchanged arithmetic dictionary. |

The five imported definitions/constructions already have at least three tests
each. The two new constructions each have four tests and usable APIs. The reader
extends these with identity/composition and transport laws where needed. The
additional specialization and sign-extension tests prevent an unrestricted
coefficient product, dependence on representatives, and incompatible central
signs. Four new executable Lean examples check the uniformizer inversion and
the selected-root degeneracy sign. Heavy adelic, transfer and Galois carriers
remain README targets; no fake carrier or data-valued `sorry` was introduced.

## Baseline, current library and suppliers

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the full statements of
DoubleCoset.Quotient/eq, Representation/invariants, MonoidAlgebra, Module.Free,
Module.Finite and LinearEquiv support exactly the uses recorded. Module.Finite
means finite generation, not finite cardinality or freeness. The additional
MvPolynomial.eval₂Hom and RingHom.ker/ker_isMaximal_of_surjective provide actual
evaluation and kernel operations; maximality retains surjectivity. The cited
files were compared with raw files at the pin.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, normForm_coe supplies
scalar norm z², and card_elementaryTwoQuotient_units supplies the unit
square-class count. The four additional SU(2) declarations were also read and
compared with raw pinned files. No baseline citation was removed as false.

The current read-only Tau Ceti library at `a91d3aaf` and TauCetiRoadmap at
`0d144d04` were checked. CompactGroups and CharacterTheory were read as nearby
roadmaps. Current HeckeCoset.heckeSum and its representative-independence theorem
are imported as existing work, with their invariance hypotheses; this newer file
is absent at the old pin and is not used in the suggested file. The reviewed
library audit has no built R18.3 definite integral/Taylor–Wiles target.

Direct supplier checks included AA.3 class-number-finite; AA.4 neat levels,
torsion-freeness and strong approximation; SR.0 smooth/admissible objects;
SR.2 parabolic induction and Iwahori/Jacquet comparison; SR.3 Steinberg and
square-integrability; AF.1 real GL₂ discrete series; AF.4 coefficient lattices,
local stable lattices and rationality; AF.5's existing central-character forms;
AS.4 finite multiplicity/compact quotient and AS.6 trace formula; R01.1 stable
lattices, scalar extension and reduction; R01.2 special objects and Frobenius
semisimplification; R06.5 proper semistable comparison; and R18.4 finite
cohomology/cohomological eigenspaces.

The R06.5 comparison proves semistability under its geometric hypotheses. It
does not by itself identify the special local eigenfactor. That computation is
explicitly requested and recorded as a gap. AS.6 matching-function and SR.3
elliptic-character extensions are also explicit contracts, not attributed to
generic statements which lack them.

## Source findings, ownership and remaining obligations

`E-R18.3-1` is confirmed as a gap in KW's local odd-prime sign inference:
at an unramified residual place with q≡−1 mod p, opposite signs can have the
same unordered Frobenius pair. No global automorphic counterexample is alleged.
The safe target has an explicit identifiability hypothesis.

`E-R18.3-2` is a normalization correction to the author-copy remark after
Lemma 7.2, p.61, interpreted with the stated right action. If ψ(Nrd Π)=4 and
the coefficient value r=1/2, right translation has λ=2 and arithmetic γ has
the same value; γ²=4. Inverting λ instead gives square 1/4. Taylor Lemma
1.7(1), pp.744–745, has the direct arithmetic operator value. Inverse
coefficient action is a valid convention, now explicitly distinguished. The
sourceVersions entries record the actual texts, hashes, searches and failed
publisher access. The findings are not allegations about unread published text.

RT-AREA-automorphic-1/12 is addressed by the minimum local, real and global
quaternionic transfer owned here, built on lower-tier supplier contracts. R17
imports these outputs. The early Galois target similarly supplies the input
formerly requested from R19, before TW control.
RT-AREA-langlands-2/19 is addressed by R18.3 ownership of the geometry for a
given admissible Q; R22 selects primes and applies it. These ownership moves
do not add duplicate plans. A node-level walk after applying the assembly
substitutions found no reachable cycle. Stage contracts and requested extensions
must still be expanded before closure is certified.

The next job must obtain the exact Khare smallness/field-degree source, complete
the even-degree Galois construction beyond Carayol and the weight-two p-adic
local-type computation, instantiate the genuine integral adelic carriers,
apply the assembly refinements/dependency changes, and resolve or retain the
exceptional sign qualification. No question blocks acceptance of this planning
pass. The maintainer's eventual publisher collation should examine the two
KW findings before describing published wording.

## Validation

- `python3 scripts/check_blueprint.py` on the reviewed packet: zero errors,
  zero warnings; complete packet, one planned stage, no closed stage.
- Section 18 source-issue and source-version validators: passed.
- `lean-check` on the suggested file: exit 0 at the pinned shared build,
  eight warnings, all and only declarations using `sorry`.
- `git diff --check`: passed. No copied source passages, private paths or
  edits to another job's deliverables were introduced.
