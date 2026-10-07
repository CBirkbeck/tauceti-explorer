# ASM-K3BlochGroups: assembled reader and suggested declarations

Agent: Codex — session `codex-jxaZeM`. Refs #6423.

## Result and review boundary

The assembly is complete: the primary packet and all six independently accepted
continuations are represented in one reader and one suggested Lean file. This
is a completed assembly of the supplied partial plans, not a claim that their
remaining mathematical or supplier proof gaps are closed. All 175 distinct
node IDs survive, with full statements, hypotheses, proof routes, API contracts,
tests, uses, acceptance criteria and exact imports where the packets provide
them. The reader introduces scope, ownership, conventions, sources and the
layer order before developing the six layers; it ends with source qualifications
and 119 distinct pinned declaration references.

The assembled files are [the reader](../readmes/K3BlochGroups.md) and
[the suggested declarations](../suggested/K3BlochGroups.lean). The seven packets
remain the machine-readable specification. The part readers, part Lean files,
independent reviews, campaign text and atlas data were not edited.

| Layer | Nodes | Planets |
| --- | ---: | ---: |
| V.1 | 21 | 5 |
| V.2 | 18 | 6 |
| V.3 | 37 | 6 |
| V.4 | 52 | 6 |
| V.5 | 30 | 6 |
| V.6 | 17 | 6 |

## Reconciliation performed

No mathematical statement, hypothesis, acceptance criterion, API contract,
test contract or review verdict in a packet was changed. The following exact
imports make inherited consumers point to their accepted refinements:

- `V.4/homological-stability` imports `V.4/frame-spectral-sequence-collapse`
  and `V.4/normalized-milnor-homology-map`.
- `V.4/torus-borel-homology` imports `V.4/affine-block-homology`.
- `V.5/element-c-order-six` imports `V.5/real-rogers-detector` and
  `V.5/universal-class-order-six`.
- `V.5/finite-field-bloch-comparison` imports
  `V.5/finite-stabilization-equivalence` and
  `V.5/finite-enhanced-torsion-sequence`.
- `V.5/nonsplit-cartan-mod-n` imports `V.5/norm-one-cartan-embedding` and
  `V.5/cartan-homology-modulo-n`.
- `V.6/finite-coefficient-identification` imports
  `V.3/cgz-published-comparison-map` and `V.3/cgz-published-lemma-two-two`,
  retaining its older-convention comparison for the other consumers.

Three inherited proof-step descriptions (stability, torus/Borel and order of c)
now cite these precise refinements instead of saying their sources were not
obtained. The original gap inventory remains in the primary packet for
provenance: its historical citation failures must be read together with the
current layer closure requirements, not taken as evidence that these sources
are still absent. The reviewed parts supply source decomposition for
Bass–Tate, convention comparisons, stability, finite fields and Rogers descent;
they retain the unresolved proof inputs described below.

Combining the packets originally gave V.5 ten planets. Four redundant
continuation markers were removed: `localized-sl2-homology`, `finite-bloch-orders`,
`odd-coefficient-finite-comparison`, `rational-decomposable-subgroup`. Their
nodes remain complete. The four primary planets plus `finite-cross-ratio-map`
and `universal-class-order-six` give six.

The elementary `V.4/cross-ratio` is a foundational arithmetic/projective-coordinate
slice needed by V.3's generic presentation. Its exact node dependency is
acyclic; V.3 does not depend on V.4's later Bloch-valued comparisons.

The suggested file has one standard notice and one import block. Local
sections prevent supplier variables from leaking between layers. V.3's
continuation names now alias the primary Suslin, exterior, old-CGZ and projective
carriers rather than introducing disconnected placeholders; the reduced
presentation has its explicit quotient equivalence. V.1's integral homology
and certificate evaluator connect to the primary homology/evaluation models.
The Rogers forms use the actual real pre-Bloch group and rational universal
class. V.6 has actual-field specializations of the integral root multiple,
ordinary-quotient, localized and p-adic coefficient forms, with tensor-to-quotient
comparison characterized on pure tensors. Four missing primary finite-field
and Cartan test signatures are included. These are concrete instantiations
of the existing contracts, not new mathematical claims. The independent
assembly review should check these bridges; no reviewed packet statement was
strengthened or weakened, so no separate mathematical re-review was triggered.

## Current closure and routing priorities

The reader's six closure sections give the active fine-grained proof boundaries.
In particular:

- V.1 still needs the shared low-degree Hopf/Whitehead package and the
  multiplicative sphere-unit/minus-one action, beyond the already identified
  upstream Hurewicz and covering statements. General plus/bar supplier proofs
  remain their owners' responsibilities. Characteristic two is not excluded,
  and no internal K-theory product for noncommutative rings is invented.
- V.2 retains the integral motivic Chern construction, characteristic-prime
  Izhboldin theorem, degree-zero motivic/étale comparison and algebraically
  closed divisibility inputs. The Bass–Tate rank is r₁, not r₂; its real-place
  basis and the factor +2 in degree-three Chern composition are retained.
- V.3 retains the smooth-curve local-DVR dictionary and the all-curve rational
  kernel problem. Generic B₂ is P(F); the rational all-curve quotient's
  injectivity is not established by the F(t) case or asserted as a theorem.
  Published CGZ uses the negative target and differs from the inherited
  exterior-cycle image: over F₁₁ their groups are respectively Z/3 and Z/6.
  HB.1 must consume the published carrier when citing CGZ. The angle assignment
  is a homomorphism only for fields with at least four elements.
- V.4 retains general group-module homology tools, unstable SL₂ symbols,
  algebraically closed coefficient K-theory, the omitted GL₂ d³ calculation,
  ψ₃/symmetric-group inputs, and plus/AHSS/enhanced-Tor proof inputs. Its Chern
  detector needs an early M.8 slice independent of P.2/R.7, to avoid
  M.8 → R.7 → P.2 → V.4. The Bott proof range is odd coefficients or coefficients
  divisible by eight; the cyclic Chern evaluation itself has the wider stated
  invertibility range. The enhanced Tor object is not an ordinary tensor of
  divisible torsion groups.
- V.5 retains stable-element/periodic homology and Sah/colimit inputs, refined
  finite-configuration and torsion-map proofs, Rogers interval identities and
  positive-presentation descent, and the arithmetic N.8/Gaussian w₂ certificate.
  Remove N.8's reverse ownership before supplying its certificates to V.5.
  Finite K₃ is imported from L.1 for every q, while integral SL₂ exceptions and
  the q=5 order 120 remain explicit. Odd coefficient comparisons require
  gcd(n,q−1)=1; q=7,n=3 is a failure test. The Cartan map is induced by the
  actual norm-one quadratic-extension embedding and its power map acts on
  H₃ by a². Rogers uses period π²Z and sends c to −π²/6.
- V.6 retains algorithmic certificate-to-finite-bar-cycle construction and the
  right-end Bockstein normalization. Its algebraic root/lift exports must be
  split from its HB.2-dependent arithmetic comparison (V.6a → HB.2 → V.6b),
  rather than introducing a whole-stage cycle. The integral cycle is m[ζ],
  not necessarily [ζ]; B⊗R uses R on the right and invertible m without a
  flatness hypothesis. The Suslin lift fibre is a torsor, not a chosen
  additive section. The finite comparison's left square includes γ⁻¹ and
  its coefficient integer has the extra primeness assumptions of M_F.
  Ordinary K₃/n differs from K₃ with finite coefficients by the K₂[n]
  Bockstein term. Real regulator sign/scalar remain P.2/R.7 outputs. D.2 must
  fix p-adic normalization and supply local Milnor K₃/pᵐ vanishing or killing
  of decomposables; M.7/M.8 supply the finite Chern/reduction/twist comparison.

The complete request and restructuring inventories below preserve duplicates,
origins and historical wording. A request already narrowed by a continuation
should be fulfilled in that narrower node-level form, not implemented twice.
The proposals are for maintainer application; this assembly does not edit
other roadmaps or upstream topology.

## Validation

- All seven packets: `python3 scripts/check_blueprint.py` — zero errors and
  zero warnings at the pinned declaration index.
- Combined graph: 175 unique nodes; every internal prerequisite resolves;
  acyclic; all six layers have at most six planets.
- Reader: every target has one anchor; local links and fragments resolve.
  All requested API/test names are accounted for. Primary tests use named
  comments on Lean examples. The inherited `finiteBlochHom_cyclic_bar` remains
  an explicit untyped omission: its refined square-class chains, β map and
  periodic-to-inhomogeneous chain comparison are missing supplier syntax; the
  intended equation and required carriers are recorded beside the map. Every
  other API name has a typed declaration. This is part of V.5’s existing
  refined-configuration closure requirement, not an elaborated theorem.
- Packet comparison: all review objects and all mathematical statements,
  hypotheses, API/test and acceptance contracts agree with the input commits.
