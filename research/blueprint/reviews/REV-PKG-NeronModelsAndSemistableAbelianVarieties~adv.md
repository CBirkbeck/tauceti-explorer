# Independent package review: Néron models and semistable abelian varieties

Job `REV-PKG-NeronModelsAndSemistableAbelianVarieties~adv`, issue #8029. Reviewer: Codex,
session `codex-pb1SLG`, 2026-10-09. The package was written by Claude Code, session
`cc-305b72`; this is an independent fixing review. **Verdict: needs_changes**, for the
specific remaining comparisons and source inputs below. The review itself is complete;
this report also supplies the durable handoff.

## Remaining defects and where to resume

1. **Signed monodromy bridge, README 4.3.** The positive valuation pairing is now explicit,
   including its adjoint direction and the Tate value `[n]`. Its identification with the
   operator obtained from `σ − 1` still needs a signed formula specifying the character
   identifications, Weil pairing and tame character. SGA 7 IX, Theorem 10.4, p. 444,
   cannot alone justify the original positivity claim under that convention. Illusie,
   Theorem 4.1 and footnote 12, p. 95, displays a negative polarised form and explains
   the sign problem. Fix this bridge before certifying the NOS proof in 5.1. Negating
   the pairing preserves its cokernel, so the cardinality tests do not settle it.
2. **Obstruction versus inverse-form pairing, README 4.6.** The two-lattice inverse form
   is specified on actual quotient classes and tested at `(1,1)` and `(1,2)` modulo `5`.
   A signed identification with Grothendieck's biextension obstruction remains missing.
   SGA 7 IX, §11.4, p. 454, explicitly postpones this identification; Theorem 11.5,
   p. 455, supplies the cokernel identification, not that signed comparison. Illusie
   §4.3, pp. 97–98, and Bosch §4, p. 1270, point to Werner's 1997 paper, pp. 205–215.
   Resume from its actual construction, keeping the Poincaré and polarisation directions
   fixed. The README and Lean closing comment now mark this gap.
3. **Tate source and all-characteristic comparison, README 2.9 and 6.6.** The public
   Tate PDF and page images refused direct access; the web PDF reader also failed on
   its size. BLR §1.5, p. 23, was read, but its short-Weierstrass computation excludes
   residue characteristics `2,3`. It cannot certify the all-characteristic nodal,
   splitness, wild-discriminant and residue-field-descent claims. Read Tate §§4–8,
   pp. 41–52, or supply an independently checked primary source and the exact
   equation-to-smooth-locus proof. The source gap also marks the table citations in
   2.8 and 6.7–6.9. The geometric Kodaira configurations remain owned by
   StableReduction Layer 5, not by this package.
4. **Coefficient-prime strict compatibility, README 6.10.** BCGP 2021 Proposition 2.8.1
   and Noot 2013 Corollary 2.7 were read. The author page for Noot 2017 supplies an
   abstract but no manuscript, and the publisher PDF was inaccessible. Independently
   verify Corollary 2.2 and the subsequent base-change trace argument before treating
   this source chain as checked. The theorem statement is confirmed in BCGP; its
   previously flagged original proof input is now an explicit source gap.

These are unresolved mathematical/source comparisons, not a claim that the entire
roadmap must already be implemented. The packet's 39 proof/carrier gaps and 14 requests
remain unchanged, and none of its six stages is certified closed. No source excerpts or
source files are included in the deliverables.

## Repairs applied

- Deleted the duplicated geometric Kodaira target, renumbered Layer 2, and placed its
  ownership at StableReduction Layer 5. Kept the Néron smooth-locus, geometric group,
  rational group and wild comparison targets, which supply different mathematics.
- Put abelian-scheme models before Dedekind gluing. Moved the semistable Picard and
  Picard–Néron comparisons ahead of potential semistability, and potential semistability
  ahead of the monodromy criterion. Added `JacobianIsogenyFactor` with the actual
  Bertini/Poincaré input instead of attributing it to the basic Jacobian carrier.
- Replaced the false finite-level-invariants inference with saturated Tate lattices and
  the divisible-system descent target. Made excellence explicit in the criterion,
  full-level criterion and NOS chain, matching the potential-semistability target.
  Added henselisation invariance explicitly so the full-level export applies at
  non-henselian function-field places.
- Separated smooth henselian lifting from Lang's finite-field surjectivity. Corrected
  an isogeny example whose component map could have been zero. Added a weak model
  obtained from a blowup that fails the full smooth-test mapping property.
- Restricted the discriminant pairing to two finite free lattices with injective adjoint
  and finite cokernel. Specified quotient representatives and the evaluation formula
  with a nonzero denominator. Replaced existential pairing tests by actual `1/5` and
  `2/5` values; added quotient-class, boundary-direction, edge-form and adjoint tests.
