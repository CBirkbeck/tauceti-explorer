# Independent package review: SelmerIwasawaCohomology

Issue: #8897. Reviewer: Codex, session codex-53QUXT. Date: 2026-10-13.
Verdict: **needs_changes**. This is a completed fixing review, not a checkpoint.
The corrections below are applied. Four prerequisite/proof decompositions remain
insufficient for an upstream draft under PROTOCOL's no-gap standard.

## Remaining defects and where to resume

1. **Arithmetic K(π,1), §3.15 and the étale supplier contract.**
   SchemeAndStackFoundations SF.6 is a handoff stage; its packet has no target
   proving arithmetic universal-cover acyclicity. SF.2's field comparison and
   finite-cover equivalence do not prove the cohomology comparison for
   Spec O_F[1/S]. Kato §§8.2, 8.5 and 12.2 support the specified degree-one
   convention and norm comparison, not this general all-degree theorem.
   Supply a source-located decomposition of the finite p-primary comparison,
   its real-place modification and its derived lattice limit before using it.
   The target remains in §3.15, now explicitly marked unsupplied. In particular
   do not replace j_* by Rj_* in every degree: the inertia terms remain.
2. **Completed algebraic closure and Tate–Sen, §§4.1 and 4.4.**
   LocalFieldsRamification Layer 1 supplies finite local-field valuation and
   unit structure. Neither it nor the newer LocalGaloisGroups roadmap supplies
   the claimed C_p construction, continuous extended action and exact twisted
   Tate–Sen H⁰/H¹ calculation. The packet's own completion/Tate–Sen extension
   request was still open. PerfectoidSpaces supplies period-ring operations
   after the perfectoid field input, not this Galois cohomology calculation.
   State the construction, precise cohomology range and coefficient/topology
   hypotheses with their proof steps as local targets or exact lower supplier
   targets. The period fixed-field proof cannot currently start with an import
   from LocalFieldsRamification Layer 1. This is now an explicit gap.
3. **Ordinary modular parity, §4.28.**
   Nekovář Theorem 12.2.3 and Remark 12.2.4, pp. 421–422, do give the stated
   rational/quadratic-field consequence: the base field is ℚ, the character is
   trivial and the odd-degree alternative applies. The remaining gap is the
   proof dependency, not the statement's locator. Ordinary-family variation
   (§§12.7–12.8) and the rank-one input of §12.10.9, pp. 526–528, have not been
   decomposed into this package, its bundle, or an exact lower-tier supplier.
   Supply those proof targets without citing a higher consumer as an input.
4. **Two-primary parity, §4.29.**
   Dokchitser–Dokchitser Theorem 4.19, pp. 593–594, gives the conclusion but
   attributes p=2 to Monsky [26]; its displayed argument proves the odd-prime
   case. Reading that attribution is not a proof decomposition. Supply the
   two-primary argument, including the divisible-Sha contribution to infinite
   Selmer corank, with exact lower prerequisites. The root-sign calculation
   is now independently sourced and illustrated, so it is not the remaining
   parity blocker. Computing dim Sel₂ cannot replace this proof.

These are named gaps rather than silent supplier promises. They require source
and target design beyond a small correction; no unsupported Lean carrier or
assumption containing an endpoint was introduced to conceal them. The earlier
real-place p=2 derived-duality concern is supplied by ArithmeticGaloisDuality
D7.5's explicit complete-Tate/unbounded target and is not a fifth finding.

## Corrections applied

- Removed the new annihilator definition and basic annihilator API in §1.1:
  `orthogonal`, `mem_orthogonal`, `orthogonal_antitone`, `orthogonal_bot`,
  `orthogonal_top`. Mathlib already has `Submodule.orthogonalBilin`, its
  membership lemma, antitonicity, bottom formula and top-as-kernel formula.
  The representative file now uses that actual operation. The finite perfect
  pairing results are retained: they pair two independent Z/n-modules into
  Z/n, unlike current Tau Ceti's self-pairing finite bilinear module into ℚ/ℤ.
- Removed three further duplicate completion theorem targets:
  `pCompletionMap_id`, `pCompletionMap_comp`, and
  `pCompletion_bijective_of_finite`. They are respectively Mathlib
  `AdicCompletion.map_id`, `AdicCompletion.map_comp`, and
  `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`.
  Native completion notation and maps are light specializations; the new
  arithmetic comparisons remain. All removals are cited in the boundaries,
  without removed-target stubs or renumbering gaps.
- Added perfect-pairing negative controls: 3xy over ℤ is nondegenerate but not
  perfect (curried maps are not onto), and the zero-to-zero pairing is perfect.
- Rewrote §3.7's twist proof to use completed induced coefficients or the
  diagonal finite-coefficient degree-one construction. Compatible roots are
  not a nonzero element of the integral H⁰ corestriction limit, which is zero.
  Negative powers use the dual generator. The witness χ(γ)=4 gives scalar
  1/4 for twist +1 and scalar 4 for twist −1. Kato Theorem 12.5(1), p. 221,
  now replaces the incorrect §12.2 twisting citation; Rubin B.3.1 and the
  degree-one specialization locator are kept with their precise roles.