- `lean-check research/blueprint/suggested/K3BlochGroups.lean` — exit 0,
  807 warnings, all `declaration uses sorry`; no errors or other warnings.
  The file has 83 imports and 5098 lines. Pins: Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- `git diff --check` and the intake deliverable/path checks pass.

No formal proof completion is claimed: `sorry` marks the planning declarations.
No Lean process remains running. Resume with the independent assembly review,
then route the supplier extensions and restructuring proposals at their listed
owners; a new worker must not silently treat these proof gaps as completed.

## Supplier request inventory (59 records)


### primary: [K3BlochGroups.json](../packets/K3BlochGroups.json)

#### primary request 1: `KTheoryFiniteLocalFields:L.1`

The finite-field calculation in the case j = 2, namely that K_3 of a finite field with q elements is cyclic of order q squared minus one, for every q including 2 and 3, together with the restriction and transfer maps in degree three and their formulas in the functorial model, stated without choosing a cyclic generator. L.1 states all of this ('Prove, for every finite field with q elements and every j≥1, … K_{2j−1}(F_q) ≅ Z/(q^j−1)'; 'Construct the restriction and transfer maps for finite extensions and prove their formulas in the functorial model'); V.5 specialises it and must not reprove it.

Consumers: `K3BlochGroups:V.5/k3-finite-field`, `K3BlochGroups:V.5/finite-field-transfer`.

#### primary request 2: `ArithmeticKTheory:N.5`

The degree-three row of the odd-group structure theorem, for a number field and for its rings of S-integers, in the two cases totally imaginary and with a real embedding, with the extension data rather than only the abstract group; and the isomorphism K_3(O_{F,S}) ≅ K_3(F) (the case j = 2 of 'Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2'), which V.2 uses to pass Borel's rank to the field and V.5 uses for K_3(Z) ≅ K_3(Q). N.5 concerns number fields and S-integers only and supplies nothing to the e-invariant step of V.4/pi3ind-bm-plus, which is dropped from neededBy.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.5/k3-Z-and-Q`, `K3BlochGroups:V.5/k3-number-field`.

#### primary request 3: `Polylogarithms:P.1`

The Bloch-Wigner function with its conjugation relation, and its five-term identity in the K-book normalisation, as the nodes Polylogarithms:P.1/bloch-wigner-dilogarithm and Polylogarithms:P.1/bloch-wigner-five-term. The two V.3 nodes with the reserved analytic ids are pointer comparisons importing these; the descent is Polylogarithms:P.2/bloch-wigner-descent. Those Polylogarithms nodes should cite the V.3 node ids (pre-bloch-group, bloch-group) rather than the stage K3BlochGroups:V.3, which removes the stage-level cycle V.3 → P.1 → V.3. The Rogers dilogarithm L(x) = Li_2(x) + ½ log(x) log(1 − x) on (0, 1), its extension to the real line, its reflection and five-term identities, and the resulting homomorphism from B(R), in Suslin's convention of V.3, to R modulo a lattice of rational multiples of π² under which c has image of order six (Suslin, K_3 of a field and the Bloch group, pp. 219–220). P.1's stage text plans Li_n and the Bloch-Wigner function but not this function.

Consumers: `K3BlochGroups:V.3/bloch-wigner-dilogarithm`, `K3BlochGroups:V.3/bloch-wigner-five-term`, `K3BlochGroups:V.5/element-c-order-six`.

#### primary request 4: `Polylogarithms:P.2`

The comparison of the descended Bloch-Wigner map with the Borel class, with its sign and scalar. The Polylogarithms packet plans exactly this as Polylogarithms:P.2/borel-comparison, through P.2/bloch-wigner-descent and P.2/weight-two-regulator, so by PROTOCOL §3 V.6/regulator-agreement should cite that node id rather than the stage. The certified numerics (P.2/certified-numerics) are not needed: the order of c needs the Rogers dilogarithm, not a numerical value (see the gap on the order of c).

Consumers: `K3BlochGroups:V.6/regulator-agreement`.

#### primary request 5: `PadicHodgeRegulators:D.2`

The comparison, in degree three and weight two, of the syntomic or étale regulator with the explicit p-adic dilogarithm on the Bloch-group model, with its scalar and Frobenius normalisation and its coefficient hypotheses (D.2's stage text). D.3, the unramified p > 3 theorem, is a consumer of V.6's root-of-unity classes, not a supplier: citing it here would close a cycle once D.3 imports V.6. The comparison, in degree three and weight two, of the étale/syntomic regulator with the explicit p-adic dilogarithm on the Bloch-group model of V.3 and V.6, with its scalar and Frobenius normalisation and the coefficient hypotheses under which it holds. This is D.2's text ('In degree three and weight two compare the regulator with the explicit p-adic dilogarithm on V's Bloch-group model. Give the actual scalar/Frobenius normalisation.'). D.3, named before, proves the unramified p > 3 image theorem D_p: K_3(L; Z_p) ≅ p²O_L, requires K3BlochGroups V.4, and does not state the comparison.

Consumers: `K3BlochGroups:V.6/regulator-agreement-padic`, `K3BlochGroups:V.6/regulator-agreement`.

#### primary request 6: `K2SymbolsBrauer:T.1:classical`

The stable Steinberg group St(A) as the colimit of the St_n(A) with its stabilisation maps, functorial in ring maps; the surjection onto E(A); the general definition of a universal central extension; and the theorem that St(A) → E(A) is a universal central extension with kernel K_2(A), for every associative unital ring with no stable-range hypothesis (K-book III.5.2.1 and III.5.5 have none). Also the universal-central-extension package that the superperfection of St(A) and Ex. IV.1.9 rest on: the perfectness of both ends of a universal central extension (T.1/uce-perfect), superperfect groups, and the theorem that the source of a universal central extension is superperfect (T.1:classical/uce-source-superperfect with central-extension-comp, uce-extensions-split, split-extensions-kill-h2 and h1-trivial-perfect), which this layer formerly planned as V.1/uce-superperfect, V.1/central-extension-comp and V.1/split-extensions-kill-h2 (RT-AREA-ktheory-1/29 and /30). V.1 imports these, deduces the superperfection of St(A) as a corollary, and proves only the homotopy-theoretic consequences: the plus construction BSt(A)⁺, the connected-cover comparison, the Hurewicz step and the bar-cycle model of K_3. The stage-level edge K2SymbolsBrauer:T.1:classical → K3BlochGroups:V.1 is requested of the atlas maintainer.

Consumers: `K3BlochGroups:V.1/steinberg-superperfect`, `K3BlochGroups:V.1/uce-plus-fibration`, `K3BlochGroups:V.1/bst-plus`, `K3BlochGroups:V.1/bst-plus-connected-cover`, `K3BlochGroups:V.1/k3-naturality`, `K3BlochGroups:V.1/steinberg-homology-colimit`.

#### primary request 7: `StableHomotopyKTheory:H.3`

The plus construction with its universal property, homology isomorphism, functoriality and relative form; in particular (i) K-book Ex. IV.1.8: for a perfect normal subgroup P of G, BP⁺ is homotopy equivalent to the universal cover of BG⁺ (plus relative to P), so π_n(BP⁺) ≅ π_n(BG⁺) for n ≥ 2; (ii) the comparison of fibres after plus for a central extension 1 → A → S → P → 1 of perfect groups: BA → BS⁺ → BP⁺ is a homotopy fibration (Ex. IV.1.9); (iii) BM⁺ for the monomial group M and its commutator subgroup, used by V.4. H.3 states the plus construction, its universal property and 'the relative construction needed to compare fibres after applying plus'. It does not state homological stability, which is no longer requested here: V.4's stage text assigns it to V.4 ('prove them here when they are not supplied by H'); see the gap.

Consumers: `K3BlochGroups:V.1/bst-plus`, `K3BlochGroups:V.1/bst-plus-two-connected`, `K3BlochGroups:V.1/bst-plus-connected-cover`, `K3BlochGroups:V.1/uce-plus-fibration`, `K3BlochGroups:V.1/k3-h3-steinberg`, `K3BlochGroups:V.1/k3-naturality`, `K3BlochGroups:V.1/k2-to-k3-h3-e`, `K3BlochGroups:V.4/pi3-bm-plus`.

#### primary request 8: `K2SymbolsBrauer:T.2`

Milnor K-theory as the tensor algebra of the units modulo the homogeneous Steinberg ideal, in all degrees, together with the graded map to Quillen K-theory whose degree-three component V.2 uses. The field presentation of K_2 that V.3 needs is requested separately from T.2:symbols.

Consumers: `K3BlochGroups:V.2/milnor-to-quillen-degree-three`, `K3BlochGroups:V.2/milnor-k3-injective`, `K3BlochGroups:V.2/milnor-k3-number-field`, `K3BlochGroups:V.4/psi-gl2`, `K3BlochGroups:V.4/pi3-bm-plus`.