- Corrected the polarisation's contravariant character map. Added the general regular,
  possibly nonreduced-fibre Picard quotient required by the intersection target; the
  semistable identity comparison alone did not cover it.
- Distinguished even-factor two-torsion from odd-factor torsors; retained Picard-sheaf
  classes rather than silently replacing them by rational line bundles. Corrected
  the cup-product attribution to Poonen–Schaefer Proposition 10.3.
- Clarified fibrewise semi-abelian Picard schemes when toric rank jumps. Read BLR
  §9.4, Theorem 1, p. 259, rather than relying only on Yuan's citation.
  The fibre argument now uses the normalization sequence over geometric residue
  fields, rather than misapplying the regular-DVR Picard comparison to arbitrary fibres.
- Corrected period-ring scalar fields, the chosen logarithm in the semistable comparison,
  and the full `1`-motive's dimension. Added named functor/admissibility/descent API.
  Fontaine's functors are in Exposé III, not just the period-ring Exposé II; BCGP's
  compatible-system proposition is not a period-ring comparison theorem.
  Coleman–Iovita's split semistable hypothesis now has an explicit unramified
  splitting/descent target; Fontaine §1.8.6, p. 135, supplies admissibility descent.
- Retained finite inertia action in the conductor-descent argument. Made finite-level
  Tate torsion examples use `q = π^N`, rather than valuation divisibility alone.
- Replaced generic exactness of Néron models by two explicit exact lattice rows and
  injective vertical maps for the snake lemma. Derived the characteristic-zero
  differential inclusion without misattributing it to the specialised CM erratum.
- Corrected differential scaling to `u⁻¹` for the stated coordinate direction and pinned
  both directions at `u = 5`. Corrected the full matrix-group bound to a strict bound
  with positive dimension, retaining the dimension-zero negative control.
- Corrected the `S₆` computation: the centraliser has order `48`, while its intersection
  with the point stabiliser has order `8`. Only the latter is a `2`-group. Specified
  the rank-one ordinary inverse image and the perfect constant-field hypothesis in
  the curve full-level adapter.

## Source audit

The random sample uses seed `8029`, sampling fifteen numbered subsections from the
package after the initial dependency renumbering. Original sampled locators were
retained in the scratch audit; the table records the final locators and outcomes.
Scanned statements were read as page images when extraction was empty or ambiguous.

| Sample | Source and final locator | Independent result |
|---|---|---|
| 1.8 | BLR §1.2 Proposition 8, p. 15 | Confirmed abelian-scheme mapping property. |
| 2.4 | Conrad Theorem 3.1, pp. 7–8; Proposition 2.16, p. 6 | Confirmed descent of the torus in the geometric semi-abelian case. |
| 6.13 | BCGP 2025 Lemma 9.1.8, p. 191 | Confirmed order `48` versus order `8`; fixed the erroneous `2`-group assertion. |
| 5.6 | Raynaud Propositions 4.6.1 and 4.7.4, pp. 315,317 | Confirmed homological arithmetic-Frobenius description; retained the dual/geometric conversion as a target. |
| 4.3 | SGA 7 IX Theorem 10.4, p. 444 | Confirmed the integral-pairing statement; the signed valuation/inertia comparison is unresolved, not inferred. |
| 3.14 | Raynaud §4.2(i–iv), pp. 302–303, Theorem 4.2.2, p. 304; §4.3, pp. 308–309 | Confirmed strict `1`-motive and valuation construction. Positivity is not proved in §4.5. |
| 1.4 | BLR §1.2 Proposition 2(a), p. 13 | Confirmed marked uniqueness. |
| 4.7 | SGA 7 IX Theorem 12.1(a–d), pp. 465–467 | Confirmed Picard quotient, degree kernel and intersection description; added the missing general regular-model input. |
| 5.3 | Fontaine Exposé II §§1–3,4.2, pp. 59–101; Exposé III §§3.1,5.1.1–7, pp. 136–137,155–157; Coleman–Iovita introduction, pp. 2–3 | Corrected attribution and scalar fields; confirmed the homological dual in the semistable comparison. |
| 1.6 | BLR §1.2 Definition 1, p. 12 | Confirmed the étale-test/full-test distinction. |
| 6.6 | Tate §4, p. 41; BLR §1.5, p. 23 | Tate access failed; BLR was read but has the `2,3` restriction. Explicit gap retained. |
| 4.5 | SGA 7 IX Theorem 11.5, Remark 11.5.2(b), opening of 11.6, pp. 455–456 | Confirmed geometric cokernel, including the residue-prime description; no signed obstruction comparison inferred. |
| 1.2 | BLR §1.2 Definition 1 and Proposition 2, pp. 12–13 | Confirmed the carrier/marking and mapping property. |
| 6.4 | Yuan–Zhang Erratum introduction and Theorems 1–2, pp. 1–2 | Does not state a general isogeny differential theorem. Replaced that attribution by a formal deduction from characteristic-zero cotangent spaces. |
| 3.4 | Conrad Example 4.6, pp. 11–12 | Confirmed the ramification counterexample and component growth. |
| Additional | BLR §9.4 Theorem 1, p. 259; §9.5 Proposition 3/Theorem 4, pp. 266–267 | Confirmed the stable-family Picard statement and distinguished the full quotient from `Pic⁰`. |