- Corrected §3.15's universal-norm locator from Rubin B.5.1 to B.3.3 and
  Corollaries B.3.4–B.3.5, pp. 154–155. Restricted the j_* tower check to the
  degree-one comparison with its limit hypotheses. Exposed defects 1 and 2
  above in the supplier contracts and consuming sections.
- Added interval and morphism controls for Fontaine–Laffaille data: a weight-zero
  line lies in [0,0] and [−1,1], but not [1,2]; a nonzero object cannot lie in
  a reversed interval. The underlying identity from Frobenius 1 to Frobenius 2
  preserves the filtration but is not a Fontaine–Laffaille morphism. Lean has
  a finite-characteristic witness, besides the prose integral example.
- Corrected the general complete-DVR scope of §§3.18 and 3.21 by requiring a
  finite residue field when “finite” means finite cardinality. For infinite
  residue field k, X=k over k[[λ,T]] has no nonzero finite-cardinality submodule,
  yet char(X)=(1) and Fitt(X)=(λ,T). The finite-length formulation is the
  appropriate generalization. Changed the residue quotient from (p,T) to
  (λ,T), including the equal-characteristic control p=0.
- Replaced the unsupported Burungale–Tian pp. 6–7 locator for the residue root-sign
  table with Cowland Kellock–Dokchitser Theorem 3.40, p. 19, and its local
  calculations. Added actual n=1 and n=5 root products, including the convention
  v₂(0)=∞ and the zero normalized c₆ term. A Lean finite-ring calculation pins
  the differing odd c₄ residues 3 and 11 modulo 16.

## Scope, plan fidelity and ownership

Read all 94 numbered subsections, their APIs, hypotheses, Checks, dependency
lists and the full representative file. Cross-walked the accepted packet's
95 nodes, 154 API entries, 108 unit-test entries and historical gaps against
those sections and the current ownership deferrals. The packet and metadata
are unchanged. No accepted arithmetic endpoint or definition was deleted to
make the file shorter. Already-owned finite Kummer theory, coefficient squares,
local power-class finiteness, all-degree discrete Shapiro, local completion,
Hodge carriers and basic duals remain boundary inputs.

Models read: GlobalNumberFields and HodgeStructures READMEs, plus the
GlobalNumberFields and ZigzagPreprojective suggested files. HodgeStructures
has no suggested file in the supplied checkout. Applied UPSTREAM_GUIDE and
PACKAGE_REVIEW's current statement-only shape, rather than copying older model
admissions. Definitions have real bodies over native carriers; heavy derived,
arithmetic, period and Iwasawa constructions remain README targets and appear
in the closing comment. Definitions' existing Checks were read for computed,
degenerate and non-example content; the additional perfect-pairing and
Fontaine–Laffaille controls above distinguish the plausible wrong definitions.

Read the 38 pinned baseline declaration statements (including the actual
AdicCompletion namespace, not the similarly named Cauchy/Hausdorffification
operations), then searched target objects, fields, hypotheses and operations
in the supplied current checkouts. Current roadmap commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The nine newer roadmaps checked were AlgebraicVectorBundles, DifferentialGeometry,
IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups,
PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Also checked
Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. Current library searches covered Kummer and coefficient
maps, finite bilinear orthogonality, p-completion/norm decompositions, Shapiro,
contragredient character actions, Selmer kernels and Hodge/period interfaces.
The additional removals are listed above. Existing LocalGaloisGroups Layer 7
and restricted-product ownership do not supply the four missing contracts.

The gap walk used earlier layers, the ArithmeticGaloisDuality bundle and
lower-tier suppliers. In particular the finite-real-place Poitou–Tate theorem
was not substituted for D7.5's unbounded correction. PadicHodgeRegulators,
ordinary modular families, Heegner theory and analytic main conjectures were
not silently imported from higher consumers.

## Source verification

Random sample: 15 accepted packet nodes selected with seed 8897; each listed
locator was read in the named edition. Historical ownership-only nodes were
checked as inputs rather than reinstated as targets. Printed/PDF offsets:
Rubin +10; Nekovář +9; Kato −115; cleared Liu et al. −106. Public source PDFs
were held only in job scratch. Liu et al. was read only in the maintainer-cleared
library, without copying its file or extracted passages into scratch or the
repository. No source excerpts are included in this deliverable.