#### primary request 9: `MotivicEtaleKTheory:M.7`

Suslin's rigidity for algebraically closed fields (K-book Theorem VI.1.3: for algebraically closed k ⊂ F the maps K_n(k; Z/m) → K_n(F; Z/m) are isomorphisms) and its consequence that a Bott element β gives a graded ring isomorphism K_*(F; Z/m) ≅ Z/m[β] for F algebraically closed with 1/m ∈ F (VI.1.4 in characteristic 0, VI.1.3.1(iii) in characteristic p), which V.4/pi3ind-bm-plus uses for K_4(F; Z/m) ≅ Z/m on β² (Lemma VI.5.19). M.7: 'Prove the relevant rigidity and étale descent theorems.' The étale Chern classes the same lemma uses are not in M.7 (only M.8 plans them, and M.8 is downstream of V.4); see the gap on the e-invariant step.

Consumers: `K3BlochGroups:V.4/pi3ind-bm-plus`.

#### primary request 10: `ArithmeticKTheory:N.3:ranks`

The rank of K_3(O_F) for the ring of integers of a number field, rank r_2 (the case n = 3 ≡ 3 mod 4 of N.3:ranks, which applies BorelRegulators R.3; the reserved node BorelRegulators:R.3/borel-rank-theorem states it). R.3 itself is stated for orders and S-integers, not for the field, so V.2 passes to F through ArithmeticKTheory N.5.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`.

#### primary request 11: `K2SymbolsBrauer:T.1:plus`

K_2(A) ≅ π_2(BGL(A)⁺) ≅ π_2(BE(A)⁺), naturally in A, for every associative unital ring.

Consumers: `K3BlochGroups:V.1/k2-to-k3-h3-e`.

#### primary request 12: `K2SymbolsBrauer:T.2:graded-map`

The natural graded ring map K_*^M(F) → K_*(F) from products, with {a,b,c} ↦ [a]·[b]·[c] and its compatibility with Matsumoto's isomorphism under K_1 ⊗ K_2 → K_3; V.2 uses its degree-three component.

Consumers: `K3BlochGroups:V.2/milnor-to-quillen-degree-three`, `K3BlochGroups:V.2/k3-to-h3-sl-field`.

#### primary request 13: `K2SymbolsBrauer:T.2:symbols`

Milnor K-theory of a field as the tensor algebra of the units modulo the homogeneous Steinberg ideal, and Matsumoto's theorem that K_2(F) is generated by the symbols {a, b}. For every field F: Matsumoto's presentation K_2(F) ≅ Fˣ ⊗ Fˣ modulo the Steinberg subgroup generated by the x ⊗ (1 − x); anti-commutativity {a, b} = −{b, a}; and {a, a} = {a, −1}. With these, Fˣ ⊗ Fˣ modulo Steinberg equals the antisymmetric quotient modulo the x ∧ (1 − x). The stage text plans exactly these: 'Prove Matsumoto's theorem that the resulting map K₂ᴹ(F) → K₂(F) is an isomorphism … Derive {a,b}=-{b,a}, {a,-a}=0, and the correct formula for {a,a}.'

Consumers: `K3BlochGroups:V.2/milnor-to-quillen-degree-three`, `K3BlochGroups:V.2/k3-to-h3-sl-field`, `K3BlochGroups:V.2/milnor-k3-number-field`, `K3BlochGroups:V.2/motivic-low-degree-sequence`, `K3BlochGroups:V.3/bloch-four-term-exact`, `K3BlochGroups:V.3/exterior-kernel-discrepancy`.

#### primary request 14: `GeneralAlgebraicKTheory:K.2:plus`

The K-theory space K(A) with its zero component identified naturally with BGL(A)⁺, so K_n(A) = π_n(BGL(A)⁺) for n ≥ 1. V.1 cites this sub-stage rather than K.2, whose K.2:low-degree-comparisons part requires V.4 and would close a cycle.

Consumers: `K3BlochGroups:V.1/bst-plus`, `K3BlochGroups:V.1/bst-plus-connected-cover`, `K3BlochGroups:V.1/k2-to-k3-h3-e`, `K3BlochGroups:V.2/milnor-to-quillen-degree-three`.

#### primary request 15: `GeneralAlgebraicKTheory:K.7`

The external product K_1(Z) ⊗ K_2(R) → K_3(Z ⊗ R) = K_3(R) for every ring R, used for the product with [−1].

Consumers: `K3BlochGroups:V.1/k2-to-k3-h3-e`.

#### primary request 16: `StableHomotopyKTheory:H.1`

For a discrete group G: BG as the realisation of the nerve of its one-object groupoid, a K(G,1), with the comparison of singular homology of BG with Mathlib's groupHomology (Rep.trivial Z G Z), natural in G.

Consumers: `K3BlochGroups:V.1/bst-plus`, `K3BlochGroups:V.1/bst-plus-two-connected`, `K3BlochGroups:V.1/k3-h3-steinberg`, `K3BlochGroups:V.1/k3-naturality`, `K3BlochGroups:V.1/uce-plus-fibration`, `K3BlochGroups:V.1/k2-to-k3-h3-e`.

#### primary request 17: `StableHomotopyKTheory:H.2`

Homotopy fibres and the long exact sequence of homotopy groups, and the fibration BA → BS → BP of classifying spaces of a group extension.

Consumers: `K3BlochGroups:V.1/uce-plus-fibration`.

#### primary request 18: `KTheoryLowDegrees:U.1`

The stable elementary group E(A) inside GL(A), perfect and normal.

Consumers: `K3BlochGroups:V.1/bst-plus`.

#### primary request 19: `KTheoryLowDegrees:U.3`

SK_1(F) = 0 for a field, so E(F) = SL(F).

Consumers: `K3BlochGroups:V.2/k3-to-h3-sl-field`.

#### primary request 20: `MotivicEtaleKTheory:M.4`

For a field k: the ring isomorphism K_*^M(k) ≅ ⊕ H^i(k, Z(i)) (Nesterenko–Suslin–Totaro), the vanishing H^n(k, Z(1)) = 0 for n ≤ 0 and H^n(k, Z(i)) = 0 for n > i, and functoriality in field extensions.

Consumers: `K3BlochGroups:V.2/motivic-low-degree-sequence`, `K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`, `K3BlochGroups:V.2/milnor-k3-injective`.

#### primary request 21: `MotivicEtaleKTheory:M.6`

The motivic spectral sequence for Spec of a field, its multiplicative structure, the identification of the edge maps with the Milnor-to-Quillen maps (K-book VI.4.3), and the low-degree exact sequence K_4(k) → H^0(k, Z(2)) → K_3^M(k) → K_3(k) → H^1(k, Z(2)) → 0 (VI.4.3.1).

Consumers: `K3BlochGroups:V.2/motivic-low-degree-sequence`.

#### primary request 22: `MotivicEtaleKTheory:M.5`

The identification H^0(k, Z/2(2)) ≅ H^0_et(k, μ_2^{⊗2}) for char k ≠ 2 (the case n = 0 ≤ i = 2 of the motivic-to-étale comparison), used in the proof of Proposition VI.4.3.2.

Consumers: `K3BlochGroups:V.2/milnor-k3-injective`.

#### primary request 23: `ArithmeticKTheory:N.3:finite-generation`

Finite generation of K_3(O_F) for the ring of integers of a number field.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`.

#### primary request 24: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`

The absolute Hurewicz theorem in degrees two and three and its naturality, for the classifying spaces and plus constructions of StableHomotopyKTheory (realised as topological spaces); cited in a gap because tauceti:-prefixed ids cannot be prerequisites.

Consumers: `K3BlochGroups:V.1/bst-plus-two-connected`, `K3BlochGroups:V.1/k3-h3-steinberg`, `K3BlochGroups:V.1/k3-naturality`, `K3BlochGroups:V.1/eta-hurewicz-sequence`.

#### primary request 25: `K2SymbolsBrauer:T.5`

