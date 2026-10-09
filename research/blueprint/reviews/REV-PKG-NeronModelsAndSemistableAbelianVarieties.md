# Independent package review: Néron models and semistable abelian varieties

Codex, session `codex-zB74yn`, 9 October 2026. Completed review for #7608;
verdict **needs_changes**, with the fixes below applied. This is an independent
review of the package, not a checkpoint or an assertion that its mathematics has
been formalised. The remaining defects are confined to the comparison inputs in
README §4.3 and the coefficient-prime source input in §6.10.

Read WORKERS, PROTOCOL (including §20), PACKAGE_REVIEW, UPSTREAM_GUIDE and the
expansion protocol; the accepted packet, its package and author handoff; the prior
adversarial report; and the six reviewed R11 library-coverage entries. Retained the
previous sound corrections and independently checked their statements. The form
models were current StableReduction and IntegralLattices, including their
Suggested files. All 68 numbered package subsections, their APIs, prerequisites,
Checks and conventions were inspected. The packet is an unchanged input: its 39
gap records and 14 requests are not certificates of proof closure.

## Fixes applied

- Restricted the multiplicative component formula to `Iₙ` with `n ≥ 1`; `I₀`
  has its separate good-reduction meaning. Retrieved Tate's original article
  through the public `www.wstein.org` scan. Distinguished the all-characteristic
  geometric groups from the tame discriminant/conductor columns of the table.
  Added explicit wild witnesses: `y² = x³ + 32` over `ℚ₂` has type `II*` and
  minimal discriminant valuation `14`; `y² = x³ + 9` over `ℚ₃` has type `IV`
  and valuation `7`. The respective tame values `10` and `4` cannot be used.
- Corrected the full Picard quotient: it is the total-degree-zero subgroup
  modulo the closure of the generic identity, rather than the unrestricted
  Picard functor modulo that closure. Even a smooth curve leaves integer degree
  components in the latter quotient. Preserved the distinction between this
  full Néron model and its identity component.
- Specified Raynaud's positive Kummer inertia formula, its period projection
  `β_ℓ`, toric inclusion, twist and `ℓ ≠ char k` restriction. Added the integral
  operator `(a,b) ↦ (nb,0)`, API and three discriminatory Lean examples. At
  `n = 5` the period basis vector maps to `(5,0)`; the operator is nonzero and
  square-zero. This establishes the direction of the Kummer formula without
  declaring the remaining signed Weil-pairing comparison proved.
- Collated Werner's obstruction construction and the two signs in its
  comparison. The positive lattice extension represents `σ`; the Poincaré
  linearisation represents `−σ`, while the injective-resolution identification
  is `−τ`. Their composition is `τσ`, giving the positive inverse form.
  Added locators and retained the specified `1/5`, `2/5` quotient-class tests.
  The previous §4.6 obstruction-sign gap is resolved at the roadmap level.
- Added the arbitrary-residue-field nodal-normalisation descent target to §6.6,
  including the quadratic étale tangent algebra and its torus. Characteristic
  two is handled by a separable quadratic polynomial, rather than a square
  discriminant criterion. The integral equations
  `y² + xy = x³ + a₂x² + 2`, with `a₂ = 0,1`, have unit `c₄` and discriminant
  valuation `1` over `ℤ₂`; their tangent polynomials are respectively
  `T² + T` and `T² + T + 1`. Added split, nonsplit and evaluation Lean examples.
- Distinguished nonzero multiplication isogenies from `[0]` on a variety of
  positive dimension. Corrected good-isogeny wording to simultaneous good
  reduction, and restricted the Tate inertia test to primes away from the
  residue characteristic.
- Specified the valuation normalisation for period-ring monodromy. Fontaine's
  operator for `ord(π)=1` is `e` times the operator for `ord(p)=1`. At
  `q=π⁵`, `e=2`, the coefficients are `5` and `5/2`; added the corresponding
  Lean arithmetic witness. This prevents silently using a `ℤ_p` coefficient
  after ramified base change.