| Sample node | Source locator read | Result |
| --- | --- | --- |
| L3/universal-norms-unramified | Rubin B.3.3, Cor. B.3.4–5, pp. 154–155 | Correct finite-type/tower hypotheses. |
| L2/pontryagin-dual | Burungale–Tian §§1.0.1, 3.1, pp. 1, 6 | Corank/dual convention confirmed; inverse action checked directly. |
| L4/greenberg-conjecture-tate-twists | RJW Example 13.22, Remark 13.23, pp. 71–72 | Proposition equivalence, positive even twist; n=0 exception retained. |
| L4/global-finite-reduction | Liu et al. Defs. 2.4.1–2, L. 2.4.3, p. 129; L. 2.4.5, P. 2.4.6(1), p. 130 | Saturation and global-image distinction retained. |
| L0/kummer-level-compatibility | Rubin I.2.1, p. 3; RJW (10.7), p. 52 | Correct coefficient direction; current library input. |
| L1/ordinary-annihilator-correction | Nekovář §§6.7.1–6, pp. 151–153; §§8.9.6–7, pp. 240–244 | Derived complements and local correction scope retained. |
| L0/local-power-class-finite | Rubin B.2.7, p. 153 | Finite local field hypothesis; library result remains deferred. |
| L3/localization-surjective | Greenberg P. 2.6.3, p. 11; §4.4, pp. 24–25 | Three alternatives and elliptic specialization confirmed. |
| L3/local-cofree-euler | CGLS L. 1.1.1–2, P. 1.1.3, pp. 6–7; L. 1.3.1, p. 10 | Residual exclusions and specified local ranks confirmed. |
| L1/derived-local-complements | Nekovář §§6.2.1–7, pp. 137–140; §6.7, pp. 151–154 | Nullhomotopy/adjoint formulation, not only H¹ annihilation. |
| L2/selmer-data | Mazur–Rubin Def. 1.1, p. 4; Def. 2.1, p. 6 | Local-condition and finite-set interfaces confirmed. |
| L2/finite-condition-lattice-duality | Rubin P. I.4.3, p. 9; Mazur–Rubin P. 1.7, p. 5 | Orthogonal rational inputs at p remain hypotheses. |
| L2/condition-propagation | Mazur–Rubin Def. 1.1, p. 4 | Image versus preimage direction confirmed. |
| L3/etale-iwasawa-comparison | Kato §§8.2, 8.5, pp. 180–184; §12.2, pp. 220–221; Rubin B.3.3–5, pp. 154–155 | Wrong Rubin B.5.1 fixed; unsupplied all-degree comparison exposed. |
| L0/weak-semisimplicity | Liu et al. Def. 2.1.2, p. 121 | Only the invariant eigenvalue is tested. |

All locators flagged as unverified in the incoming handoff were also checked:
Nekovář Theorem 12.2.3/Remark 12.2.4, pp. 421–422, §§12.10.1–2,
pp. 521–522, §§12.10.8–9, pp. 526–528; Dokchitser–Dokchitser
Theorem 4.19, pp. 593–594; Burungale–Tian pp. 6–7. The first two theorem
locators support the endpoints but leave proof dependencies 3 and 4; the last
locator does not supply the displayed residue root-sign table. For its
replacement read Cowland Kellock–Dokchitser Theorem 3.40, p. 19,
Theorem 2.3, pp. 4–5, Theorem 2.13, pp. 7–8, and Appendix A, pp. 26–27.
Additional targeted reads checked Kato 12.5(1), p. 221, and Nekovář
Theorem 6.3.4, p. 143, for twist and global error-cone direction.
The incoming handoff also says its original Perrin-Riou equality was not
authenticated. No such unconditional equality or Perrin-Riou theorem locator
remains in §4.12. Read the replacement Bloch–Kato §3.7, Proposition 3.8 and
Corollary 3.8.4, pp. 353–356, and RJW Remark 13.20, p. 70: the conditional
exact-sequence calculation retains both explicit exceptional examples. The
remark supplies a comparison pointer, not a general equality theorem.

## Adversarial mathematics pass

Each row covers the section's definitions, API identities and endpoint under
its stated hypotheses; the instances are computations or explicit exclusions,
not a claim that elaboration proves the mathematics. Arithmetic computations
that use an unresolved input are marked with its finding number. All zero
objects and identity maps were also tried: they do not remove the nonzero
negative controls. The sign and direction conventions have the witnesses
listed after the section table.