K_2(F_q) = 0 for every finite field F_q (T.5's stage text: 'Prove K₂(Z) ≅ Z/2 with generator {−1,−1}, K₂(F_q)=0'), from which V.5 deduces K_3^M(F_q) = 0.

Consumers: `K3BlochGroups:V.5/milnor-k3-finite-field`.

#### primary request 26: `StableHomotopyKTheory:H.6`

The spectral sequence of a filtered spectrum, in the form of the Atiyah–Hirzebruch spectral sequence E^2_{p,q} = H_p(G, π^s_q) ⇒ π_{p+q}(Σ^∞ BG_+) for a discrete group G, as a module spectral sequence over π^s_*, with its convergence for connective spectra.

Consumers: `K3BlochGroups:V.4/pi3ind-ahss`.

#### primary request 27: `BorelRegulators:R.7`

Exact weight-two scalar and sign for the Borel/Beilinson comparison; P.2/borel-comparison currently supplies only proportionality by some nonzero rational number. V.6 transports the imported equality along its algebraic quotient.

Consumers: `K3BlochGroups:V.6/regulator-agreement`.

### V.1: [K3BlochGroups--V.1.json](../packets/K3BlochGroups--V.1.json)

#### V.1 request 1: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`

Absolute Hurewicz in degrees two and three, its naturality, and the pair LES/relative Hurewicz for a two-connected mapping-cylinder pair. In particular: for simply connected CW X,Y with π₂(f) surjective and H₃(Y;ℤ)=0, exact π₃(Y)→π₃(X)→H₃(X)→0, with the actual Hurewicz map. These are applications of the stated upstream relative/Hurewicz scope.

Consumers: `K3BlochGroups:V.1/two-connected-hurewicz-input`, `K3BlochGroups:V.1/hspace-hopf-kernel-refinement`.

#### V.1 request 2: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

CW wedge and mapping-cylinder pair models, H₃(∨S²;ℤ)=0 from cellular homology, based homotopy extension for the wedge inclusion into S²×S², and finite-subcomplex factorization for maps/homotopies from compact spheres.

Consumers: `K3BlochGroups:V.1/hspace-hopf-kernel-refinement`.

#### V.1 request 3: `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`

Covering and based lift uniqueness, products of simply connected locally path connected spaces, and lifting unit homotopies relative to the chosen point, as used for the multiplication on the elementary cover. Existing cover objects and generic lifting theory are imported. Export the general based H-space-on-cover application of these lifting theorems, with projection and lift uniqueness; V.1 instantiates it on the elementary cover and does not redeclare that generic construction.

Consumers: `K3BlochGroups:V.1/elementary-cover-hspace`.

#### V.1 request 4: `tauceti:TauCetiRoadmap/UniversalCovers#stage-3-higher-homotopy`

For an actual covering p, its based induced maps on π_n are isomorphisms for n≥2, natural in based covering squares; compatibility with the cubical homotopy-group carrier.

Consumers: `K3BlochGroups:V.1/cover-and-fibre-interface`.

#### V.1 request 5: `StableHomotopyKTheory:H.1`

Enhance H.1/homology-of-small-categories with the natural comparison to the exact pinned unnormalised groupHomology (Rep.trivial ℤ G ℤ), via its natural normalisation/degenerated-chain equivalence. It must commute with groupHomology.π and group homomorphisms. H.1/nerve-and-classifying-space and H.1/homology-of-small-categories already supply BG and the abstract comparison; do not rebuild those.

Consumers: `K3BlochGroups:V.1/canonical-comparison-interface`, `K3BlochGroups:V.1/ring-map-comparison-square`.

#### V.1 request 6: `StableHomotopyKTheory:H.3`

Provide the based ring-map naturality of the chosen relative-plus/fibre square in H.3/plus-pi2-universal-central-extension, including the maps under BSt and BE. The generic universal-cover and UCE-fibration assertions of IV.1.8/1.9 already have that finer supplier node; only this compatibility/proof boundary is requested.

Consumers: `K3BlochGroups:V.1/ring-map-comparison-square`, `K3BlochGroups:V.1/cover-and-fibre-interface`.

#### V.1 request 7: `GeneralAlgebraicKTheory:K.2:plus`

The block-sum multiplication and based unit homotopies on a well-pointed CW-type representative of BGL(A)⁺, with unital-ring-map H-map compatibility, refining the ring plus model of K.2:plus/plus-equals-Q. Keep the early model separate from K.2:low-degree-comparisons, which consumes V.

Consumers: `K3BlochGroups:V.1/elementary-cover-hspace`.

#### V.1 request 8: `GeneralAlgebraicKTheory:K.7`

Specialize K.7/biexact-pairings-and-products to the external product K₂(A)×K₁(ℤ)→K₃(A⊗ℤ)≅K₃(A) for associative unital A. Supply compatibility between the plus and spectrum products and change of coefficient ring. In characteristic two, the scalar action factors through the central ℤ→𝔽₂→A: naturality identifies it with K₂(A)×K₁(𝔽₂)→K₃(A⊗𝔽₂)≅K₃(A), where [-1] maps to [1]=0. This needs neither a commutative A nor a redefinition of products.

Consumers: `K3BlochGroups:V.1/hopf-minus-one-product-refinement`, `K3BlochGroups:V.1/elementary-homology-exact-sequence-refinement`.

#### V.1 request 9: `StableHomotopyKTheory:H.5:spectra`

Import the general suspension/stabilization and stable-homotopy carrier from the early spectrum foundation. The sphere-unit action and its compatibility with precomposition, and the multiplicative BPQ identification of η with the transposition class, exceed its current explicit scope: they are gap G2 and the proposed Part II extension, not supplied by this request alone.

Consumers: `K3BlochGroups:V.1/hopf-minus-one-product-refinement`.

#### V.1 request 10: `K2SymbolsBrauer:T.1:plus`

The natural identification K₂(A)≅π₂(BGL(A)⁺)≅H₂(E(A);ℤ) of the stable UCE kernel with the imported plus model, for every associative unital ring A. No finite-rank kernel comparison is requested.

Consumers: `K3BlochGroups:V.1/elementary-homology-exact-sequence-refinement`.

### V.2: [K3BlochGroups--V.2.json](../packets/K3BlochGroups--V.2.json)

#### V.2 request 1: `MotivicEtaleKTheory:M.4`

Integral motivic complexes with their coefficient triangle Z(2) --2→ Z(2) → Z/2(2), natural long exact cohomology sequence and injection H⁰(F,Z(2))/2 ↪ H⁰(F,Z/2(2)); diagonal Nesterenko–Suslin–Totaro ring identification and Hⁿ(F,Z(1))=0 for n≤0, Hⁿ(F,Z(i))=0 for n>i. For the missing integral Chern operation, register the foundational Part II contract in gap G-Chern, not an assertion that M.4 already constructs it.

Consumers: `K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`, `K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`, `K3BlochGroups:V.2/milnor-k3-injective`.

#### V.2 request 2: `MotivicEtaleKTheory:M.5`

The natural truncated motivic-to-étale comparison Hⁿ(F,Z/m(i)) ≅ Hⁿ_et(F,μ_m⊗i) for m invertible in F and n≤i; here n=0,i=2,m=2. The restriction to Fbar on H⁰_et(F,μ₂⊗²)=Z/2 is the identity. This is a requested extension of the stated diagonal norm-residue theorem; it is not supplied by the diagonal theorem alone.

Consumers: `K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`, `K3BlochGroups:V.2/milnor-k3-injective`.

#### V.2 request 3: `MotivicEtaleKTheory:M.6`

The multiplicative integral motivic spectral sequence for fields and its low-degree extraction K₄→H⁰(Z(2)) --d₂→K₃ᴹ --m₃→K₃ --edge→H¹(Z(2))→0, natural in fields, with the edge component matched to the exact T.2 graded comparison. This supplier gives the filtered K-theory mechanism; the V.2 low-degree extraction remains the inherited consumer lemma.

Consumers: `K3BlochGroups:V.2/motivic-low-degree-sequence`, `K3BlochGroups:V.2/indecomposable-motivic-edge-equivalence`.

#### V.2 request 4: `MotivicEtaleKTheory:M.7`

From rigidity and finite-coefficient comparison, deduce that K₄ of an algebraically closed field is divisible (indeed uniquely divisible): characteristic zero uses VI.1.4–1.6, characteristic p>0 uses VI.1.3.1(i). Give all-prime divisibility including the characteristic prime, with coefficient UCT and filtered-colimit compatibility; do not apply a characteristic-zero result in positive characteristic.

Consumers: `K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`, `K3BlochGroups:V.2/milnor-k3-injective`.

#### V.2 request 5: `K2SymbolsBrauer:T.2:symbols/milnor-number-field`

Refine the supplier’s G-BassTate from the now located primary source BT1973 II §2, Theorem (2.1)(3), complete proof pp.398–402. Keep finiteness from II §1, the prime-to-p restriction/transfer, norm-residue/Hasse-Brauer injection, Hilbert reciprocity, idelic orthogonality, and Kummer weak-approximation inputs owned by their proper suppliers; M.2 local/global and real-place duality and T.7 Hilbert-symbol inputs must not be replaced by an unsupported cardinality argument. The V.2 consumer is not an incoming prerequisite of the general theorem.

Consumers: `K3BlochGroups:V.2/real-place-basis`, `K3BlochGroups:V.2/real-basis-symbol-representatives`, `K3BlochGroups:V.2/minus-one-product-surjective`.

#### V.2 request 6: `K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed`

Resolve the supplier’s algebraically-closed Milnor divisibility proof gap: K_nᴹ(Fbar) uniquely divisible for n≥2, in particular n=3, with the degree restriction and characteristic-prime case explicit. The statement exists and is imported exactly; proof closure remains at the supplier.

Consumers: `K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`.

#### V.2 request 7: `K2SymbolsBrauer:T.2:symbols`

Part II in the Milnor-theory direction: Izhboldin’s theorem, K_nᴹ(F) has no p-torsion for char(F)=p, n≥1. Read K-book III.7.8 including its Bloch–Kato–Gabber, transfer and induction inputs. Degree-three characteristic-two application belongs to V.2, while the general theorem and proof belong to this supplier. This request is an extension beyond the current symbols stage and remains gap G-Izhboldin.

Consumers: `K3BlochGroups:V.2/milnor-k3-injective`.

#### V.2 request 8: `ArithmeticKTheory:N.3:finite-generation`

Finite generation of K₃(O_F), not merely finite rank or finite generation after tensoring with Q.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`.

#### V.2 request 9: `ArithmeticKTheory:N.3:ranks`

Apply Borel’s independent rank theorem to K₃(O_F), with rank r₂. Export this via N.5 to K₃(F), rather than constructing a second Borel regulator/rank theorem in V.2.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`.

#### V.2 request 10: `ArithmeticKTheory:N.5`

The canonical localization isomorphism K₃(O_F)→K₃(F), and the S-integer variant, with maps. This alone, together with N.3, is the arithmetic input for V.2; no need to import the downstream V.5 or N.8 rational-number order computations.

Consumers: `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.2/rationalisation-loss`.

### V.3: [K3BlochGroups--V.3.json](../packets/K3BlochGroups--V.3.json)

#### V.3 request 1: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`

For a separated finite-type integral scheme X smooth of relative dimension one over Spec F and an F-rational section u, identify the local ring at u with a DVR having fraction field X.functionField and residue field F; supply canonical projective specialization F(X)→P¹(F), evaluation of regular functions and constants, zeros/poles, and its compatibility with the projective line and field embeddings. V.3 imports this geometry and uses Polylogarithms:P.4/specialization-and-delta for the algebraic cycle formula. Layer 12A currently states its dictionary for proper regular curves. The requested local contract must also apply to the smooth open curves quantified over here, either directly or by a justified regular proper model and restriction; properness must not silently replace the all-curve relation set.

Consumers: `K3BlochGroups:V.3/goncharov-curve-b2`, `K3BlochGroups:V.3/goncharov-curve-boundary`, `K3BlochGroups:V.3/goncharov-curve-comparison`.

### V.4: [K3BlochGroups--V.4.json](../packets/K3BlochGroups--V.4.json)

#### V.4 request 1: `StableHomotopyKTheory:H.1`

Part II after H.1’s classifying-space/bar/local-coefficient comparison: LHS for group extensions with coefficients, projective-resolution double-complex hyperhomology spectral sequences with finite filtrations and edge/connectors, integral UCT detection from Q and all F_p, ordered products and filtered colimits for group homology, the trivial action of central coefficient operators on homology, mixed exterior/symmetric elementary-abelian homology in all characteristics, finite cyclic cohomology periodicity/cup evaluation, and natural H₃(A)=Tor₁(A,A) for locally cyclic A with injective root-group transitions. Existing Mathlib SpectralSequence, total complexes, resolutions and cyclic resolutions are inputs, not new definitions.

Consumers: `K3BlochGroups:V.4/scalar-homology-vanishing`, `K3BlochGroups:V.4/affine-block-homology`, `K3BlochGroups:V.4/frame-connecting-map`, `K3BlochGroups:V.4/frame-algebra-splitting`, `K3BlochGroups:V.4/frame-spectral-sequence-collapse`, `K3BlochGroups:V.4/normalized-milnor-homology-map`, `K3BlochGroups:V.4/closure-torsion-detector`, `K3BlochGroups:V.4/cyclic-chern-evaluation`, `K3BlochGroups:V.4/closure-detector-injectivity`.

#### V.4 request 2: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

Apply the existing AW/EZ ordered chain product, general-ring Künneth spectral sequence/PID exact sequence and Serre/Cartan–Leray tools to the bar/classifying-space comparison. No new upstream product or spectral-sequence definition is requested.

Consumers: `K3BlochGroups:V.4/affine-block-homology`, `K3BlochGroups:V.4/frame-connecting-map`, `K3BlochGroups:V.4/normalized-milnor-homology-map`.

#### V.4 request 3: `StableHomotopyKTheory:H.6`

The planned cofiber finite-coefficient Bockstein, including naturality with Hurewicz and the integral group-homology Bockstein, in the degree-four/degree-three square. This is the existing finite-coefficient remit, not a request for all ordinary group homology.

Consumers: `K3BlochGroups:V.4/chern-bockstein-square`.

#### V.4 request 4: `K2SymbolsBrauer:T.2:symbols`

The existing integral symbol identities and product presentation. Additional input needed for Su84 Proposition2.7.2: the unstable H₂(SL₂(F)) coinvariant presentation used to kill the ordered degree-two Steinberg product modulo H₂(GL₁). Stable Matsumoto/UCE is insufficient; propose T.2 Part II for this presentation.

Consumers: `K3BlochGroups:V.4/frame-algebra-splitting`, `K3BlochGroups:V.4/normalized-milnor-homology-map`.

#### V.4 request 5: `KTheoryFiniteLocalFields:L.2`

Part II extending the henselian/local finite-coefficient remit to algebraically closed fields: K₄(Ω) uniquely divisible, K₄(Ω;Z/m) cyclic with Bott-square generator for m invertible and m odd or 8|m for this proof, and Bockstein isomorphism to K₃(Ω)[m], with natural coefficient changes. Current henselian finite-residue-field rigidity does not state this input.

Consumers: `K3BlochGroups:V.4/closure-torsion-detector`, `K3BlochGroups:V.4/chern-bockstein-square`.

#### V.4 request 6: `MotivicEtaleKTheory:M.7`

An early supplier interface adjacent to M.7: prime-to-characteristic Tate twists and invariants; finite-coefficient étale c₁,c₂, Kummer/Whitney and Bott values, and their group-homology/Hurewicz/Bockstein factorization. The full M.8 regulator stage is not usable here: M.8→BorelRegulators:R.7→Polylogarithms:P2→V.4 gives a stage cycle. Split off the early Chern slice without those regulator prerequisites. Use the Chern product rule on odd moduli and moduli divisible by8; these suffice cofinally. A mod4 product normalization needs a separate argument and is not assumed here.

Consumers: `K3BlochGroups:V.4/closure-torsion-detector`, `K3BlochGroups:V.4/cyclic-chern-evaluation`, `K3BlochGroups:V.4/chern-bockstein-square`.

### V.5: [K3BlochGroups--V.5.json](../packets/K3BlochGroups--V.5.json)

#### V.5 request 1: `Polylogarithms:P.1`

Define interval Rogers L(x)=Σxⁿ/n²+(1/2)log(x)log(1−x), analytic for0<x<1, with L(0)=0,L(1)=π²/6,L(1/2)=π²/12, derivative−(1/2)(log(1−x)/x+log(x)/(1−x)), reflectionL(x)+L(1−x)=π²/6, and the ordered Suslin five-term expression=L(1) for0<y<x<1. Supply exact unshifted normalization, not only a Bloch–Wigner map or a quotient of periodπ²/2.

Consumers: `K3BlochGroups:V.5/real-rogers-detector`.

#### V.5 request 2: `ArithmeticKTheory:N.8`

Correct the existing N.8 integer/Gaussian certificate nodes to import N.5, not V.5. Supply certified K₃(Z)→K₃(Q)≅Z/48 and K₃(Q(i))≅Z⊕Z/24, with r₁=0,r₂=1,w₂(Q(i))=24. Their group computations are owned by N.5/N.8; V.5 only consumes them to track Milnor images. Remove the reverse V.5 prerequisite before materialising the requested N.8→V.5 edge.

Consumers: `K3BlochGroups:V.5/rational-decomposable-subgroup`, `K3BlochGroups:V.5/gaussian-decomposable-vanishing`.

#### V.5 request 3: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`

Use the upstream total sign homomorphism on Fˣ and its surjectivity: for each prescribed ±1 pattern at the real places of a number field there is a nonzero element with exactly those signs. This is already in the upstream roadmap and is consumed without re-planning it.

Consumers: `K3BlochGroups:V.5/number-field-product-image`.

### V.6: [K3BlochGroups--V.6.json](../packets/K3BlochGroups--V.6.json)

#### V.6 request 1: `MotivicEtaleKTheory:M.7`

For every number field F, odd p and a≥1, the degree-three finite Chern comparison identifies K₃(F;ℤ/p^a) with H¹(F,ℤ/p^a(2)). Export the exact finite-coefficient indecomposable quotient used by Hutchinson Theorem 2.10 and the reduction to the full group when K₃^M(F)/p^a=0. Do not require μ_{p^a}⊂F.

Consumers: `K3BlochGroups:V.6/finite-coefficient-identification`.

#### V.6 request 2: `MotivicEtaleKTheory:M.8`

Export Soulé’s finite c̄₂,₁ with its compatibility along j_K:K₃(F)/n→K₃(F;ℤ/n), the p-adic-to-finite reduction, and the ζ twist/Kummer convention used in HB.1/hutchinson-chern-class-agrees. Also identify the induced map on the K₂[n] Bockstein term, with its scalar/sign, for comparison to CGZ δ_B.

Consumers: `K3BlochGroups:V.6/finite-coefficient-identification`.

## Restructuring proposal inventory (21 records)

### primary: [K3BlochGroups.json](../packets/K3BlochGroups.json)

#### primary restructuring 1: The two analytic nodes of V.3 are owned by Polylogarithms P.1 and P.2

**kind.** move-nodes

**title.** The two analytic nodes of V.3 are owned by Polylogarithms P.1 and P.2

**detail.** The ownership is fixed by the stage texts. P.1: 'For weight two define the Bloch–Wigner dilogarithm … Prove conjugation, inversion, the five-term identity and the differential formula.' P.2: 'Descend the Bloch–Wigner function through the exact V.3 Bloch-group convention.' V.3 plans nothing analytic; its only mention is 'Do not erase 2- or 3-torsion merely because the real dilogarithm kills it.' The Polylogarithms packet already contains P.1/bloch-wigner-dilogarithm, P.1/bloch-wigner-five-term and P.2/bloch-wigner-descent, with a matching restructure entry. So the descent belongs to P.2, not P.1. Proposal: retire the reserved ids K3BlochGroups:V.3/bloch-wigner-dilogarithm and K3BlochGroups:V.3/bloch-wigner-five-term from reserved-ids.json; until then they are pointer comparisons carrying only V.3's torsion warning. Consumers to re-point: V.6/regulator-agreement to Polylogarithms:P.2/borel-comparison, the node that states the agreement with the Borel class with its sign and scalar (through P.2/bloch-wigner-descent); V.5/k3-Q-splitting to the Rogers-dilogarithm argument of Suslin [187, pp. 219–220], because D vanishes on real points and cannot detect the order of c. No stage plans the Rogers dilogarithm; see the gap on the order of c. The Polylogarithms nodes cite the stage K3BlochGroups:V.3 and should cite V.3 node ids instead, to break the stage-level cycle.

#### primary restructuring 2: The comparison of the CGZ and Suslin Bloch-group conventions is owned by K3BlochGroups V.3

**kind.** ownership

**title.** The comparison of the CGZ and Suslin Bloch-group conventions is owned by K3BlochGroups V.3

**detail.** Two stage texts plan the same comparison. K3BlochGroups V.3: 'Separately construct the conventions used by Bloch, Goncharov and Calegari–Garoufalidis–Zagier. Prove the comparison maps, their exact small torsion corrections and their rational identifications.' HabiroNumberFields HB.1: 'Compare CGZ's Bloch group with V's Suslin convention. Define the actual maps and identify the bounded 2-/6-primary differences.' The reviewed library audit (data/library-coverage.json, layer K3BlochGroups:V.3, duplicates) flags the overlap. Proposal: V.3 owns the definitions and the comparison (cgz-bloch-group, exterior-kernel-bloch-group, exterior-kernel-discrepancy, cgz-degenerate-relations, cgz-convention-comparison); HB.1 is narrowed to import them and keeps the finite-coefficient Chern classes and the CGZ arithmetic statements.

#### primary restructuring 3: V.6's regulator sentence is owned by Polylogarithms P.2 and PadicHodgeRegulators D.2

**kind.** rescope

**title.** V.6's regulator sentence is owned by Polylogarithms P.2 and PadicHodgeRegulators D.2

**detail.** V.6's stage text ends 'Prove that P's real regulator and D's p-adic regulator agree with the abstract K-theory regulators under these comparisons.' Polylogarithms P.2 plans the real comparison ('compare it with the Borel class ... The comparison includes its sign and scalar') and has the node P.2/borel-comparison; PadicHodgeRegulators D.2 plans the p-adic one ('In degree three and weight two compare the regulator with the explicit p-adic dilogarithm on V's Bloch-group model'). The reviewed audit AUDIT-29 lists both as duplicates of V.6, and RT-AREA-ktheory-2/23 and RT-AUDIT-26/4 are confirmed. Proposal: V.6 keeps the rational, integral and modulo-n comparisons and the transport of P.2's and D.2's statements along them (V.6/regulator-agreement, V.6/regulator-agreement-padic); the analytic comparisons stay with P.2 and D.2. Add the atlas links P.2 → V.6 and D.2 → V.6 (both acyclic) and V.6 → D.3, since D.3's text consumes 'V's valid coefficient-localised or integral multiples' (V.6/root-of-unity-class); V.6 → HabiroNumberFields:HB.1 likewise for the modulo-n comparison.