- Isolated BCGP's semistable trace-descent step as a named target with the
  Frobenius/open-inertia construction. It remains conditional on the exact
  Noot 2017 coefficient-prime input, which was not retrieved.

## Source receipts

The random sample used seed `7608` on the 68 numbered subsections, selecting
15 without replacement. These are additional to the specifically flagged
inputs. Printed page numbers are used below; scanned originals were read as
images where text extraction did not preserve the mathematics.

| Sampled subsection | Source opened and locator checked | Result |
|---|---|---|
| 6.7 | [Tate](https://www.wstein.org/Tables/antwerp/tate/tate.pdf), §6, p. 46 | Tame/wild qualification confirmed. |
| 1.9 | [BLR Chapter 1](https://math.arizona.edu/~cais/scans/BLR-Neron_Models/neron1.pdf), §1.4 Proposition 1, p. 18; Proposition 2 and Theorem 3, pp. 19–20 | Spreading and Dedekind construction confirmed. |
| 2.1 | [SGA 7 I](https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf), IX §1.1, pp. 321–322 | Identity and component conventions confirmed. |
| 6.14 | [Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 4.9 and full-level paragraph, p. 75 | The level representation belongs to the Jacobian; the package retains only the extension interface. |
| 2.9 | Tate §6, p. 46 and §§7–8, pp. 47–52 | All-characteristic algorithm checked, with perfect residue field. |
| 1.8 | BLR §1.2 Proposition 8, p. 15 | Abelian-scheme mapping property confirmed. |
| 3.12 | [Conrad](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Proposition 6.5, pp. 23–24 | Prime-to-residue full-level criterion confirmed. |
| 3.4 | Conrad Example 4.6, pp. 11–12 | Component map multiplies by the ramification index. |
| 3.8 | Conrad Theorems 7.12–7.13, pp. 34–35 and Proposition 7.14, p. 35 | Smooth separated Picard identity statement confirmed. |
| 3.1 | Conrad definition before Theorem 3.1, pp. 6–7 and §4, p. 9 | Semistability uses the identity fibre over the actual residue field. |
| 2.4 | Conrad Proposition 2.16, p. 6 and Theorem 3.1, pp. 7–8 | Toric descent and imperfect-field distinction confirmed. |
| 4.9 | [Bhargava–Gross–Wang](https://arxiv.org/pdf/1310.7692v2), §3 equation (5), pp. 10–11 | Norm-one extension and branch-splitting distinction confirmed. |
| 3.5 | Conrad Lemma 5.4 and preceding definitions, pp. 17–18 | Rank is `t+2a`; retained correction to the printed corank. |
| 4.11 | BGW Proposition 22(3–4), p. 11 | Odd-factor torsors and their parity hypotheses confirmed. |
| 1.10 | BLR §1.2 Proposition 2(c), p. 13 | Étale base change confirmed; ramified base change is excluded. |

The author/prior report's flagged inputs received the following independent
follow-up. A checked statement does not certify all the original construction
proofs that it cites.

| Flagged input | Reading and disposition |
|---|---|
| Stable-family Picard | [BLR §9.4](https://archive.math.arizona.edu/cais/scans/BLR-Neron_Models/neron4.pdf), Theorem 1, p. 259: confirmed smooth separated `Pic⁰` and semi-abelian fibres, without a constant-rank extension claim. |
| Full Picard–Néron quotient, including nonreduced models | SGA IX 12.1(a–d), pp. 465–467 and [BLR §9.5](https://archive.math.arizona.edu/cais/scans/BLR-Neron_Models/neron5.pdf), Proposition 3/Theorem 4, pp. 266–267: confirmed the total-degree-zero restriction and fixed §3.9. |
| BGW's Proposition 10.3 attribution | [Poonen–Schaefer](https://math.mit.edu/~poonen/papers/descent.pdf), Proposition 10.3, pp. 18–20: read the statement and cocycle argument; retained attribution and cup-product direction. |
| Potential semistability through a Jacobian | Conrad Proposition 4.3, pp. 9–10; [Milne](https://www.jmilne.org/math/xnotes/JVs.pdf), Theorem 10.1 and proof, pp. 33–35: the quotient uses an infinite field, which fraction fields of DVRs satisfy. |
| Curve–Jacobian criterion | [Deligne–Mumford](https://www.numdam.org/item/PMIHES_1969__36__75_0.pdf), §2 hypotheses p. 87 and Theorem 2.4/proof pp. 89–90: algebraically closed residue field; the package explicitly adds strict-henselian passage and stable-model descent for the perfect-field version. |
| Integral pairing and inertia | [Raynaud](https://www.numdam.org/item/AST_1994__223__295_0.pdf), §2.4.1 p. 298, §3.1 p. 299, §4.3 pp. 308–309, equation (7) p. 314 and Proposition 4.6.1 p. 315; [Illusie](https://www.numdam.org/item/10.5802/afst.1667.pdf), Theorem 4.1/footnote 12 p. 95: positive Kummer formula supplied; Weil sign/coefficient-prime comparison remains a gap. |
| Obstruction pairing | [Werner](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0486/LOG_0012.pdf), §§2–5, especially pp. 207, 209–214 and Proposition 5.1: read the complete argument and fixed the comparison of the two signs. [Bosch](https://www.numdam.org/item/10.5802/aif.1599.pdf), §§2–3 pp. 33–36 supplies the related nondegenerate description. |
| Tate algorithm and geometric comparison | Tate §§4–8, pp. 41–52: all pages opened. Wild and nonsplit tests now have the actual algorithm, tangent-algebra and normalisation inputs; the old inaccessible-source gap is removed. |
| Uniformisation/algebraisation | Raynaud §4.2(i–iv), pp. 302–303 and Theorem 4.2.2 p. 304; Werner §3 pp. 209–210. Original Bosch–Lütkebohmert construction proof remains an undecomposed target input; the residue-characteristic-zero supplier mismatch is explicitly recorded in §4.3. |
| Weil orthogonality and residue-prime finite torsion | Conrad pp. 17–20; [BCGP 2025](https://arxiv.org/pdf/2502.20645v1), Definition 9.1.7/Lemma 9.1.8, pp. 190–191: generic finite-flat torsion is distinct from inertia invariants at `p`. |
| Lang lifting/normalisation | SGA IX 12.3–12.5, pp. 469–475; the two lifting steps retain separate hypotheses. The supplier's Lang theorem is not claimed implemented here. |
| Smoothening, spreading, Weil extension | BLR Chapter 1, pp. 12–20: criterion and statement locators checked; the named smoothening/extension constructions remain theorem targets, not supplied proofs. |
| Period-ring conventions and comparison | [Fontaine Exposé II](https://www.numdam.org/item/AST_1994__223__59_0.pdf), §§1–4; [Exposé III](https://www.numdam.org/item/AST_1994__223__113_0.pdf), §1.8.6 p. 135, §3.8 p. 142, §3.9(ii) p. 143, §§5.1.1–5.1.7 pp. 155–157, theorem/§5.2.1 p. 158; [Coleman–Iovita](https://arxiv.org/pdf/math/9701229v1), introduction pp. 2–3: checked scalar fields, split hypothesis, duality, unramified admissibility descent and monodromy rescaling. |
| Conductor/residual input | Raynaud §§4.7.3–4.7.4 p. 317; [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Lemma A.7 p. 89: the cited lemma is a surface application and uses the dual component group. |
| Noot 2013 | [Corollary 2.7](https://msp.org/ant/2013/7-2/ant-v7-n2-p01-p.pdf), pp. 256–257, with preceding strict-motive construction: confirmed `ℓ ≠ p` scope. |
| Noot 2017 | [Author page](https://www.math.unistra.fr/~noot/publications/jnt.html) identifies the paper, but publisher and repository attempts did not retrieve the complete Corollary 2.2. BCGP 2021 Proposition 2.8.1, pp. 194–195 was read directly; the exact coefficient-prime statement remains an explicit gap. |

All recorded mathematics is paraphrased, with locators. No source passage or
section-by-section source summary is included in the deliverables.

## Dependencies and duplication

Current upstream was inspected at `94ff6a17fb5f138baeac6cd961cd5c21e40f6696`,
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Compilation uses
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; supplier statements were read at
the pins. In particular the nine packet Mathlib baseline declarations were
checked in their modules: the local polynomial and good/multiplicative reduction
predicates, `Etale`, `Smooth`, `QuasiCompact`, `IsSeparated`, and `Over.pullback`.
The numerical Picard quotient/degree, affine component schemes, character
functor and nodal-polynomial comparison were also inspected locally. Searches
used mathematical objects and hypotheses, including non-affine smooth models,
generic restriction, finite-free two-lattice forms, integral graph cycles,
weighted multidegrees, finite inertia actions and cotangent lattices.

The nine newer roadmaps were included: AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory
(including its nested topics), OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry. Completed IntegralLattices,
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts
were included. Their general module, local-Galois and lattice foundations are
suppliers, not additional Néron-model results. No new exact duplicate requiring
removal was found in this run; no upstream file was changed or built.

| Targets audited | Existing boundary or retained difference |
|---|---|
| 1.1–1.10 | Tau Ceti's flat finitely presented DVR `Model` and generic-fibre extensionality are supplied; the retained arbitrary `Over j` variant imposes the full smooth-test mapping property and marked uniqueness. Abelian schemes/étale descent use the lower suppliers. |
| 1.11, 6.3–6.4, 6.9 | Invariant cotangent module is SF T361; only model-specific lattice comparisons and equation-level generators remain. General vector-bundle/tensor constructions are not re-planned. |
| 2.1–2.5 | Existing identity/component implementations are affine over algebraically closed fields. The retained target handles non-affine abelian fibres and residue-field descent. Existing torus character functors are consumed. |
| 2.6–2.9, 6.5–6.9 | EllipticCurves owns the equation predicates, reduction filtration and algorithm; StableReduction Layer 5 owns Kodaira geometry. Only scheme comparisons/component groups remain here. The earlier deletion of the geometric dictionary is preserved without a stub. |
| 3.1–3.14 | Lower abelian-scheme/torsion and arithmetic-Galois suppliers are explicit. StableReduction supplies curve semistability; the independent Jacobian-isogeny route avoids using a curve–Jacobian converse to prove itself. |
| 4.1–4.4 | StableReduction supplies graphs, normalisations and Betti number. The retained variant gives the signed integral cycle lattice and its geometric character/weighted-form comparisons. |
| 4.3, 4.5–4.6 | Current `IntegralLattice.discriminantPairing` and IntegralLattices Layer 1D treat a symmetric single lattice. Here the pairing has two possibly different lattices and need not be symmetric. Existing rank-one `2m` tests are not the valuation-`n` arithmetic adapter. |
| 4.7 | Tau Ceti `NumericalType.Pic` and `.degree` supply the numerical quotient. Only its degree-zero/component comparison is planned. |
| 4.8–4.12 | BGW equation/normalisation replaces an upward Part II pinching prerequisite. Lower norm-torus, torsor, Brauer and cohomology suppliers are cited; their definitions remain deferred. |
| 4.13 | Stable-family Picard comparison is retained; the Hodge-line theorem belongs to downstream JacobianChallenge Part II. |
| 5.1–5.7, 6.10–6.14 | ArithmeticGaloisRepresentations owns Tate modules, WD representations, conductors and local Euler factors. Reduction-specific comparisons remain here. The earlier moved-down period comparison in 5.3 is preserved; PadicHodgeTheory is a downstream owner, not a prerequisite. |

Checked the tier order: this roadmap is tier 8, with ArithmeticGaloisRepresentations
below it (tier 7) and AbelianSchemesAndArithmeticModuli below it (tier 6).
Part II, PadicHodgeTheory and modularity roadmaps are consumers. No new notion
was moved down in this run. There are no unresolved `UPSTREAM:` or
FoundationsAndLibraryIntegration supplier identifiers. The real supplier
generality defect is recorded explicitly at §4.3, rather than hidden behind
an earlier-layer citation.

## Adversarial pass

Each row covers the named definition, its API identities/theorems and Checks.
Algebraic witnesses were computed independently of `sorry` elaboration;
geometric examples test the stated hypotheses and source formulas, rather than
claiming a Lean proof. The table uses the final subsection numbering.

| Statement | Instances tried / conclusion |
|---|---|
| Conventions: base, finite type, markings | A field/identity base morphism has no arithmetic content; the lft Néron model of `𝔾_m` over a DVR is not quasi-compact; markings are retained in uniqueness. |
| Conventions: components/rational points | Split `ℤ/5` has five rational components; negation has one fixed point. Geometric size cannot replace rational size. |
| Conventions: characters/variance | Pullback of characters under a torus map is contravariant; for `[m]` the positive rank-one form changes from `n` to `mn`. |
| Conventions: valuation/sign/twist | `ord(π)=1`; `q=π⁵` gives positive `5`; period basis maps to toric `5`, and inverse pairing gives `1/5`, not `−1/5`. Weil sign remains explicit. |
| Conventions: Frobenius/cohomology | Geometric Frobenius on cohomological invariants gives split/nonsplit factors `1−T`, `1+T`; homological Tate module is dual. |
| 1.1 mapping property | Identity restriction; a smooth nonextendible generic map; generically identity endomorphism. Testing only étale schemes is weaker. |
| 1.2 marked models | Smooth/separated/quasi-compact projections; both marking composites; lft torus excludes omitted quasi-compactness. |
| 1.3 extension | Generic identity extends to identity; restriction recovers the input; extension commutes with precomposition and respects markings. |
| 1.4 uniqueness | Model-to-model extensions compose to identities; uniqueness is among marking-preserving isomorphisms. |
| 1.5 group law | Identity, inverse and associativity restrict to generic equalities; smooth product tests supply uniqueness. |
| 1.6 weak models | Néron model is weak; identity-base degeneracy; smooth-locus blowup can be weak without the full mapping property. |
| 1.7 local existence | Abelian variety includes dimension zero; arbitrary torus is excluded from the finite-type existence theorem. |
| 1.8 abelian scheme | Good elliptic model and zero abelian variety; properness alone does not replace the smooth-test extension argument. |
| 1.9 global construction | Good open set, one bad place, Dedekind local gluing; quasi-compact noetherian base gives finitely many bad places. |
| 1.10 base change | Identity/unramified extension; ramified Tate valuation `1→2` refutes a general full-model comparison. |
| 1.11 differential lattice | Rank zero, elliptic rank one, nonprincipal projective lattice; projective is not necessarily free globally. |
| 2.1 identity | Good connected fibre, multiplicative fibre with components, additive fibre; identity open is not the whole model. |
| 2.2 components | `I₁`, `I₂`, `I₄`, `I₅`; fixed negation counts `1,2,2,1`; `ZMod 0 = ℤ` refutes dropping positivity. |
| 2.3 Chevalley | Good, multiplicative and additive elliptic fibres; perfect-field hypothesis retained for the torus/unipotent decomposition. |
| 2.4 characters | Split `𝔾_m` gives `ℤ`, zero torus gives zero, nonsplit quadratic torus gives sign action; imperfect-field descent remains separate. |
| 2.5 isogeny | Tate `q→qⁿ`; kernel can hit distinct components, so no short exact special-fibre/component sequence is assumed. |
| 2.6 filtration | Finite residue field yields component surjectivity via Lang plus smooth lifting; arbitrary perfect field only gives the stated injection without an `H¹` hypothesis. |
| 2.7 smooth locus | Good fibre, node and additive fibre; the regular model itself is not always smooth. Completion/strict-henselian descent remains named. |
| 2.8 type groups | `I₀` separated from `Iₙ`, `n≥1`; `I₀*` has `(ℤ/2)²`, `I₃*` has `ℤ/4`; exceptional orders checked. |
| 2.9 wild comparison | `ℚ₂`, type `II*`, discriminant `14`; `ℚ₃`, type `IV`, discriminant `7`; perfect-residue algorithm does not permit tame valuations at 2 or 3. |
| 3.1 semistability | Good `(t,a)=(0,1)`, Tate `(1,0)`, additive non-example; product/zero variety; henselisation leaves residue field unchanged. |
| 3.2 isogeny | `[n]`, `n≠0`; `[0]` fails for positive dimension; Tate component orders change while ranks agree. |
| 3.3 identity base change | Good model, Tate identity torus, additive-to-good counterexample; full model comparison is excluded. |
| 3.4 component map | `(n,e)=(1,2)`, `e=1`, `e=0`; map is `r↦er`, injective only when `e>0`, nonsurjective when `e>1,n>0`. |
| 3.5 filtration | Tate `1⊂1⊂2`, surface `1⊂3⊂4`, good `0⊂2g⊂2g`; residue-prime finite torsion is not inertia invariants. |
| 3.6 orthogonality | `rk T_f + rk T_t(dual)=2g`; good and totally toric cases; saturation and twist retained before mod-ℓ passage. |
| 3.7 square-zero | Positive Tate operator nonzero with square zero; good operator zero; image is toric, not only finite. |
| 3.8 Picard identity | Smooth curve, rational loop, rational tree; special multidegree zero differs from total generic degree zero. |
| 3.9 full quotient | Smooth case retains integer degrees in unrestricted `P/E`; split `Iₙ,n>1` refutes full NMP for `Pic⁰`; fixed degree-zero quotient. |
| 3.10 potential semistability | Good, Tate and additive curve acquiring good reduction after finite extension; quotient-of-Jacobian route has infinite fraction field. |
| 3.11 monodromy criterion | Good trivial action, Tate unipotent nontrivial action, additive nonunipotent action; cannot replace prime-to-residue lattice by one finite torsion level. |
| 3.12 full level | `N=2` twist counterexample; `N=3,q=8` over `ℚ₂` gives unramified torsion but multiplicative reduction; conclusion is semistability. |
| 3.13 Raynaud extension | Good `G=B`, Tate `G=𝔾_m`; full-model components disappear on identity completion; `char k>0` restriction is retained. |
| 3.14 uniformisation | Good zero period lattice, Tate rank one, nonsplit nonconstant Galois lattice; positivity and the Weil-sign comparison are distinguished in §4.3. |
| 4.1 normalisation | Rational loop gives `𝔾_m`, tree zero, two parallel edges rank one; a simple graph loses the second branch. |
| 4.2 cycles/boundary | Loop boundary zero; edge `0→1` gives `δ₁−δ₀`; parallel-edge coefficients `(1,−1)` give zero; empty vertices/disconnected graph require the stated Betti hypotheses. |
| 4.3 pairing | `n=5` gives adjoint value `10` at `(1,2)`, `n=1` ordinary product, `n=0` degenerate infinite cokernel; torus zero has zero cokernel; ramification gives `en`. Explicit remaining comparisons. |
| 4.4 graph form | Length-five loop gives `5,10,−5`; two edges give `a+b`; zero length kills positivity; simultaneous orientation reversal preserves the form. |
| 4.5 component cokernel | `n=1` trivial, `n=5` order five, zero pairing on `ℤ` infinite; finite-free injective adjoint hypotheses cannot be suppressed. |
| 4.6 discriminant/obstruction | Specified classes `(1,1),(1,2)` mod 5 give `1/5,2/5`; changing `r` by `n` adds integer `s`; division requires `n>0` or denominator `m≠0`. Both signs checked using Werner. |
| 4.7 intersection quotient | Tree zero, `I₂` gives `ℤ/2`, `I₀*` gives `(ℤ/2)²`; relation `I·m=0` uses multiplicities and the numerical degree-zero group. |
| 4.8 one-node curve | Two branches over quadratic étale algebra; split pair and nonsplit quadratic field; characteristic two excluded for this BGW equation. |
| 4.9 generalised Jacobian | Split algebra gives `𝔾_m` and trivial `H¹`; nonsplit case gives the norm quotient; the extension is not asserted canonically split. |
| 4.10 two-torsion | `g=1` gives sizes eight and four; branch character is retained; odd-factor and discriminant torsors are not interchangeable. |
| 4.11 odd factors | Completely split polynomial has odd factors; irreducible even-degree polynomial has none regardless of genus parity. |
| 4.12 connecting class | Split character case, nontrivial odd-factor class and coboundary change; cup-product domain and direction are explicit. |
| 4.13 stable family | Smooth fibre and nodal degeneration; toric rank can jump, so one fixed-rank global extension is not asserted. |
| 5.1 NOS | Tate nontrivial inertia for every `ℓ≠char k`; additive case; unramified `A[N]` alone insufficient, including the unit-root issue. |
| 5.2 good isogeny | Nonzero multiplication, degree divisible by `ℓ`, residue-prime isogeny; rational Tate isomorphism does not identify integral lattices or models. |
| 5.3 period comparison | Zero/trivial representation, ramified scalar fields `K₀≠K`, Tate `N≠0`, additive de Rham representation; `e=2` coefficient rescaling and chosen logarithm retained. |
| 5.4 conductor interface | Good zero, multiplicative one, wild additive positive Swan; the finite inertia action after semistable extension is retained, not just toric rank there. |
| 5.5 semistable conductor | `t=0,1,2` gives `0,1,2`; surface `t=a=1` has conductor one; wild inertia triviality uses prime-to-residue coefficients. |
| 5.6 local factor | Good `1−aT+qT²`, split/nonsplit `1∓T`, additive elliptic `1`; geometric Frobenius and cohomological invariants are essential. |
| 5.7 residual conductor | If `ℓ|ord(q)`, residual conductor can be zero while characteristic-zero conductor is one; dual geometric component order hypothesis retained. |
| 6.1 adjoints | Rank-one `q→qᵐ` gives `n·m=mn`; the dual pullback and two character lattices fix the domains. |
| 6.2 character sequence | Isogeny with disconnected kernel; neither duality nor equal ranks creates exactness. Connected/saturated kernel assumptions are explicit. |
| 6.3 differential base change | Unramified and semistable ramified examples; additive-to-good base change is a negative control. |
| 6.4 differential isogeny | Degree-p map reducing to Frobenius has pullback zero modulo p; generic determinant is nonzero, but integral invertibility need not hold. |
| 6.5 good equation | Unit discriminant smooth model; nonminimal rescaling can change discriminant valuation; minimality is required in the converse. |
| 6.6 multiplicative equation | `ℤ₂` split/nonsplit tangent polynomials, discriminants `−1730,−1978` with valuation one; square tests in characteristic two do not distinguish them. Added descent target. |
| 6.7 discriminant | `Iₙ` valuation `n`; wild `II*` valuation 14 and `IV` valuation 7; tame table restricted. |
| 6.8 Tamagawa | Good one, split `Iₙ` gives n, nonsplit odd/even gives one/two; geometric order is not rational order. |
| 6.9 minimal differential | Variable change contributes `u⁻¹`, at `u=5` values `1/5` versus wrong `5`; smooth-locus comparison applies to a minimal equation. |
| 6.10 compatible system | Positive-degree Weil element and normalised open inertia subgroup yield a finite semistable extension; arbitrary inertia element is not such a Frobenius. Coefficient-prime trace input remains conditional. |
| 6.11 semistable ordinary | Good ordinary, totally toric, supersingular good negative control; ordinary refers to the abelian quotient. |
| 6.12 ordinary surface | Toric ranks zero/one/two give isotropic rank two; residue-prime connected/étale torsion replaces inertia invariants. |
| 6.13 residual point | Siegel parabolic order 48 is not a 2-group; point-stabiliser intersection order eight is; order-three action on `𝔽₂²` fixes no nonzero vector. |
| 6.14 curve level | `N=3` except characteristic three uses four; `g=0` refutes strict matrix bound and is excluded; perfect constant field supplies perfect residue fields for descent. |

Definitions have at least three discriminatory Checks. Where geometric carriers
cannot be typed at the pins, the definitions and their Checks remain in the
closing block/README, as PACKAGE_REVIEW permits. Typed definitions retain their
corresponding examples; the new operator has zero, nonzero square-zero and basis
image tests. No proposition is replaced by `True` or `Prop := sorry`.

Spot-checked more than ten Lean signatures against the README: full smooth-test
NMP, marked finite-type model, extension/restriction, marked unique isomorphism,
étale-test weak model, fixed negation count, ramified component map, Tate operator,
integral boundary, connected Betti formula, weighted edge form, finite-free
two-lattice discriminant with specified representatives, nonzero 2-group fixed
vector and positive-genus matrix bound. Generality agrees: the abstract `Over j`
prefix is intentionally more general than arithmetic existence; algebraic zero
moduli/lengths are permitted for negative controls and are not asserted to be
geometric Tate curves or positive metrics.

## Remaining defects and concrete continuation

1. **README §4.3, `prime_adic`.** Raynaud's positive prime-to-residue Kummer
   formula now has a domain and an explicit witness. Still provide the signed
   map from the Weil-pairing quotient to `β_ℓ`, reconciling Illusie's negative
   convention; give the separate coefficient-prime finite-flat/p-divisible
   comparison. Also supply the formal identity/uniformisation comparison for
   residue characteristic zero and its henselian descent: §§3.13–3.14 currently
   have positive-residue-characteristic hypotheses. Werner §3 is an available
   general-characteristic statement, but it does not by itself supply that
   entire formal comparison. These cannot be closed by substituting the tame
   formula at `ℓ=char k` or by citing SGA Theorem 10.4 without the sign map.
   The residue-zero supplier issue also affects the claimed generality of
   §5.1's pairing-based converse. Retain the positive graph/inverse-form tests.
2. **README §6.10.** Retrieve Noot 2017 Corollary 2.2 from an authorised public
   manuscript or cleared source and collate its exact coefficient-prime
   hypothesis and trace comparison. Noot 2013 Corollary 2.7 covers `ℓ≠p`;
   neither the abstract nor BCGP's reference certifies the missing `p` statement.
   Then discharge `semistable_trace_descent` using the finite extension generated
   by the positive-degree Weil element and normalised open inertia subgroup,
   including its coefficient-prime realisation. Do not infer trace independence
   over the original field merely from toric ranks after extension.

The inaccessible-Tate and obstruction-pairing defects of the previous report
are resolved by this review. The remaining source/convention/generalisation
inputs could not be established to the required standard; they are explicit
gaps, so the package is not marked accepted. No separate handoff file is needed:
this section provides the continuation record within the issue's allowed paths.

## Validation

Final `lean-check` on the absolute Suggested file: exit 0, 112 warnings,
all `declaration uses sorry`; the two numerical Picard `#check` lines are the
only other mathematical output. This checks signatures and examples, not truth.
Available memory exceeded 20 GB. No language server or Lake build/update/cache
command was started; the shared pinned wrapper was used.

`python3 scripts/check_blueprint.py` on the unchanged packet: 0 errors,
0 warnings. `python3 research/blueprint/intake.py check-files` on the five allowed
deliverable paths: 0 problems. `git diff --check`: exit 0. README remains below
200 KB; metadata remains the single fitting `topic = "math.AG"` line. No local
filesystem paths or source excerpts are in the deliverables. Only the package
README, Suggested file, review JSON and this review report changed.