| Section and statement family | Instances tried and computed obstruction/value | Outcome/change |
| --- | --- | --- |
| §0.1 Comparison of the multiplicative completion with Mathlib adic completion | Z/2 at p=3 and Q have zero completion; Q_p/Z_p has nonzero characters but zero quotient tower; infinite free sum has a completed infinite-support element. | Removed duplicate functor/tensor targets; unrestricted tensor/double-dual agreement excluded. |
| §0.2 Completion of global units | F=Q, m=0: a root is the given unit; for m>0 integrality of x and x⁻¹ detects the unit condition. | Unit-root/injection hypotheses retained. |
| §0.3 Completion of S-units | S=S∞ recovers ordinary units; Q with S={∞,p} adds the valuation generator p. | Finite S and outside-S valuation condition retained. |
| §0.4 Local completion and algebraic tensor comparison | Q_p principal units: multiplication Z_p⊗Z Z_p→Z_p kills a⊗1−1⊗a; at ℓ≠p the pro-ℓ factor completes to zero. | Surjective algebraic tensor comparison is not called injective. |
| §0.5 Profinite topology on the local Kummer comparison | m=0 gives trivial power quotient; m>0 finite local quotients give compact finite-discrete inverse limits. | Topology comparison only; existing finiteness deferred. |
| §0.6 The limit Kummer map | R at p=2 gives Z/2 on both sides; separably closed field gives zero. | Characteristic p excluded for Kummer equivalence. |
| §0.7 The system μ_{p^m}(K) is Mittag-Leffler | Finite roots at each level have eventually stable images; Q at odd p has trivial roots. | ML does not require surjective H⁰ transitions. |
| §0.8 The p-adic Kummer identification | Real p=2 inverse limit remains Z/2; finite-field p-primary multiplicative group persists. | Milnor H⁰ term killed by ML, not by H⁰=0. |
| §0.9 The Kummer identification for S-units | Q and S={∞,p} give rank-one S-unit completion; a finite class group has zero p-adic Tate module. | S must contain p; class-group finite-level terms retained until the limit. |
| §0.10 Which inverse-limit hypotheses hold | Full number-field H¹ can be infinite, but power-quotient transitions are onto. | Infinite cardinality is not a failure of ML. |
| §0.11 Cup products and Shapiro under p-adic Kummer | For base-field a in degree-d extension, cor κ(a)=dκ(a); cup with a twist-one class has twist two. | Norm/corestriction direction and twist target retained. |
| §0.12 Weak semisimplicity at the invariant eigenvalue | Unipotent Jordan block at eigenvalue 1 kills the invariant line in coinvariants; Jordan block at 2 has σ−1 invertible. | Weak semisimplicity distinguished from full semisimplicity. |
| §0.13 Procyclic invariants and integral lifting | σ=1+p on Z_p has rational invariants 0 but residual invariants 1; trivial rank r has both dimensions r. | Dimension and free-lattice hypotheses retained. |
| §1.1 Perfect pairings and dual local conditions | Pairing 3xy on Z is nondegenerate but curried image is 3Z; zero pairing on nonzero modules has full annihilator; zero/zero is perfect. | Native annihilator used; new perfectness controls. |
| §1.2 Compatibility of the local pairings for T, V, W and W_M | Identity coefficient map gives identical pairings; reduction of an integral pairing to E/O can be zero despite its rational value. | Pairing coefficient targets and adjoint directions retained. |
| §1.3 Local conditions and derived orthogonal complements | Add k[0] mapping to zero: same H¹ image, different error cone; zero pairing cannot yield perfect complements. | Derived nullhomotopy/error data retained. |
| §1.4 Duality for a global mapping fibre with local conditions | Global duality pairs degree i with 3−i; nonzero local Err survives the fibre map. | Degree-three shift and p=2 real correction retained. |
| §1.5 Strict ordinary and inertia ordinary annihilators | M⁺=0: strict=0, inertia condition=unramified; a trivial quotient has nonzero unramified line. | Exceptional quotient is not discarded. |
| §1.6 Nonsingular torsion classes away from p | Unramified Z/p at ℓ≠p has unramified classes Z/p; cup of two inflated classes factors through residue H²=0. | Annihilation is not exact complementarity for ramified coefficients. |
| §2.1 Compact and rational Selmer data | One localization (x,y)↦y on k²: strict first axis, relaxed k²; no places gives k². | Compact/rational data carry actual maps and conditions. |
| §2.2 Compact and rational Selmer kernel | Zero localization with zero condition still gives all global classes; projection has first-axis kernel. | Local condition itself is not the global kernel. |
| §2.3 Change of local conditions | Global module 0 and local quotient k give zero change map, not a surjection. | Exactness ends at the local-quotient term without right exactness. |
| §2.4 Functoriality of Selmer modules | Identity morphism preserves kernel; a map failing the localization square need not preserve it. | Compatibility square and condition inclusion retained. |
| §2.5 Propagating local conditions | Zero preimage is ker g; surjective image of top is top; zero image is zero. | Image/preimage and composition directions retained. |
| §2.6 From V to T and W; saturation | V=Q_p and L_V=0: preimage includes coefficient torsion kernel; a rational subspace quotient is torsion-free. | Arithmetic O-saturation distinguished from integer test signature. |
| §2.7 The unramified condition | Trivial Z/p at ℓ≠p gives H¹_ur=Z/p; Q_p(1) gives zero when Fr−1 is invertible. | Frobenius acts on inertia invariants, not the whole module. |
| §2.8 Greenberg's local condition | F⁺=0 recovers unramified; F⁺=M gives all H¹; strict can differ from inertia kernel. | Greenberg versus strict condition retained. |
| §2.9 Compact and rational Galois Selmer groups | Enlarging S with a finite unramified condition retains the Selmer group; relaxing can add classes. | Finite S includes p, infinity and ramification. |
| §2.10 Pontryagin duals with the contragredient action | A γ-eigenvector with eigenvalue c yields dual eigenvalue c⁻¹; trivial action remains trivial. | Contragredient inverse and left-action composition retained. |
| §2.11 Coranks | Finite discrete p-primary module has corank 0; Q_p/Z_p has corank 1; r=0 gives 0. | Rank computed on compact dual, not tensoring discrete torsion with Q_p. |
| §2.12 Passage from finite elliptic Selmer groups to p^∞ | An elliptic rational p-torsion point contributes to finite Sel_p even in rank zero. | p∞ corank retains divisible Sha; finite-level dimension is different. |
| §2.13 Dual Selmer structures | Relaxed condition dualizes to strict; at real p odd H¹=0, while p=2 can be nonzero. | Dual support set and named pairing preserved. |
| §2.14 Dimensions of unramified classes | V=Q_p at ℓ≠p: unramified dimension 1; V=Q_p(1): unramified dimension 0, singular dimension 1. | Away-p and Tate-dual dimensions retained. |
| §2.15 Finite against unramified classes at bad primes | Unramified T makes W^I divisible and the finite correction zero; bad inertia can leave W^I/div nonzero. | Tamagawa correction and real p=2 terms retained. |
| §2.16 Local duality for the finite condition on V | Q_p and Q_p(1) away p pair a full unramified line with zero unramified line. | Dimension count is required in addition to cup annihilation. |
| §2.17 Local duality for the finite conditions on T and W_M | M a unit gives zero finite quotient; nonunit M produces finite dual modules; p-local arbitrary conditions need not be orthogonal. | M≠0 and rational orthogonality hypotheses retained. |
| §2.18 Selmer groups of T and W as limits | Finite class groups have zero Tate module but nonzero finite torsion levels; strict kernels need not surject onto torsion in the limit. | Strict exception and finite-level ML bookkeeping retained. |
| §2.19 Poitou–Tate for Selmer groups | Σ=Σ₀ makes the changed local sum zero; nonzero cokernel is dual to the dual Selmer quotient. | Poitou–Tate supplies image annihilation, not summed local duality alone. |
| §2.20 Poitou–Tate for the Selmer group of W^* | Finite local cokernels dualize to finite quotients; a free Z_p cokernel dualizes to Q_p/Z_p. | Inverse versus direct limit duality retained. |
| §2.21 Selmer complex as a mapping fibre | All local maps identity give global cohomology; strict gives compact support; empty S gives global without shift. | res−i and fibre shift preserved. |
| §2.22 The H⁰ correction before the classical Selmer kernel | Global=0 and one local k[0] give classical Sel=0 but fibre H¹=k. | H⁰ correction cannot be omitted. |
| §2.23 Primitive, imprimitive and strict condition-change triangles | Identical conditions give acyclic difference; global=0 with nonzero local quotient is not onto. | No definition-level localization surjectivity. |
| §2.24 Lattice changes with global and local errors | T=T′ gives zero discrepancy; T′=p⁻¹T has nonzero Q despite rational equality. | Finite integral and local propagation errors retained. |
| §2.25 Selmer vanishing descends under injective restriction | Degree-p trivial-coefficient inflation class restricts to zero; degree prime to p is invertible on p-primary coefficients. | Injectivity alternatives retained, including residual invariant vanishing. |
| §3.1 Iwasawa cohomology | Cyclotomic lattice H⁰ transitions multiply by p, so inverse corestriction limit is 0; restriction limit of trivial discrete H⁰ is nonzero. | j_* check restricted to degree one under finding 1's hypotheses. |
| §3.2 Shapiro's lemma for Iwasawa cohomology | Γ=1 gives ordinary cohomology; induced functions evaluated at identity require inverse translation. | Existing discrete Shapiro deferred; compact extension distinguished. |
| §3.3 Descent and control for Iwasawa cohomology | Trivial tower gives identity descent; nonzero H^(i+1)[γ−1] contributes to finite H^i. | Control torsion term kept with its correct degree. |
| §3.4 A criterion for torsion Iwasawa cohomology | Vanishing finite-level obstruction implies torsion only under specified control; zero module is torsion. | No universal weak-Leopoldt assertion introduced. |
| §3.5 Universal norms are unramified away from p | At an infinite non-p decomposition tower, norm-compatible singular classes vanish; finite decomposition is excluded. | Rubin B.3.3–5 locator used. |
| §3.6 Semilocal cohomology and descent of local classes | Completely split place has one summand per finite-level coset; identity extension has one summand. | Mackey/semilocal induction counts retained. |
| §3.7 Twisting Iwasawa cohomology | k=0 gives 1; χ(γ)=4 gives 1/4 at k=1 and 4 at k=−1; integral norm H⁰ is 0. | Twist proof and source corrected; finite-coefficient roots used. |
| §3.8 Iwasawa Selmer complex and completed action | Trivial decomposition subgroup gives growing local sum; relaxed constant conditions give global Iwasawa cohomology. | Completed induced action is inverse on group-ring factor. |
| §3.9 Local specialization correction complex | Identity specialization has zero error; tensoring O/λ with residue field has nonzero Tor. | Actual derived comparison map required. |
| §3.10 Derived specialization and control spectral sequence | Only H²=Λ/(γ−1) contributes O to specialized H¹; two-variable residue module has higher Tor. | One-variable short exact sequence not generalized to all Γ. |
| §3.11 Classical restriction control with invariants and localization errors | H=0 and Q≠0 give image I=0, so a snake row ending in Q is not exact. | Localization-image and invariant-functor errors retained. |
| §3.12 Iwasawa duality with the involution and local errors | Nontrivial eigenvalue c pairs with c⁻¹; finite local errors disappear at height one but remain integrally. | Arithmetic shift −3 uses degree-zero Λ dualizing coefficient. |
| §3.13 Finite generation, amplitude and local Euler ranks | Zero T gives rank difference 0; trivial rank-one over Q has real minus rank 0; local rank includes [K:Q_p]. | p odd/cyclotomic scope and global H² rank retained. |
| §3.14 Determinant line and its height-one characteristic divisor | A differential λ in degrees 0,1 has inverse determinant λ⁻¹; shifting to 1,2 gives λ. | Height-one signs yield char H²/char H¹; positive rank has no canonical scalar. |
| §3.15 Étale j-star and continuous cohomology comparison | Nonzero inertia H¹ at an omitted prime obstructs all-degree j_*/Rj_* equality. | Finding 1 explicit; universal-norm locator fixed. |
| §3.16 Lattice independence, twists and degree-one specialization | Equal lattices give identity; finite quotient lattice errors can affect integral specialization. | Rational lattice independence separated from integral ideal claims. |
| §3.17 Local cofreedom and an away-p Euler factor | Residual trivial/cyclotomic characters can leave H⁰/dual H⁰; arithmetic γ differs from γ⁻¹. | Exact CGLS exclusions and Euler convention retained. |
| §3.18 Checkable hypotheses for ordinary Selmer structure | Λ=O[[T₁,T₂]], quotient by T₁,T₂ is infinite pseudo-null; O=k[[λ]] with k infinite gives infinite length-one residue module. | Finite-cardinality equivalence scoped to finite residue and dimension two. |
| §3.19 Surjectivity of global ordinary localization | Cotorsion nonzero localization cokernel need not vanish; rank-one cyclotomic residual contains μ_p. | Three Greenberg alternatives kept separately. |
| §3.20 No pseudo-null submodule of the ordinary Selmer dual | Λ/(λ,T) is torsion with nonzero finite submodule when residue is finite; primitive local quotient can obstruct transfer. | Uniformizer replaces p in general-O residue example. |
| §3.21 Fitting equals characteristic under the structure criterion | X=Λ/(f) gives both ideals (f); X=0 gives (1); X=Λ/(λ,T) has char (1), Fitt (λ,T). | Added finite residue; infinite-residue/equal-characteristic negative controls. |
| §4.1 The completed algebraic closure and existing de Rham period rings | gr¹ has action χ, hence C_p(1); B_dR⁺/(t)=C_p; discrete quotient topology loses continuity. | Finding 2; ker θ rather than p-adic completion. |
| §4.2 Crystalline period ring and its structures | φ(t)=pt and θ(t)=0; inverting t prevents θ from extending as a unital map to C_p. | Period map domain and nonzero uniformizer required. |
| §4.3 Fundamental period sequences with continuous sections | Diagonal (x,x) maps to 0 under difference; φ-fixed x has (1−φ)x=0. | Difference sign and continuous-section requirement retained. |
| §4.4 Period fixed fields and dimension bounds | V=0 satisfies bound 0; ramified K has distinct K and K₀ scalar spaces. | Finding 2: exact twisted Tate–Sen calculation not supplied. |
| §4.5 Crystalline and de Rham realization data | Tate line n=1 has generator t⁻¹, Frobenius p⁻¹, filtration −1; zero realization is zero. | p-adic weight sign separate from archimedean type. |
| §4.6 Small-weight filtered Frobenius modules | Weight 0 line lies in [0,0], not [1,2]; reversed interval excludes nonzero objects; identity between φ=1 and φ=2 fails. | Added interval/morphism controls, including finite characteristic. |
| §4.7 Small-weight crystalline realization and extension exactness | Zero object realizes zero; combined tensor width exceeding p−2 is excluded; ramified base is excluded. | Small-weight exactness and variance remain explicit. |
| §4.8 Integral crystalline modules and nonsingular extensions | Finite R tensors to zero with B_cris but is not thereby crystalline; rank-zero extension condition is zero. | Lattice-quotient definition retained instead of vacuous period tensor. |
| §4.9 The Bloch–Kato local condition on T and W | Q_p gives finite dimension 1; Q_p(1) gives [K:Q_p], while Greenberg full line at K=Q_p has dimension 2. | Base degree and valuation Kummer exclusion retained. |
| §4.10 Crystalline extensions and the integral finite preimage | Free extension of a lattice by Z_p is tested at every p^m reduction; testing only m=1 is insufficient. | Unramifiedness, width and all reductions retained. |
| §4.11 Finite crystalline annihilators and the inverse different | Unramified coefficient different is a unit; E=Q_p(√p) at odd p has nonzero inverse-different quotient. | O-valued annihilation not asserted from underlying Z_p pairing. |
| §4.12 Finite versus ordinary local conditions with explicit exceptional terms | Trivial V with V⁺=0 has strict 0 but finite unramified line; Q_p(1) with V⁺=V has extra valuation line. | Exceptional finite/strict/inertia defects retained. |
| §4.13 Archimedean realization on the existing Hodge carrier | Same weight-zero filtration with opposite Betti signs gives different Gamma shifts; p=2 still permits complex −1. | Betti involution distinct from antilinear conjugation. |
| §4.14 Gamma factor and its integer pole order | Empty factors give 1/order 0; Γ_R(s) has pole at 0, Γ_R(s+1) does not; off-diagonal pair counted once. | Meromorphic pole order separated from totalized Gamma values. |
| §4.15 The Gamma factor, r_V and criticality | n=2 and n=−1 critical; n=0 fails via dual; n=1 has pole at 1. | Tate-dual shift and parity rule retained. |
| §4.16 Class groups, p-ramified Galois groups and unit towers | c=1 has minus part 0; p=2 makes (1±c)/2 unavailable; dense unit subgroup requires closure. | Odd-p integral decomposition and closed image retained. |
| §4.17 The closed-unit and class-group exact sequence | C=0 recovers sequence; C=E gives U/E kernel; E/U is not defined. | Quotient direction computed explicitly. |
| §4.18 Leopoldt and the strict-at-p Tate Selmer group | Q has unit rank 0; relaxing p changes strict kernel; p dividing character order prevents integral averaging. | Leopoldt is an equivalence, not an unproved general assertion. |
| §4.19 Local units and the cyclotomic Euler system in Iwasawa cohomology | Identity norm gives identical Kummer class; nontrivial Euler relation acts by Frobenius on field/class. | No scalar replacement of Euler-system Frobenius operator. |
| §4.20 Greenberg Selmer groups of Tate twists | n=1 has full ordinary condition; n=0 has unramified; n=2 dual has twist −2. | Cyclotomic plus/minus and inverse twist preserved. |
| §4.21 The Iwasawa–Greenberg main conjecture (as a proposition) | Characteristic ideal of Λ/(f) is (f); replacing f by nonunit pf changes the predicate; units do not. | Conjecture remains a proposition with analytic normalization data. |
| §4.22 Equivalence of the critical Tate-twist main-conjecture propositions | n=2 translates to twisted cyclotomic proposition; n=0 excluded by dual pole. | Equivalence does not prove the main conjecture. |
| §4.23 Positive-rank determinant formulation as a separate proposition | Degenerate regulator cannot trivialize a positive-rank line; nonunit error determinant changes lattice. | r>0, nonzero leading coefficient and normalized line data retained. |
| §4.24 Global finite Selmer reductions and conjugation | λ-saturated rank r submodule reduces to free rank r over O/λ^m; global image can differ from independent local kernel. | Saturation and global/local distinction retained. |
| §4.25 Uniform local annihilation for pure weight minus one | Empty non-p Σ gives exponent 0; bounded integral H¹ and H² errors give exponent 2m_w. | Pure weight −1 and away-p restriction retained. |
| §4.26 Elliptic Bloch–Kato and classical Selmer vanishing | Finite Sel_p contains rational torsion; discrete p∞ module tensors to zero even at positive corank. | Rational group uses inverse finite system/Tate module; divisible Sha retained. |
| §4.27 Finite-image adjoint Selmer finiteness with descent errors | p dividing splitting degree leaves finite H¹(Gal(L/F),A) kernel; prime-to-p kills that error. | Finite class-group Hom, not a canonical quotient, retained. |
| §4.28 Ordinary modular Selmer parity over ℚ and quadratic fields | Dimension 1 gives sign −1; dimension 2 gives +1 without rank-zero conclusion; nonordinary λ excluded. | Finding 3: endpoint sourced, proof chain unresolved. |
| §4.29 Two-primary Selmer parity for congruent-number twists | n=1 gives w₂=−1, w∞=−1 and global +1; n=5 gives w₂=+1, w₅=+1, w∞=−1 and global −1; n=0 singular. | Root-sign source and witnesses fixed; finding 4 remains. |