#### primary restructuring 4: K₃ of finite fields is owned by KTheoryFiniteLocalFields L.1; K₃ of the integers and of the Gaussian rationals is proved here and imported by ArithmeticKTheory N.8

**kind.** ownership

**title.** K₃ of finite fields is owned by KTheoryFiniteLocalFields L.1; K₃ of the integers and of the Gaussian rationals is proved here and imported by ArithmeticKTheory N.8

**detail.** V.5 reads 'Use Quillen's finite-field calculation to construct K₃(F_q) ≅ Z/(q²−1), including q=2 and q=3 … Compute restriction and transfer through the finite-field model. Prove K₃(Z) ≅ Z/48 and K₃(Q) ≅ Z/48 … Include K₃(Q(i)) ≅ Z ⊕ Z/24 as an arithmetic test once N and R are available.' The same results are planned elsewhere. L.1: 'Prove, for every finite field with q elements and every j≥1, … K_{2j−1}(F_q) ≅ Z/(q^j−1)' and 'Construct the restriction and transfer maps for finite extensions and prove their formulas in the functorial model.' N.8: 'Compute the first four groups of Z; compute K₂(Z[i])=0 and K₃(Q(i)) ≅ Z ⊕ Z/24.' N.5: 'Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2.' The reviewed library audit (data/library-coverage.json, layer K3BlochGroups:V.5, duplicates L.1 and N.8; and conversely under L.1 and N.8) flags both overlaps. The packet imports the finite-field results from L.1 (V.5/k3-finite-field, V.5/finite-field-transfer). For the arithmetic values the direction is the reverse: ArithmeticKTheory N.8 (N.8/k-groups-of-the-integers and N.8/gaussian-and-imaginary-quadratic) imports V.5, and N.8's packet assigns K₃(ℤ) and K₃(ℚ(i)) to V.5. V.5 importing N.8 as well made the two stages depend on each other, so FIX-RT-AREA-ktheory-1~2 removed that import: V.5/k3-Z-and-Q and V.5/k3-gaussian now derive K₃(ℚ) ≅ ℤ/48 and K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24 from V.5/k3-number-field, which rests on ArithmeticKTheory N.5's degree-three rows, and K₃(ℤ) ≅ K₃(ℚ) from N.5's localisation theorem. Proposal: L.1 owns K₃(F_q) with its restriction and transfer; V.5 owns K₃(ℤ), K₃(ℚ) and K₃(ℚ(i)) as specialisations of its number-field theorem, together with the Bloch-group and decomposable-class bookkeeping (V.5/bloch-group-finite-field, V.5/k3-Q-splitting, V.5/k3-number-field); N.8's stage text says that it records the K₃ values from V.5.