Public copies used for these checks and the flagged inputs:
[BLR Chapter 1](https://math.arizona.edu/~cais/scans/BLR-Neron_Models/neron1.pdf),
[BLR scan containing §9.4](https://archive.math.arizona.edu/cais/scans/BLR-Neron_Models/neron4.pdf),
[BLR scan containing §9.5](https://archive.math.arizona.edu/cais/scans/BLR-Neron_Models/neron5.pdf),
[Conrad](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf),
[SGA 7 I](https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf),
[Raynaud](https://www.numdam.org/item/AST_1994__223__295_0.pdf),
[Fontaine Exposé II](https://www.numdam.org/item/AST_1994__223__59_0.pdf),
[Fontaine Exposé III](https://www.numdam.org/item/AST_1994__223__113_0.pdf),
[Coleman–Iovita](https://arxiv.org/pdf/math/9701229v1),
[Illusie](https://www.numdam.org/item/10.5802/afst.1667.pdf),
[Bosch](https://www.numdam.org/item/10.5802/aif.1599.pdf),
[Bosch–Lorenzini](https://dinolorenzini.franklinresearch.uga.edu/sites/default/files/inline-files/papers/LorenziniBosch.pdf),
[BGW](https://arxiv.org/pdf/1310.7692v2),
[Poonen–Schaefer](https://math.mit.edu/~poonen/papers/descent.pdf),
[Yuan](https://arxiv.org/pdf/2108.05625v4),
[Yuan–Zhang erratum](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf),
[Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf),
[BCGP 2021](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf),
[BCGP 2025](https://arxiv.org/pdf/2502.20645v1),
[Noot 2013](https://msp.org/ant/2013/7-2/ant-v7-n2-p01-s.pdf),
[Noot 2017 author page](https://www.math.unistra.fr/~noot/publications/jnt.html),
[Deligne–Mumford](https://www.numdam.org/item/PMIHES_1969__36__75_0.pdf),
[Milne](https://www.jmilne.org/math/xnotes/JVs.pdf).
The inaccessible Tate copy was [the Antwerp scan](https://wstein.org/Tables/antwerp/tate/tate.pdf).
Only paraphrases and locators are recorded here.

The author's specifically flagged source inputs received the following follow-up.
Broad undecomposed proof leaves are distinguished from an unverified numbered locator;
a confirmed theorem statement does not certify every paper it cites.

| Flagged input | Follow-up and remaining scope |
|---|---|
| Stable Picard, BLR §9.4 Theorem 1 | Read p. 259 and adjoining proof; corrected the family meaning of semi-abelian. Relative-duality/Hodge comparison stays with its downstream owner. |
| BGW's cited Proposition 10.3 | Opened Poonen–Schaefer, read statement pp. 18–19 and cocycle proof pp. 19–20; corrected the attribution. |
| Noot 2013 Corollary 2.7 | Read pp. 256–257 with the strict-motive input and `ℓ ≠ p` restriction. |
| Noot 2017 Corollary 2.2 | Opened author page and attempted publisher PDF; no full statement retrieved. Explicit 6.10 source gap. |
| Deligne–Mumford 2.4 | Read §2 standing hypotheses p. 87 and theorem/proof pp. 89–90. Restricted 6.14 to perfect constant field and specified strict-henselian descent. |
| Conrad potential-semistability input | Read Proposition 4.3 and proof pp. 9–10 and Picard inputs pp. 34–35; added Bertini/Poincaré target and independent curve route. Milne Theorem 10.1 and proof pp. 33–35 confirm the quotient. |
| Integral pairing and NOS bridge | Read SGA 10.4,11.4–6 and Raynaud §4.3; compared Illusie pp. 95,97–98. Signed bridge remains explicit. |
| Nonreduced regular Picard quotient | Read SGA 12.1(a–d), pp. 465–467, and BLR §9.5, pp. 266–267. Added named quotient input. |
| Tate wild algorithm and Weierstrass geometry | Attempted original PDF/images; read BLR pp. 20–25 instead. Its restricted computation does not close the flagged wild/general comparison. |
| Bosch–Lütkebohmert algebraisation/effectivity | Raynaud §4.2 statement read; original construction is still an undecomposed proof input. The public digitised article URL located during this review failed to download. No original-proof collation claimed. |
| BLR smoothening, spreading, Weil extension | Read the Chapter 1 criterion/statements, pp. 12–20. The Chapters 3–6 construction and extension proof remain the named roadmap targets; their internal source decomposition is not certified. |
| p-divisible orthogonality, finite torsion, ordinary decomposition | Conrad pp. 17–20 and BCGP 2025 pp. 190–191 confirm the statements. Connected residue-prime torsion is kept distinct from generic inertia invariants; supplier proof leaves remain. |
| Lang lifting and normalization cohomology | Corrected the two separate surjectivity steps; read SGA's normalization and graph formulas, pp. 469–475. General cohomological/Lang supplier proofs are not claimed implemented. |
| Euler/residual conductor comparisons | Read Raynaud pp. 315–317 and Calegari–Geraghty Lemma A.7, p. 89. Kept the dual geometric component group and actual finite inertia action. A.7 is a surface application, not a general conductor-independence theorem. |

## Prerequisites, duplication and ownership

Read the binding worker/review/protocol/upstream instructions, the input packet and
package, its author's handoff, and the reviewed library coverage. The form models were
Completed/IntegralLattices and StableReduction (README and Suggested.lean). Current
upstream was checked at `cf22072ec967d59e544f5ea489d2c9a3bea9add7`, current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; compilation uses the required older pins.
No upstream files were changed or built.

Searched mathematical objects and hypotheses in the nine newer upstream roadmaps,
Completed roadmaps and current library: smooth marked models and generic restriction;
non-affine component quotients; torus characters; finite free lattices and discriminant
pairings; multigraph boundaries; Picard/degree quotients; Frobenius/conductor data;
invariant cotangent lattices. The actionable overlaps were:

| Removal or retained variant | Existing owner / difference |
|---|---|
| Deleted old 2.8 `GeometricKodairaConfigurations`, with no stub | StableReduction Layer 5 explicitly owns the geometric interpretation. Old 2.9/2.10 become 2.8/2.9; only component groups and wild comparisons remain. |
| Symmetric discriminant construction deferred | IntegralLattices Layer 1D, Completed Layer 1.4 and module `TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Bilinear`, declarations `IntegralLattice.discriminantPairing`/`discriminantPairing_mk`. Kept two possibly different lattices without symmetry. |
| Numerical Picard definition remains deferred | `TauCeti.NumericalType.Pic` and `.degree`; only comparison with the Néron component group is planned. |
| Graph Betti number remains deferred | StableReduction Layer 1; the retained variant supplies integral cycles and the signed boundary, not another Betti-number definition. |
| Marked model and uniqueness retained | General base morphism and full mapping property versus `TauCeti.Model` over a DVR and its separated-target uniqueness. |
| Identity/component construction retained | Smooth non-affine groups over general residue fields versus affine algebraically closed Hopf-algebra implementations. |
| Toric character construction retained as adapter | Existing character functor is consumed; the target adds Néron-fibre descent and functoriality. |
| Hodge comparison remains deferred | JacobianChallenge Part II; deleted the residual in-layer promise that would have repeated that downstream target. |

The exact prefixes in the supplier contracts, not whole cyclic arithmetic stages,
are consumed. SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry,
AbelianSchemesAndArithmeticModuli and ArithmeticGaloisRepresentations are lower-tier
suppliers in the current order. No `FoundationsAndLibraryIntegration` or `UPSTREAM:`
prerequisite remains. Part II, modular degeneracy constructions, height inequalities
and modularity statements are consumers, not backward proof inputs. The period-ring
comparison stays here because PadicHodgeTheory is higher tier. Its owner should later
import this target rather than independently re-plan it.

Two missing prerequisites were added here: `JacobianIsogenyFactor` in 3.10 and
`RegularPicardNeronQuotient` in 4.7. Supplier declarations are used with their actual
field, affine, finite-type and representability restrictions. Missing geometric carriers
at the Lean pins are named in the closing comment rather than represented by `True`
or dummy propositions. The packet's requests/gaps are planning inputs, not implementation
claims, and the packet was not edited.

## Adversarial mathematics pass

Each row covers all named API assertions in that subsection, including their variance,
identity/composition laws and the displayed Checks. Definitions with typed carriers
also received their Lean `example` checks; geometric carriers and checks are named in
the closing comment. The convention rows apply throughout rather than silently adding
hypotheses to individual assertions.

| Statement / definition | Instances tried | Result | Change |
|---|---|---|---|
| Convention 1, bases | field; DVR; non-henselian DVR; ramified and equal-characteristic traits | Existence does not quantify over arbitrary `j`; special local hypotheses are separate. | Excellence made explicit in the criterion/NOS chain. |
| Convention 2, test category | smooth positive-dimensional source; étale source; sections only | Étale tests do not imply full NMP. | Added weak blowup counterexample. |
| Convention 3, finite type | infinite disjoint special components; infinite open cover | First fails quasi-compactness; second alone proves no failure. | Corrected the cover non-example. |
| Convention 4, markings | changed generic marking; identity model map | Unique comparison must respect the marking. | Checked compositions in Lean. |
| Convention 5, dimensions | `g=0`; `t=1,a=0`; `t=a=1` | Ranks `0`; `1`; `2`, and finite Tate ranks `0,1,3`. | Retained `g=t+a`, corrected cross-references. |
| Convention 6, rational components | split/nonsplit `I₄,I₅`; characteristic `2` | Geometric orders `4,5`, rational orders `2,1` in nonsplit case. | Preserved residue Galois action. |
| Convention 7, pairings | `[5]` on `(1,1),(1,2)`; zero lattice; zero form | Lattice values `1/5,2/5`; nondegeneracy is essential. | Signed geometric comparisons marked unresolved. |
| Convention 8, graph direction | loop; directed edge; parallel edges | Boundaries `0`, `δ_target−δ_source`, cancellation of `(1,−1)`. | Added computed Lean witnesses. |
| Convention 9, Tate/cohomology | split Tate over residue cardinality `q` | Geometric Frobenius on `H¹` gives `1−T`; homological arithmetic invariants give `1−qT`. | Kept conversion explicit. |
| Convention 10, discriminant | multiplicative valuation `1`; additive order `1` | Unit discriminant is order `0`; order `1` is bad `I₁`. | Checked both valuation conventions. |
| Convention 11, names | README objects versus representative namespace | README target namespace and Suggested namespace have different roles. | Closing comment records all untyped definitions. |
| 1.1 NMP and refutation API | `j=id`; nonextendible smooth-source map; generic identity | Identity base satisfies predicate; nonextendible map refutes it. | Full smooth quantifier retained. |
| 1.2 marked model/projections | lft torus; generic marking/inverse; endomorphism equality | Quasi-compact field is required; marking equations have correct direction. | General-base variant stated. |
| 1.3 extension and composition | identity; three marked models; precomposition | Arrows run from test object into target model; composite order agrees. | Checked every extension API signature. |
| 1.4 unique marked iso | changed marking; two copies of model | Unique iso compatible with both markings. | Confirmed BLR locator. |
| 1.5 group law/homomorphisms | zero map; multiplication; nonzero translation | Translation extends as scheme map but is not a homomorphism. | Specified nonzero translating point. |
| 1.6 weak models | identity base; étale test; smooth locus of blowup of good elliptic model | Blowup model satisfies weak tests but generic identity from original model does not extend. | Added `WeakNeronBlowup` with noninvertible centre ideal. |
| 1.7 smoothening/existence | good model; split torus; nonproper smooth test | Good model unchanged; torus not bounded. Full group-model construction is required. | Kept excellent DVR and explicit construction leaves. |
| 1.8 abelian-scheme model/good predicate | good elliptic scheme; zero variety; Tate curve | Proper smooth group supplies NMP; Tate curve has no such good model. | Moved before gluing. |
| 1.9 spreading/gluing | good open; two bad points; infinite cover | Finite-presentation descent and quasi-compactness must be proved. | Corrected infinite-cover assertion. |
| 1.10 étale base change | identity; unramified extension; Tate ramification `e=2` | Full model commutes only in stated étale case. | Retained ramified negative control. |
| 1.11 differential lattice/API | zero variety; minimal good elliptic model; Dedekind ring with nontrivial determinant class | Rank zero/trivial determinant; local basis; global projective need not be free. | Corrected comparison number to 6.9. |
| 2.1 identity component/API | good positive-dimensional variety; `Iₙ,n>1` | Proper connected fibre is non-affine; torus differs from entire regular fibre. | Kept non-affine generality. |
| 2.2 component quotient/API | good fibre; `n=1,4,5,0`; residue Frobenius `−1` | Fixed-point counts `1,2,1,1`; formula at `n=0` would falsely give `2`. | Positive `n` retained and tested. |
| 2.3 Chevalley | perfect/imperfect field; good, multiplicative, additive elliptic fibres | Product `T×U` is asserted only over perfect field. | Imperfect descent separated into 2.4. |
| 2.4 character lattice/API | split/nonsplit torus; `[m]`; imperfect semi-abelian fibre | Lattice is contravariant and keeps Galois action. | Corrected inputs and polarisation direction later. |
| 2.5 isogeny components | `E_q→E_qm`, `n,m>1`; `n=1`; `m=1` | Map `r↦mr` is nonzero/nonsurjective; zero at `n=1`; identity at `m=1`. | Fixed false unconditional nonzero test. |
| 2.6 elliptic filtration | finite residue field; arbitrary residue field; smooth section through identity | Smooth lifting and Lang address different maps. | Removed Lang from identity-section lifting. |
| 2.7 minimal regular smooth locus | good fibre; multiplicity `>1`; zero section | Multiple components excluded from smooth locus; good fibre entirely smooth. | Retained scheme-level comparison. |
| 2.8 geometric groups | `I₁`; `I₀*`; `I₃*`; residue `2,3` | Groups `0,(ℤ/2)²,ℤ/4`; geometry and Galois action are different inputs. | Deleted duplicated geometry subsection; Tate source gap preserved. |
| 2.9 wild dictionary | types `II*` at `2`, `IV` at `3`; tame field | Tame discriminant/conductor values cannot be imposed at wild primes. | Source gap and §§7–8 locator made explicit. |
| 3.1 semi-abelian/semistable API | zero variety; torus; good variety; additive fibre; henselisation | Zero/torus/abelian pass; unipotent radical fails; residue field unchanged by henselisation. | Named henselisation invariance; no perfect-field assumption smuggled in. |
| 3.2 isogeny semistability | Tate isogeny; good isogeny; residue-prime degree | Identity special-fibre isogeny does not imply full component iso. | Corrected Tate component example. |
| 3.3 identity base change | good fibre; split Tate; additive-to-good extension | Semistable identity model pulls back; full model need not. | Source/order references repaired. |
| 3.4 ramified Tate map | `(n,e)=(1,2),(n,1),(2,0)`; `e>1,n>0` | Injection for `e>0`; zero noninjective map for `e=0`; nonsurjective after ramification. | Corrected comparison reference to 3.3. |
| 3.5 finite/toric Tate filtration | good; Tate; surface `t=a=1`; coefficient prime | Finite ranks `2g,t+2a`; connected `p`-torsion cannot be inertia invariants. | Preserved coefficient-prime boundary. |
| 3.6 orthogonality | zero torus; principal polarisation; mod-`ℓ` saturation | Annihilator is the toric part of the dual, with Tate twist. | Saturation retained before reduction. |
| 3.7 square-zero inertia | good; nontrivial Tate shear | Square zero; toric-image assertion needs Weil orthogonality. | Added that proof input. |
| 3.8 PicardZero/API | smooth fibre; one node; two rational components | Generic Jacobian; torus at node; multidegree zero on every component. | Moved earlier and used relative Picard suppliers. |
| 3.9 Picard–Néron identity | smooth; split `Iₙ,n>1`; full quotient `P/E` | `Pic⁰=N⁰`, not whole `N` in disconnected case. | Moved earlier; full and identity quotient separated. |
| 3.10 potential semistability/Jacobian factor | dimension zero; positive dimension; two valuations above non-henselian base | Zero already good; positive case needs independent curve/Picard route. | Added Bertini/Poincaré target and removed circular criterion route. |
| 3.11 monodromy criterion | `ℓ=char k`; Tate; shear `[[1,ℓ],[0,1]]` and its `ℓ`th power | Rational fixed equality does not imply finite-level fixed equality. | Saturated/divisible descent replaces invalid inference; excellence explicit. |
| 3.12 full level | `N=2`; `N=3`; `q=π^N`; bad additive twist | Ramified quadratic twist refutes level `2`; finite-level condition does not imply good reduction. | Added unit-part/root condition and inherited DVR hypothesis. |
| 3.13 Raynaud extension | good; Tate; nontrivial components; equal-characteristic trait | `G=B` or `𝔾_m`; completion concerns identity component. | Formal/analytic distinction retained. |
| 3.14 uniformisation/one-motive data | zero lattice; split Tate; nonsplit torus | Rank `t`; nonconstant Galois lattice required. | Corrected forward references and isolated positivity proof input. |
| 4.1 normalization sequence | loop; tree; double edge; disconnected normalization | Torus character rank `1,0,1`, not simple-graph rank. | Checks retained. |
| 4.2 boundary/cycle API | empty vertices; tree; loop; double edge; disconnected two vertices | Rank formula needs nonempty connected vertex set; boundary direction computed. | Added boundary witnesses matching Lean. |
| 4.3 pairing/adjoint/componentGroup/rankOne | zero lattice; `[0],[1],[5]`; polarisation `[m]`; ramification `e` | Zero form on positive rank has infinite cokernel; adjoint at `(1,2)` gives `10`. | Finite-free scope, polarisation variance and signed gap fixed. |
| 4.4 weighted edge form/API | one loop length `5`; length `0`; opposite coefficients; two edges `a,b` | Values `5,10,0,−5`; cycle value `a+b`. | Added computed sign/zero tests. |
| 4.5 component cokernel | good; `[1]`; `[5]`; rational versus geometric group | Integral cokernel distinguishes `1` from `5`; rationalisation loses it. | Confirmed actual SGA statement. |
| 4.6 discriminant pairing/classes/API | zero class; add modulus; class `1 mod 5`; pairs `(1,1),(1,2)`; denominator `0` | Values `1/5,2/5`; lifts differ by integers; nonzero denominator mandatory. | Replaced vacuous existential test; geometric signed identification remains gap. |
| 4.7 regular quotient/intersection | tree; double edge; weighted `I₀*`; gcd multiplicities `>1` | Finite groups `0,ℤ/2,(ℤ/2)²`; index-defect case excluded. | Added general regular Picard quotient, not semistable-only input. |
| 4.8 nodal pinch/API | split quadratic algebra; nonsplit algebra; `char=2`; repeated root | Split algebra is product; excluded char/repeated-root cases change singularity. | Equation construction avoids backward Ferrand dependency. |
| 4.9 generalized Jacobian/API | split/nonsplit torus; `K`-points versus fppf sequence | Dimensions `g+1,g`; rational surjectivity can have norm obstruction. | Picard-sheaf distinction retained. |
| 4.10 two-torsion | `g=1`; diagonal `μ₂`; even/odd conjugate factors | Orders `8,4`; even factors give torsion, odd factors give torsor. | Fixed parity confusion. |
| 4.11 odd-factor torsors/API | irreducible even-degree form; rational root; conjugate odd factors | `W_m[2]` has no rational point for irreducible form; quotient can acquire one. | Defined torsor in Picard sheaf rather than rational line bundles. |
| 4.12 boundary cup product | trivial torsor; rational Weierstrass point; split `D` | First two give zero; split torus alone does not kill torsor/Brauer boundary. | Corrected source and false splitness implication. |
| 4.13 stable-family Picard | smooth family; node thickness `m>1`; smoothing | Singular total space allowed; toric rank can jump `1→0`. | Confirmed BLR, clarified fibrewise meaning and corrected geometric-fibre prerequisite. |
| 5.1 NOS | Tate; additive elliptic with perfect residue; level `N` only | Full prime-to-residue Tate action required; finite torsion level insufficient. | Added precise Tate counterexample and excellent hypothesis; bridge gap retained. |
| 5.2 good isogeny | `ℓ` dividing degree; `p`-isogeny; `[n]`; henselisation | Rational Tate iso does not imply integral lattice iso. | Scope matches NOS proof; descent included in target. |
| 5.3 period rings/functors/predicates | zero/trivial representation; ramified `K`; Tate; additive elliptic; nonsplit torus | Scalars `K₀` vs `K`; Tate semistable/noncrystalline; `B_st^{N=0}=B_cris`; nonsplit case requires descent. | Corrected source, log choice, full motive; added API and unramified descent. |
| 5.4 conductor API | good; multiplicative; wild additive; potential semistable extension | Wild term not determined by ranks over extension. | Retained finite inertia action and sourced strict-motive independence. |
| 5.5 semistable conductor | `t=0,1,2`; surface `t=a=1`; wild inertia | Exponents `0,1,2,1`; Swan zero in semistable case. | Checked against invariant dimensions. |
| 5.6 Euler polynomial | split/nonsplit Tate; additive; surface `t=a=1` | `1−T,1+T,1`; degree `3`, toric weight zero. | Corrected proof input and Frobenius conversion references. |
| 5.7 residual conductor | `ℓ` divides Tate valuation; prime-to-component order; good | Exponent drops `1→0`; hypothesis is dual geometric group order. | Retained exact hypothesis. |
| 6.1 degeneracy adjoints | `[m]`; Tate isogeny; transpose map | Character map contravariant, component map covariant; equality `nm=mn`. | Corrected variances. |
| 6.2 exact lattice rows | product of tori; finite nontorus kernel; nonzero vertical kernels | Snake short exact conclusion requires injective vertical maps. | Replaced vague/arbitrary exactness claim. |
| 6.3 differential base change | ramified Tate; good abelian scheme; additive-to-good | Identity differential unchanged for semistable fibres; full model changes. | Used abelian base change rather than étale-only result in good case. |
| 6.4 isogeny differential inclusion | characteristic zero; degree-`p` reducing to Frobenius; prime-to-degree | Inclusion with torsion cokernel; not generally iso at degree prime. | Derived from cotangent/isogeny identity; removed false erratum attribution. |
| 6.5 good-equation comparison | valuation unit; nonminimal equation; arbitrary DVR | Predicate on minimal model; unit means additive order zero. | Kept minimality and descent. |
| 6.6 multiplicative comparison | split/nonsplit over `k`; geometric closure; characteristics `2,3` | Geometric splitness alone cannot certify residue splitness; short equation insufficient at `2,3`. | Explicit source gap. |
| 6.7 discriminant adapter | `I₀,I₁,II`; `I₅`; wild `II*` | Tame valuations `0,1,2,5`; wild not fixed at `10`. | Kept Ogg theorem with its existing owner; source gap recorded in 2.9. |
| 6.8 Tamagawa adapter | nonsplit odd/even `Iₙ`; `I₀*`; split `Iₙ` | Rational counts differ from geometric components and regular components. | All three counts kept distinct. |
| 6.9 minimal differential | coordinate factor `u=5`; nonminimal equation; good model | Pullback factor `1/5`, reverse `5`; nonminimal differential need not generate. | Corrected scaling direction and Lean witnesses. |
| 6.10 compatible system | `i=0`; `i>2g`; `i=1` elliptic; good place; coefficient prime | Rank/weight and inverse cyclotomic multiplier have correct cohomological convention. | Explicit original-proof source gap. |
| 6.11 ordinary predicate/API | good ordinary; purely toric; supersingular abelian surface | Toric case with `B=0` passes; supersingular case fails. | Connected/étale `p`-torsion retained. |
| 6.12 ordinary filtration | `t=0,1,2`; reduction mod `2` | Saturated isotropic rank `2` inside rank `4`; full module is not isotropic. | Rank-one case is full inverse image. |
| 6.13 residual image | centraliser; point stabiliser; `C₃` on `𝔽₂²`; trivial `2`-group | Orders `48,8`; `C₃` fixes no nonzero vector; `2`-group does. | Fixed false centraliser assertion and added finite witness. |
| 6.14 curve full-level bound | `g=0`; positive `g`; `N=0,1,3,4`; imperfect constants | Strict bound fails at dimension zero; DM original residue hypothesis is algebraic closure. | Positive dimension in Lean; perfect constants and descent in README. |
| Worked examples / acceptance suite | good; split/nonsplit; double edge; `X₀(11)`; `q=8` over `ℚ₂` | Distinguishes rational counts, weights, wild data and residual drop. | Genus-one modular model called semistable, not unpointed stable. |

The package retains every mathematical Check, moving those attached to removed geometry
to the ownership boundary or its component-group application. New tests discriminate
wrong definitions: zero or negative pairings, existential representatives, simple graphs,
reversed boundaries, unsaturated ordinary lifts and a spurious order-`48` `2`-group.
No denominator is used without `n>0`, `m≠0` or `u≠0`; the genus-zero and modulus-zero
algebraic examples are explicitly negative controls rather than geometric Tate curves.

## Lean and validation

The final suggested file elaborated at Mathlib `082e2d3` and Tau Ceti `f790474`:
**exit 0, 102 warnings, all `declaration uses sorry`, no errors**. The two `#check`
outputs pin the numerical Picard/degree declarations. No language server, library build,
update or cache download was used. These are target signatures, not proved results.

Ten signature spot checks, in addition to the full mathematical pass:

| Signature | README agreement |
|---|---|
| `NeronMappingProperty` | Every smooth test object, arbitrary fixed `j`, actual pullback restriction map. |
| `NeronModel` | Marking, smoothness, separatedness, quasi-compactness and full mapping property all fields. |
| `NeronModel.extend_restrict` | Marked generic restriction composes in the stated direction. |
| `NeronModel.unique_iso` | Unique iso constrained by both markings. |
| `WeakNeronModel` | Étale rather than smooth test quantifier; same finite-type carrier. |
| `ComponentGroup.card_fixedPoints_neg` | `0<n`; all nonsplit parity and `n=0` controls present. |
| `RamifiedTate.componentMap_injective` | `e>0`; algebraic `n=0` variant separately stated, not geometric degeneration. |
| `DualGraph.finrank_cycleLattice` | Finite multigraph, nonempty vertices, actual connectedness relation; no simple-graph assumption. |
| `LatticePairing.discriminantPairing_mk` | Two finite free lattices, injective adjoint, finite cokernel, specified classes, `m≠0`. |
| `Interfaces.card_lt_of_subgroup_matrix` | Strict bound, `N>1`, `g>0`; zero-dimensional negative control retained. |

Every new named declaration has a mathematical docstring; definitions absent from the
typed prefix are listed in the closing comment. No `True`, `Prop := sorry`, axiom print,
evaluation, tactic catalogue or hypothesis containing the conclusion was introduced.

Validation commands and results:

- `lean-check research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/Suggested.lean`:
  exit 0, only the 102 expected `sorry` warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/NeronModelsAndSemistableAbelianVarieties.json`:
  0 errors, 0 warnings; 78 nodes, 39 gaps, 14 requests, 6 planned and 0 closed stages.
- `python3 research/blueprint/intake.py check-files` on the two amended package files,
  `metadata.toml`, `review.json` and this report: 5 files, 0 problems.
- `git diff --check`: exit 0.

`metadata.toml` remains `topic = "math.AG"`. The only deliverable changes are the README,
Suggested.lean, review.json and this report. No packets, current Tau Ceti roadmaps,
library sources or another worker's deliverables were edited.