The standing conventions received separate checks:

| Convention | Explicit witness | Pinning |
| --- | --- | --- |
| λ-power coefficients versus p | In equal characteristic F_p[[λ]], p=0 but λ≠0; quotient by (λ,T) is the residue field. | README §§3.20–3.21; Iwasawa carrier absent at pins, retained as README target. |
| Cofibre/fibre and res−i | Global and local condition zero, local k[0]: Cone(0→k)[−1] has H¹=k. For diagonal (x,x), res−i gives 0. | README §§2.21–2.22; heavy derived carriers in closing block. |
| Degree-three duality | An isolated global degree-one class pairs with dual degree two, whereas local degree one pairs with local degree one. | §§1.3–1.4 and §3.12; supplier-derived signatures remain README-only. |
| Inverse induced and dual actions | χ(γ)=4 gives dual eigenvalue 1/4; twist +1 uses 1/4, inverse twist uses 4 and composition gives 1. | Lean contragredient examples and rational twist examples; §§2.10, 3.7–3.8. |
| Inverse determinant | O --λ→ O in degrees 0,1 has H¹=O/λ and inverse-determinant lattice λ⁻¹O; shift to degrees 1,2 has valuation +1. | §3.14; `selmerDeterminant` is named in closing block, not a fabricated carrier. |
| Arithmetic Frobenius Euler polynomial | For rank-one Frobenius eigenvalue a, P(X)=1−aX; replacing γ by γ⁻¹ changes P(ℓ⁻¹γ). | §3.17's explicit convention; no arithmetic Frobenius carrier fabricated. |
| Archimedean/p-adic Tate signs | n=1 has real F∞=−1 and Γ_R(s−1), while its p-adic filtration index is −1; n=2 is critical but n=0 is not. | Native Tate-carrier and pole-order Lean examples, including p=2 sign. |
| Class-group kernel quotient | E=0 gives U as ker(X→Y); C=E gives U/E, never E/U. | §§4.16–4.17; arithmetic tower definitions in closing block. |
| Root parity and a zero invariant | n=1 and n=5 have c₆=0 with valuation ∞, and odd c₄ parts 3 and 75≡11 mod 16; root products differ. | §4.29; Lean ZMod 16 example computes the residues without dividing by zero. |