#### primary restructuring 5: The regulator agreements of V.6 are proved by Polylogarithms P.2 and PadicHodgeRegulators D.2

**kind.** ownership

**title.** The regulator agreements of V.6 are proved by Polylogarithms P.2 and PadicHodgeRegulators D.2

**detail.** V.6 reads 'Prove that P's real regulator and D's p-adic regulator agree with the abstract K-theory regulators under these comparisons.' Two other stages plan the same proofs. P.2: 'Assemble its embedding-wise map for a number field and compare it with the Borel class … The comparison includes its sign and scalar.' D.2: 'In degree three and weight two compare the regulator with the explicit p-adic dilogarithm on V's Bloch-group model. Give the actual scalar/Frobenius normalisation.' The reviewed library audit (layer K3BlochGroups:V.6, duplicates Polylogarithms:P.2 and PadicHodgeRegulators:D.2; and under Polylogarithms:P.2) flags both, and the Polylogarithms packet already plans Polylogarithms:P.2/borel-comparison. V.6/regulator-agreement exports the statement only and says the proofs 'belong to Polylogarithms P.2 and PadicHodgeRegulators D.2'. Proposal: P.2 and D.2 own the two agreements. V.6 is narrowed to the rational, integral and finite-coefficient comparisons and the statement of which comparison each regulator uses. V.6/regulator-agreement cites Polylogarithms:P.2/borel-comparison and PadicHodgeRegulators:D.2, not D.3. D.3's text consumes V.6 ('The roots-of-unity classes are constructed through V's valid coefficient-localised or integral multiples'), but D.3 requires only V.4. Once V.6 no longer cites D.3, a link V.6 → D.3 can be recorded without a cycle.

#### primary restructuring 6: The configuration complex and the cross-ratio are owned by K3BlochGroups V.4

**kind.** ownership

**title.** The configuration complex and the cross-ratio are owned by K3BlochGroups V.4

**detail.** V.4 reads 'Develop the configuration complex for points in the projective line, its group action and spectral sequence, the cross-ratio map, and the identification of the homology terms.' P.2 reads 'Develop the configuration/cross-ratio cocycle and hyperbolic-volume calculation used by Bloch to identify this map with the abstract regulator.' The reviewed library audit flags the overlap under both layers. The Polylogarithms packet already imports the machinery ('the configuration and cross-ratio machinery is imported from K3BlochGroups V.4, which owns it', Polylogarithms:P.2/hyperbolic-volume) and requests from V.4 'The configuration complex of points of the projective line, the cross-ratio and Suslin's exact sequence'. Proposal: V.4 owns the configuration complex and the cross-ratio map, which therefore needs a construction node of its own in V.4. P.2 is narrowed to the Bloch–Wigner cocycle and the volume identification.

#### primary restructuring 7: The explicit K₃ model is owned by K3BlochGroups V.1 and V.4; GeneralAlgebraicKTheory K.2:low-degree-comparisons imports it

**kind.** ownership

**title.** The explicit K₃ model is owned by K3BlochGroups V.1 and V.4; GeneralAlgebraicKTheory K.2:low-degree-comparisons imports it

**detail.** K.2:low-degree-comparisons reads 'Combine them with U, T and V to identify the explicit K₁, K₂ and K₃ models', and it requires K3BlochGroups:V.4. The reviewed library audit (layer K3BlochGroups:V.1, duplicates) records it as making 'the comparison K₃(A) ≅ H₃(St(A), ℤ) made here'. The packet had expressed this as a request to GeneralAlgebraicKTheory:K.2, which cannot supply V.4: K.2 contains K.2:low-degree-comparisons, so V.4 → K.2 → K.2:low-degree-comparisons → V.4 is a stage cycle. Proposal: V.1/k3-h3-steinberg and V.4/suslin-exact-sequence own the explicit K₃ model, and K.2:low-degree-comparisons imports them. The K3BlochGroups layers cite only K.2:plus from that stage.

#### primary restructuring 8: Étale Chern classes on K-theory with finite coefficients are needed upstream of V.4

**kind.** prerequisite

**title.** Étale Chern classes on K-theory with finite coefficients are needed upstream of V.4

**detail.** Suslin's sequence needs the enhanced summand to inject into K₃^ind(F). The K-book proves this in Lemma VI.5.19 with the étale Chern class c_{2,4}: K_4(F; Z/m) → H^0(F, μ_m^{⊗2}), its product rule and c_1(β) = ζ. The only stage that plans étale Chern classes is MotivicEtaleKTheory M.8 ('Construct étale Chern classes, real Deligne cycle-class maps and the rational regulator from motivic cohomology'). M.8 requires BorelRegulators R.7, which requires Polylogarithms P.2, which requires K3BlochGroups V.4, so V.4 cannot import them. Proposal: split M.8 so that the étale Chern classes c_{i,j} on K_j(X; Z/m), with the product formula and the value on the Bott element, form a sub-stage that does not depend on R.7, for example beside M.7, which V.4/pi3ind-bm-plus then cites.

#### primary restructuring 9: RT-AREA-ktheory-2/13,19–23: actual supplier maps

**kind.** note-duplicate-boundary

**title.** RT-AREA-ktheory-2/13,19–23: actual supplier maps

**detail.** V.5 owns finite-field Bloch–Wigner and Cartan comparisons, importing Quillen groups and generic finite-field restriction/transfer from L.1. Existing finite-field-transfer is already such a specialization and is retained. V.2 imports T.2:symbols global Milnor results and T.2:graded-map; V.5 retains its N.5 requests (its N.8 request was removed to break the V.5–N.8 cycle). V.6 keeps early algebraic quotients/certificates separate from its late analytic transport: P.2 owns the real formula, D.2 the p-adic comparison and R.7 the exact real scalar. Never add both whole-stage P.2→V.6 and V.6→P.2.

### V.1: [K3BlochGroups--V.1.json](../packets/K3BlochGroups--V.1.json)

#### V.1 restructuring 1: rescope

**action.** rescope

**roadmaps.**

```json
[
  "K3BlochGroups",
  "K2SymbolsBrauer"
]
```

**detail.** Implement confirmed RT-AREA-ktheory-1/29: V.1 imports stable St(A), its UCE and UCE-source superperfection from T.1:classical, retaining only the degree-three plus/Hurewicz and cycle model. Parent moved recognition-theorem IDs are already supplier references and remain unchanged.

**proposal.**

```json
{
  "stageEdges": [
    {
      "source": "K2SymbolsBrauer:T.1:classical",
      "target": "K3BlochGroups:V.1",
      "reason": "Stable Steinberg group/UCE and source superperfection are supplier inputs to the retained V.1 comparison."
    }
  ],
  "ownership": "K2SymbolsBrauer:T.1:classical owns the group, UCE and recognition theorem; K3BlochGroups:V.1 owns their degree-three homological application."
}
```

#### V.1 restructuring 2: rescope

**action.** rescope

**roadmaps.**

```json
[
  "StableHomotopyKTheory"
]
```

**detail.** AlgebraicTopology, Part II: low-degree pointed sphere operations, as an additional early foundation layer of the StableHomotopyKTheory extension of upstream AlgebraicTopology. RS-33 was accepted by independent-review-REV-RS-33 on 2026-09-29 and retains the existing H stage/node IDs. This proposal is an additive brief within that accepted direction; it neither changes upstream nor treats G1/G2 as already supplied.

**proposal.**

```json
{
  "title": "Algebraic topology of spaces and manifolds, Part II: low-degree pointed sphere operations",
  "owner": "StableHomotopyKTheory (early sphere-operations extension; exact new stage ID assigned by the restructuring/design job)",
  "startsAfter": [
    "tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead",
    "tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations"
  ],
  "targets": [
    "Construct η:S³→S² from the Hopf bundle with orientation; π₃(S²)=ℤ generated by η.",
    "Construct Whitehead products by the product-cell attaching map, with naturality and H-space vanishing using based unit homotopies.",
    "Prove π₃ of arbitrary CW wedges of S² from finite wedges and finite-subcomplex factorization: direct sum of Hopf generators and unordered distinct Whitehead pairs.",
    "Prove Hopf-composition additivity for based H-spaces and compatibility with the degree-three Hurewicz kernel."
  ],
  "consumers": [
    "K3BlochGroups:V.1/hspace-hopf-kernel-refinement",
    "K3BlochGroups:V.4/pi3-bm-plus"
  ],
  "sources": [
    "Hatcher, Algebraic Topology, 4.51–4.52 and Exercise 37; K-book IV.1.19.1"
  ],
  "boundary": "Import CW/cofibration, pair LES, Hurewicz and universal-cover theory; do not edit or replan the upstream roadmap. Avoid full Hilton–Milnor until an actual consumer needs it."
}
```

#### V.1 restructuring 3: rescope

**action.** rescope

**roadmaps.**

```json
[
  "StableHomotopyKTheory"
]
```

**detail.** Extend the same homotopy-foundation Part II with one shared stable sphere-unit/BPQ layer. Existing early spectrum machinery supplies carriers, and K.7 supplies external K-products. V.1 retains only the ring specialization and transports the operation; parent V.4 imports the same package.

**proposal.**

```json
{
  "title": "Algebraic topology of spaces and manifolds, Part II: stable sphere units and finite-set K-theory",
  "owner": "StableHomotopyKTheory (sphere-unit/BPQ extension)",
  "startsAfter": [
    "StableHomotopyKTheory:H.4",
    "StableHomotopyKTheory:H.5:spectra"
  ],
  "targets": [
    "Prove the BPQ equivalence between finite-set group completion, ℤ×BΣ∞⁺ and Ω∞𝕊, compatible with disjoint union, cartesian product and the unit.",
    "Identify π₁ˢ=ℤ/2 and stabilized η with the odd-transposition class.",
    "Prove the universal spectrum action agrees with precomposition of unstable sphere representatives after stabilization, naturally in spectrum maps.",
    "Under finite-set-to-free-ℤ-module linearization, identify η with [-1] and require compatibility with K.7’s external products; keep K-theory products owned by K.7."
  ],
  "consumers": [
    "K3BlochGroups:V.1/hopf-minus-one-product-refinement",
    "K3BlochGroups:V.4/pi3-bm-plus",
    "K3BlochGroups:V.4/pi3ind-bm-plus"
  ],
  "sourceBoundary": "K-book IV.4.9.3 states BPQ and cites its proof. The cited BP71/Adams proof was not acquired in this pass; the extension blueprint must source that proof. V.4’s higher-stem calculations are additional consumers to screen, not claimed proved here."
}
```

### V.3: [K3BlochGroups--V.3.json](../packets/K3BlochGroups--V.3.json)

#### V.3 restructuring 1: sublayers

**kind.** sublayers

**stageId.** K3BlochGroups:V.3

**reason.** The inherited six landmarks already fill V.3. An assembly may separate tensor/presentation foundations from versioned integral convention comparisons while preserving ownership; no extra planets are introduced in this part.

**proposed.**

```json
[
  {
    "title": "Tensor boundaries and five-term presentations",
    "nodes": [
      "K3BlochGroups:V.3/antisymmetric-tensor-quotient",
      "K3BlochGroups:V.3/five-term-relation",
      "K3BlochGroups:V.3/pre-bloch-group",
      "K3BlochGroups:V.3/bloch-group"
    ]
  },
  {
    "title": "Bloch and Goncharov convention comparisons",
    "nodes": [
      "K3BlochGroups:V.3/bloch-lecture-kernel",
      "K3BlochGroups:V.3/bloch-lecture-obstruction",
      "K3BlochGroups:V.3/bloch-lecture-six-torsion",
      "K3BlochGroups:V.3/goncharov-generic-b2",
      "K3BlochGroups:V.3/goncharov-generic-comparison",
      "K3BlochGroups:V.3/goncharov-curve-b2",
      "K3BlochGroups:V.3/goncharov-curve-comparison"
    ]
  },
  {
    "title": "Versioned CGZ groups and coefficient exports",
    "nodes": [
      "K3BlochGroups:V.3/cgz-bloch-group",
      "K3BlochGroups:V.3/cgz-published-bloch-group",
      "K3BlochGroups:V.3/cgz-published-lemma-two-two",
      "K3BlochGroups:V.3/cgz-published-to-older",
      "K3BlochGroups:V.3/convention-coefficient-exports"
    ]
  }
]
```

### V.4: [K3BlochGroups--V.4.json](../packets/K3BlochGroups--V.4.json)

#### V.4 restructuring 1: split

**action.** split

**roadmaps.**

```json
[
  "K3BlochGroups"
]
```

**detail.** V.4 combines projective configurations, integral GL stability, monomial plus constructions and finite-coefficient torsion detection, with six planets already selected.

**proposal.** Three sublayers under V.4: Configuration and cross-ratio (parent configuration/cross-ratio/ψ₂/ψ₃ nodes and coefficient-change); Stability and Milnor homology (all new scalar/affine/frame/S/δ/θ nodes and degree-three-torus-quotient, with parent stability and h3 generation); Monomial homotopy and Suslin kernel (remaining parent monomial/BPQ/AHSS/enhanced-Tor/exact-sequence nodes and the four detector/Chern nodes). Retain current stage and parent planets until the structure is accepted.

#### V.4 restructuring 2: rescope

**action.** rescope

**roadmaps.**

```json
[
  "StableHomotopyKTheory",
  "K2SymbolsBrauer",
  "KTheoryFiniteLocalFields"
]
```

**detail.** General proof inputs exceed the currently stated supplier targets; assigning them silently to stage names would conceal gaps.

**proposal.** Stable homotopy and K-theory, Part II: ordinary group homology and resolution spectral sequences, after H.1 and upstream AlgebraicTopology stages5–6; K₂ symbols and Brauer groups, Part II: unstable SL₂ H₂ symbols, after T.2; K-theory of finite and local fields, Part II: algebraically closed finite-coefficient K-theory, after L.1/L.2. Exact briefs are the requests, with V.4 as consumer. Do not construct these notions in V.4.

#### V.4 restructuring 3: split

**action.** split

**roadmaps.**

```json
[
  "MotivicEtaleKTheory"
]
```

**detail.** The needed finite-coefficient Chern interface is buried in M.8, whose full regulator prerequisites create a cycle through V.4.

**proposal.** Separate early finite-coefficient Chern classes (Tate twists, Kummer, Whitney, Bott and Hurewicz/Bockstein) adjacent to M.7, without R.7 or Polylogarithms, from M.8’s regulator/Riemann–Roch/norm applications. Keep the current M.7 placeholder request and explicit gap until this split has an exact supplier node.

### V.5: [K3BlochGroups--V.5.json](../packets/K3BlochGroups--V.5.json)

#### V.5 restructuring 1: rescope

**action.** rescope

**roadmaps.**

```json
[
  "K3BlochGroups",
  "ArithmeticKTheory"
]
```

**detail.** Confirmed RT /21–22 assigns stable finite groups and arithmetic groups to L.1 and N.5/N.8. Existing N.8 nodes still reverse the latter ownership.

**proposal.** V.5 imports stable K₃/transfer from L.1 and arithmetic groups from N.5/N.8. N.8 imports its ambient K₃ groups from N.5; remove its prerequisites on V.5. Keep V.5’s indecomposable applications and finite Bloch comparisons. Then add L.1→V.5,N.5→V.5,N.8→V.5 and V.5→HB.2; do not move any existing node in this job.

#### V.5 restructuring 2: rescope

**action.** rescope

**roadmaps.**

```json
[
  "Polylogarithms",
  "K3BlochGroups"
]
```

**detail.** The interval Rogers function is missing while its real Bloch application belongs to V.5.

**proposal.** P.1 owns the interval Rogers analysis and exact functional identities requested here; V.5 owns the homomorphism on the Suslin presentation and the c-order-six application.

#### V.5 restructuring 3: split

**action.** split

**roadmaps.**

```json
[
  "StableHomotopyKTheory"
]
```

**detail.** General finite-group periodic homology is not a consequence of H.6’s K-spectrum coefficient/completion scope.

**proposal.** Propose StableHomotopyKTheory, PartII: finite-group periodic homology, built on Mathlib groupHomology and the existing classifying-space comparison. Own homological Sylow stable elements, cyclic and generalized quaternion periodic resolutions, automorphism action on H₃(Cm), subgroup inclusion maps, and elementary-abelian H₂/H₃. V.5 consumes these general results for SL₂; no new stage is asserted to exist yet.

### V.6: [K3BlochGroups--V.6.json](../packets/K3BlochGroups--V.6.json)

#### V.6 restructuring 1: rescope

**action.** rescope

**roadmaps.**

```json
[
  "K3BlochGroups",
  "Polylogarithms",
  "PadicHodgeRegulators"
]
```

**detail.** RT-AREA-ktheory-2/23: V.6’s final regulator sentence duplicates P.2 and D.2. The follow-up document deletes that target from V.6. It also refines, rather than replaces, the parent’s bundled root-of-unity-class.

**proposal.** V.6 owns algebraic elements, certificates, root substitutes and the comparisons stated here. P.2 owns the real agreement, checked against BorelRegulators:R.7; D.2 owns the p-adic agreement (D.3 is not its supplier). The rational and integral Suslin maps needed for those analytic comparisons are already provided by K3BlochGroups:V.4 and can be imported directly there. Do not introduce a whole-stage V.6→P.2 or V.6→D.2 dependency through the finite-coefficient node: this part consumes M.8, which in turn depends on P/D inputs. If an analytic owner needs a V.6-specific certificate interface, split that algebraic substage before adding the corresponding outgoing edge. At assembly retain the parent’s two planets (five-term-certificate and bloch-element-constructor) and the four new root/lift planets: the combined layer then has exactly six. No original packet, campaign text or atlas data is edited in this job.

#### V.6 restructuring 2: split

**action.** split

**roadmaps.**

```json
[
  "K3BlochGroups"
]
```

**detail.** The source-level order is algebraic V.6 comparisons → HB.2’s étale Bloch theorem → the new finite-coefficient identification. Collapsing this to whole-stage arrows would produce a V.6/HB.2 cycle.

**proposal.** Propose V.6a, Algebraic elements and certificates, containing the retained parent V.6 algebraic/certificate nodes and the four new root/lift nodes; propose V.6b, Arithmetic finite-coefficient identification, containing finite-coefficient-identification. Retain all node ids at assembly. The input directions are V.6a→HabiroNumberFields:HB.2→V.6b and MotivicEtaleKTheory:M.7/M.8→V.6b. Any V.6-specific certificate exports to P.2/D.2 come only from V.6a. This proposal leaves the current exact issue scope V.6 unchanged while making the acyclic supplier/consumer split explicit.