## Lean signature and definition audit

Ten representative signature checks, plus two archimedean checks:

| Declaration | README match and relevant hypothesis |
| --- | --- |
| `ker_toPCompletion` | §0.1, arbitrary additive group, actual (p)-power submodule intersection. |
| `units_pCompletion_injective` / `units_pow_of_pow_eq` | §0.2, NumberField, actual ring-of-integers unit map, m may be zero. |
| `weaklySemisimple_iff_split` | §0.12, linear specialization of canonical invariant-to-coinvariant bijection; not full semisimplicity. |
| `orthogonal_orthogonal` | §1.1, two finite Z/n-modules, n nonzero, both curried maps bijective. |
| `quotientPairing_perfect` | §1.1, character duality between A/F and the native orthogonal of F, not an arbitrary quotient. |
| `SelmerData.selmer_eq_ker` | §2.2, actual product of local quotient maps, including empty place type. |
| `SelmerData.exact_change_of_conditions` | §2.3, same data and L≤L′; only exactness at the middle term. |
| `saturated_preimage` | §2.6, specified nonzero integer in elementary signature; full O-lattice theorem stated separately. |
| `corankFromDual_add` | §2.11, finite compact dual modules and exact linear sequence before rational finrank additivity. |
| `FontaineLaffailleModule` / `FontaineLaffailleHom` | §4.6, real filtration, semilinear maps, p-compatibility, generation and morphism commutation; arithmetic W/p scope in prose. |
| `ArchimedeanRealization` | §4.13, existing Hodge carrier plus complex-linear involution, exchange and conjugation commutation. |
| `isGreenbergCritical_tateTwist_iff` | §4.15, actual Tate and dual pole orders, positive even or negative odd; n=0 excluded. |

All README definitions were matched to actual declarations or the closing
comment's list of missing arithmetic/derived carriers. No `Prop := sorry`,
`True` endpoint, sorry-defined data, language-server use, auxiliary theory
construction, new Lake project or build/update/cache command was used.
Native specializations have real bodies. Lean examples are signature and
negative-control tests; admitted endpoints remain roadmap statements.

## Validation and own words

- `lean-check` on the revised representative file: exit 0; 97 declaration-uses-sorry warnings only; 877 lines and 79 examples. Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
  pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Accepted packet schema check: zero errors and zero warnings. Packet unchanged.
- Intake `check-files` on the five deliverables: zero problems.
- Sorry-defined-data check: exit 0, no offenders.
- `git diff --check`: clean. No absolute local paths in deliverables.
- Mathematical text and corrections are in the reviewer's own words. The
  roadmap is organized by constructed objects and dependencies, not by source
  sections. Source locators are retained without passages or copied books.

The verdict remains needs_changes despite successful elaboration: the four
listed prerequisite decompositions are necessary for the upstream readiness
bar. Resume at those exact sections and supplier contracts; do not redo this
review's ownership removals or restore duplicate targets.
