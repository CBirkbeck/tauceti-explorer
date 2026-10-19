# Independent package review: explicit K₃ and Bloch groups

Issue #10993; reviewer Codex, session codex-xyX96G; 2026-10-19.

**Verdict: needs_changes.** The changes below repair the representative Lean
file and several supplier contracts. The package still has genuine prerequisite
and source-decomposition gaps, detailed below. Successful elaboration does not
close them. This is a completed package review, not an accepted package or a
claim that its targets have been formalized.

## Independence and material reviewed

The reviewed package entered main in commit
`137e7d6b7d0846419613f51e6637ee8671db8589` (PR #10966), authored by the
Codex session codex-zi0zxQ. This reviewer did not author that work.

Read the complete package, the parent packet and V.1–V.6 packets, their gaps
and source issues, the reviewed library coverage, the worker/protocol/review
instructions, the upstream guide and contribution instructions. Compared the
form with the AlgebraicTopology and ProfiniteArithmetic upstream READMEs and
Suggested files, and the PadicMeasuresIwasawaAlgebras exemplar. Packets were
validated without editing them. Metadata remains `topic = "math.KT"`.

The mathematical pass covers all 61 numbered README subsections, their API
clauses, standing conventions and the representative signatures. Rows below
collect related declarations, including their identity/composition and
quotient-universal-property APIs. They distinguish a checked statement from
a proof whose prerequisite chain is still open.

## Fixed in this review

- Replaced admitted examples with 19 proved examples tied to retained light
  definitions. Harder controls are named theorem targets with corresponding
  README descriptions; unrelated arithmetic examples were removed from the
  Lean file, with their substantive README checks retained. There are at most
  two proved examples per retained definition, no admitted examples, no
  admitted data definitions and no construction-heavy Lean development.
- Identified current Tau Ceti Shapiro, transfer and connecting-map suppliers,
  including their finite-index and representation hypotheses. Mapped integral
  product homology to AlgebraicTopology Stage 5 and filtered-colimit homology
  to StableHomotopyKTheory §1.17; neither is reported as a missing construction.
- Matched the plus-fibre and block-sum requirements to
  StableHomotopyKTheory §§3.33 and 4.11. Separated its existing stable-stem,
  Picard-braiding and Barratt–Priddy targets from the still missing
  unstable Hopf/Whitehead calculation and multiplicative unit compatibility.
- Corrected the characteristic-two Milnor contract: divisibility of a torsion
  subgroup does not imply that it is zero. Marked the actual Izhboldin input.
- Replaced an unsupported imported finite Chern *isomorphism* with the exact
  early map supplier and a local target `finiteChernIndEquiv`. Its generality
  is every field and every invertible coefficient integer n≥2, with n=1
  treated separately. Added Levine's original theorem and proof route. Kept
  the number-field odd-coefficient specialization and the inverse comparison
  scalar, without asserting an unchecked right-end normalization.
- Corrected the generic finite comparison's README assumptions from
  “inclusions” to homomorphisms, matching the sufficient Lean hypotheses.
- Marked Bloch's book locator as unverified attribution, not a source theorem.
  The full-tensor kernel and obstruction are explicitly defined and their
  algebraic deductions are attached to the five-term/torsion identities.
- Exposed the omitted GL₂ d³ computation, the separate unread LNM monomial
  arguments, and the algebraically closed unstable comparison needed for the
  finite stabilization map. Equal group orders are not used to supply it.
- Located the existing Gaussian w₂=24 calculation in ArithmeticKTheory
  N.7/`w-invariant`, using N.4. Kept N.8 downstream and used N.5's ambient
  structure theorem for the local Milnor quotient application.
- Restricted the statement about even order of μ(F) to the finite case;
  containing −1 does not make an infinite root group finite.

## Defects that prevent acceptance; handoff

1. **§1.5, Hopf/Whitehead and the sphere unit.** AlgebraicTopology Stage 8's
   ordinary Hurewicz and pair sequences do not themselves compute π₃ of a
   wedge of two-spheres or remove Whitehead terms in an H-space. Supply the
   based calculation, its additivity/naturality consequence, and the unit
   compatibility η↦[−1] for the external K₂×K₁ product. Hatcher §4.2,
   Examples 4.51–4.52, pp.380–381, Exercise 37, p.392, and Weibel IV.1,
   Exercises 1.11–1.12 give the route. Existing StableHomotopyKTheory §§5.42,
   6.3 and 7.1 do not explicitly state that last multiplicative compatibility.
   These require exact Part II supplier targets; do not duplicate BG or plus.
2. **§2.2, integral Milnor injectivity.** The proof needs
   `c₃,₃ ∘ m₃ = +2 id` over every field, and characteristic-primary
   Milnor torsion-freeness for the characteristic-two branch. The inspected
   M.6 operations over smooth schemes over a perfect base and rational Chern
   normalization do not yet give that exact full-field integral contract.
   M.5d's divisible torsion statement is insufficient. Refine the integral
   motivic-Chern and K2SymbolsBrauer Part II suppliers using Weibel V.11.13
   and III.7.8, pp.67–68; retain the degree-zero comparison and all-prime
   algebraically closed divisibility proof obligations inherited from V.2.
3. **§4.5, unstable rank-two symbols.** Well-definedness of the rank-two
   retraction uses the SL₂ coinvariant symbol presentation in Suslin 1984,
   §§2.6–2.7, pp.195–196. Stable Matsumoto is not that statement. Supply its
   exact K2SymbolsBrauer Part II contract or a complete local prerequisite
   decomposition before claiming closure of the simultaneous stability proof.
4. **§4.11 and §4.15, omitted proof inputs.** Suslin 1991 Lemma 2.4,
   p.222, states the GL₂ d³ formula but omits the calculation. Give a finite
   bar-chain derivation with the fixed Shapiro representatives, boundary sign
   and mixed Künneth sign. The two-primary symmetric-group vanishing and the
   relative monomial summands need the separate LNM 1046 §§4.4.1 and 4.2
   arguments cited in Weibel VI.5.13 and VI.5.15; the public Russian
   frame-stability paper does not contain those sections. These remain open.
5. **§§5.2–5.5, actual finite-field maps.** Stable-elements and
   cyclic/quaternion periodic homology need exact suppliers beyond the current
   transfer API. The finite stabilization proof invokes Sah's algebraically
   closed unstable-to-stable comparison in Hutchinson Corollary 3.9, p.15;
   no exact source theorem or supplier node was verified for it. The new
   `algebraicClosureStabilization` target records its map and naturality.
   Hutchinson's refined finite configuration and torsion-map calculation
   still needs the full proof decomposition carried as an open V.5 input.
   Do not replace any of these by an abstract cyclic-order argument.

These are the unresolved mathematical prerequisites of a roadmap that is
supposed to have no gaps. Changing only their status labels would not fix the
package. Refine the named owners and then revisit the consumer contracts.
Supplier files and packets are outside this issue's edit permissions.

The inherited all-curve relation-equality assertion remains explicitly
conditional on Goncharov Conjecture 1.20. The package promises finite witness
existence, not a synthesis algorithm, and makes no unchecked right-end claim
for the genuine finite-coefficient comparison. Those honest restrictions do
not independently require rejection. Bloch's unverified book attribution is
not used as an input theorem; do not obtain an uncleared copy to close it.

## Source audit

Sources were read from public original/author copies, in their stated
versions. The K-book's combined-PDF page numbers in the package are legitimate:
chapter VI p.23 is combined PDF p.495. Chapter and combined pagination must
not be interchanged. For scan-only papers, the relevant pages were rendered
and read, not inferred from search-result snippets. No source passages are
reproduced in these deliverables.

### Reproducible random sample of 15

Population: the 61 numbered README subsections, in file order.
Sampling: Python `random.Random(10993).sample(population, 15)`. Each sampled
subsection's main claim and relevant locators were checked as follows.

| Subsection | Source actually inspected | Result |
| --- | --- | --- |
| 5.6 | CGZ published author copy, §4.2, pp.406–407, Lemma 4.4; Hutchinson v2, Cor.3.7, p.15 | Distinguished the source's odd-prime/prime-power Cartan calculation from the broader finite-field statement; the latter also uses localized H₃ and the gcd/order test. |
| 3.3 | Weibel VI.5.1, chapter p.23 | Five fractions and admissibility agree; (2,3) gives 2,3,3/2,3/4,1/2. |
| 6.3 | CGZ v3, §6, p.33, root-symbol paragraph | Integral multiple is a cycle; division belongs only in invertible coefficients. |
| 4.11 | Suslin 1991 Lemmas 2.3–2.4, p.222; Weibel VI.5.7–5.8, pp.26–27 | d¹ representative convention checked; missing d³ calculation explicitly retained as a gap. |
| 4.15 | Weibel VI.5.13–5.16, pp.30–32 | Monomial/permutation sequence locators agree; LNM-only proof inputs remain open. |
| 4.1 | Weibel VI Definition 5.5 and Cor.5.5.2, p.25 | Requires acyclic augmented configuration chains, hence infinite X for the identification with group homology. |
| 6.7 | Hutchinson 2024 Thm.2.10, p.4; Levine Thms.4.11–4.12, pp.334–336; CGZ v3 §6, pp.32–33 | Repaired the supplier and gave the general local Chern-isomorphism target; retained the genuine coefficient extension and inverse scalar. |
| 3.12 | Goncharov §1.9, pp.221–225, Cor.1.19 and Conj.1.20 | All-curve rational injectivity is conditional; F₃ disproves the unrestricted version. |
| 3.5 | Weibel VI.5.1, p.23 | Antisymmetric cokernel, boundary order and Matsumoto sequence agree; exterior replacement is invalid integrally. |
| 5.4 | Hutchinson v2 Thm.4.3, p.19; §§6.3–6.4, pp.32–33; Lemma 7.1, p.34 | Finite refined map has its own chain argument; infinite-set contraction cannot be reused. |
| 3.4 | Weibel VI.5.1, p.23 | Reduced generators and five-term quotient agree; F₂=0, F₃=ℤ are retained. |
| 4.9 | Weibel VI Lemma 5.5.1, p.25 | Infinite ordered configurations are augmented acyclic; finite ordered tuples have top homology. |
| 5.2 | Hutchinson v2 Cor.3.6–3.7/Lemma 3.8, pp.14–15, Lemma 3.14, pp.17–18 | Characteristic localization and exceptional primary cases checked, including F₂ and F₃. |
| 4.20 | Weibel VI Thm.5.2, p.23, Cor.5.20/proof, p.34; Suslin 1991 Thm.5.2, p.237 | Natural enhanced Tor kernel agrees; ordinary roots are only a nonnatural abstract model. |
| 4.5 | Suslin 1984 §§2.6–2.7, pp.195–196, Thm.3.4, p.198 | Ordered retraction and unstable SL₂ input distinguished; exact supplier remains open. |

### Inherited unverified-source and proof-boundary audit

The parent and slice gap lists were also checked; absence of the word
“unverified” in the package does not certify their proof inputs.

| Inherited item | Inspection and disposition |
| --- | --- |
| Suslin 1991 not obtained | Read the public scan, especially pp.219–226 and 236–237. The paper is now obtained for this review; not every omitted computation is thereby proved. |
| GL₂ edge kernel | Lemma 2.5 and its chain-homotopy proof, pp.223–224, supply the previously unread argument. |
| Rank-three rotations/cone and ψ′ | Lemmas 3.3–3.4, pp.225–226, checked against the package's cone convention; raw ψ′ is not itself a Bloch cycle. |
| Rogers order-six detector | Suslin pp.219–220 and Zagier Appendix II.1.A, pp.23–24, read. Suslin's shifted period π² is distinguished from the unshifted Rogers period π²/2; c evaluates to −π²/6. |
| Homological stability/frame retraction | Suslin's public Russian 1984 version, §§1–3, pp.188–198, read at the relevant statements and arguments; it supplies the frame direction, not the LNM-only monomial lemmas. |
| Torus/Borel comparison | Weibel VI.5.7–5.8 and Suslin Lemma 2.3, p.222, checked; scalar acyclicity is required, not formal equality of stabilizers. |
| Bloch full-tensor convention | Not read: the library clearance does not authorize that monograph. Removed its status as a verified attribution/input; kept explicit algebraic definitions. |
| Goncharov generic/curve conventions | Public author scan, §§1.8–1.9, pp.218–225, read. Generic five-term presentation and opposite boundary sign are distinguished from the conditional all-curve comparison. |
| Two CGZ versions | v3's exterior target and the published Definition 2.1/Lemma 2.2, p.391, read. The intersection repair belongs to the older version; negative-unit tensors belong to the published one. |
| Integral Chern and characteristic torsion | Read Weibel V.11.11–11.13 and III.7.8 with VI.4.3.2. Their mathematical roles are confirmed; exact full-field supplier closure is still required as above. |
| Degree-zero comparison and closure divisibility | Read the relevant K-book VI.1 and VI.4 discussion and inspected the motivic supplier nodes. Preserve V.2's characteristic-sensitive supplier proof obligations; a diagonal norm-residue statement alone is insufficient. |
| Bass–Tate and Milnor closure divisibility | Read K-book III.7.2 and the corresponding supplier contracts. General theorems already have owners; this review does not certify the unread primary proofs inherited by those owners. |
| Low-dimensional stable homotopy | Checked Weibel VI.5.16–5.20 and current H §§5.42, 6.3, 7.1. Stable stems/unit splitting do not supply the missing Hopf-to-K₁ compatibility. |
| Enhanced Tor/Bockstein/Chern | Suslin pp.236–237 and Weibel VI.5.18–5.20, pp.33–34, read; doubling and the Chern sign are kept distinct. |
| Finite-field stabilization/Sah | Hutchinson Cor.3.9 proof read; Sah publisher access did not provide readable text. Exact theorem/supplier match remains open, explicitly recorded. |
| Finite refined proof | Read Hutchinson §§4, 6–7 at the map, module and chain calculations used here. This does not close the entire inherited refined-complex proof decomposition. |
| Odd coefficients and norm-one Cartan | Published CGZ §4.2–4.3, pp.406–407, and Hutchinson Cor.3.7 checked; q odd and the coefficient coprimality are retained. |
| Finite coefficients versus modulo | Levine 4.12 and Hutchinson 2024 2.10 read; K₂[n] can be nonzero even if K₃/n=0. No right-end compatibility is inferred from abstract isomorphisms. |
| Finite chain synthesis | Quotient surjectivity supplies existence only; no effective chain-construction theorem is claimed. |
| p-adic decomposable quotient | The package uses only unit-denominator tensor specializations; it does not assert the unproved characteristic-coefficient p-adic Milnor quotient theorem from the parent gap list. |

## Current-library and ownership audit

Searched mathematical objects, not only proposed names, in current upstream
roadmaps and Completed roadmaps, including all nine roadmaps newer than the
atlas snapshot and the four listed newer completed roadmaps. Also searched
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, comparing
relevant declarations with the pinned baseline
`f790474821cf4256814db967cb154e7af3d0c369`. The unrelated K3 *surface*
occurrences in IntegralLattices are not algebraic K₃.

| Supplier read | Ownership result |
| --- | --- |
| Mathlib group homology Basic/LowDegree/Functoriality | Actual cycles, boundaries, quotient projection and maps used directly; no replacement bar homology carrier. |
| TauCeti Field/LinearFractional | Affine `crossRatio_comp_eq_of_sub_eq_div` is imported as prior work; the projective orbit/infinity API is a stated extension. |
| TauCeti TensorProduct/Symmetric | `antisymmetricTensors` is a kernel/eigenspace, not the integral cokernel here; both agree only under the stated invertibility hypothesis. |
| Current GroupHomology/Shapiro | `indIso_inv` supplies the explicit inverse Shapiro comparison; no new generic Shapiro target. |
| Current GroupHomology/Transfer/Basic and Trans | `transfer`, `transfer_comp_map_subtype_id`, `map_comp_transfer`, `transfer_trans` supply finite-index transfer, index, coefficient naturality and transitivity with subgroup transport. |
| Current GroupHomology/LongExactSequence | `δ_naturality` supplies connecting-map compatibility for actual short exact representation sequences and the degree relation. |
| AlgebraicTopology Stage 5; StableHomotopyKTheory §§1.17, 1.27 | Integral Künneth (nonnatural splitting), filtered-colimit homology and BG/group comparison are existing suppliers. |
| StableHomotopyKTheory §§3.33, 4.11 | Plus-fibre universal-central-extension comparison and block-sum H-space already planned; local narrow Hopf refinement remains. |
| KTheoryFiniteLocalFields §1.11 | Existing finite odd-q mod-two SL₂ calculation is a special case; the retained prime-to-characteristic integral-localization result is broader and includes q=2,3. |
| ArithmeticKTheory N.4/N.5/N.7 | Cyclotomic w₂ and ambient structures imported; Gaussian computation already appears in N.7. N.8 is a consumer. |
| MotivicEtaleKTheory M.6/M.8 | Operations/normalization scopes inspected separately from the finite Chern isomorphism; the latter is now explicitly local in §6.7. |

No numbered target was removed as a duplicate: the retained projective and
cokernel constructions differ from existing library objects, and the
homological K₃ results are degree-three consumers. The newly identified
existing homology constructions are listed as boundary deferrals, not
replanned in a layer. No upstream or supplier file was changed; no target was
moved to a higher tier. No `FoundationsAndLibraryIntegration` or `UPSTREAM:`
placeholder is used as a mathematical supplier.

## Adversarial mathematical pass

For every row, subgroup inclusion and quotient maps have the displayed domains;
identity/composition APIs refer to those specific maps. Field embeddings are
unital and injective; zero rings occur only in ring-level statements. Finite
field cardinality q=1 is excluded by `Field` nontriviality. Finite field
localizations invert the characteristic. Unused DVR/compactness hypotheses
are not invented for statements about fields or algebraic complexes.

| Statements and APIs | Instances / obstruction tested | Result and change |
| --- | --- | --- |
| Conventions | τ versus −τ, multiplicative −u versus u⁻¹; 3∧(−2) over ℚ | Pairing is −1; named valuation target listed. Root Tate twist is Tor, not the zero tensor of divisible torsion groups. |
| 1.1 plus space and ring maps | Zero ring, ℤ, identity/composite maps | Contractible zero model; ring generality remains associative unital. |
| 1.2 four-equivalence comparison, eval3 | Identity on ℤ; doubling on ℤ/5; zero cycle | Inverting the first equivalence gives 3, not 2; proved examples and named zero detection. |
| 1.3 equality certificates, d₄ | Trivial group; [1|1|1|1]; [g|1|1], g≠1 | d₄ gives the nonzero identity triple; a noncycle cannot be fed to eval3. Named hard controls, proved boundary evaluation. |
| 1.4 finite-stage maps | Empty support; finite union of supports; map composition | A common stage must also contain cycle/equality equations; filtered-colimit supplier identified. |
| 1.5 cover/Hopf/minus-one | Zero ring; K(ℤ,2), K(ℤ,3); characteristic two; ℤ/48→ℤ/24 | Cover assumptions retained; minus-one scalar vanishes in characteristic two; Hopf supplier gaps exposed. |
| 2.1 Milnor map and cokernel | F_q; ℚ; positive complex rank | Indecomposable does not mean torsion-free; {−1,−1,−1} survives over ℚ. |
| 2.2 motivic edge/injectivity | Characteristic two; +2 integral Chern; real fields | Quotient edge does not require Milnor injectivity; torsion divisibility cannot prove it. Marked exact missing inputs. |
| 2.3 real basis/signatures | No real places; one real place; restriction | Empty basis gives zero; all-negative triple gives 1, not a doubled sign. |
| 2.4 totally imaginary/stable H₃ | ℚ versus ℚ(i); general field versus number field | Canonical quotient equivalence requires r₁=0; stable Hurewicz has the stated minus-one kernel. |
| 2.5 rationalization | ℚ and ℚ(i) | Torsion disappears, ranks 0 and 1 remain; does not recover the integral quotient. |
| 3.1 tensor cokernel APIs | ℤ, ℤ/2, ℤ/3; 2 invertible or not; n=0 | Diagonal ℤ/2 survives for ℤ and ℤ/2; eigenspace/exterior replacements fail there. |
| 3.2 cross-ratio/orbits/faces | Infinity; F₂; F₃; tuple (0,∞,1,2,3) | Denominators nonzero by distinctness; swap gives inverse; normalized faces agree. |
| 3.3 admissibility/five terms | x=y, x=0, y=1; (2,3) over ℚ | Invalid pairs rejected; reflected relation gives c-independence; proved fraction example. |
| 3.4 pre-Bloch quotient/maps | F₂, F₃, F₅ | Zero, free ℤ, cyclic ℤ/6 respectively; degenerate symbols are conventions, not extra free generators. |
| 3.5 boundary/Bloch/Matsumoto | F₅; ℚ valuation; unit 1 | Boundary order fixed; antisymmetric diagonal may be nonzero. |
| 3.6 c/inversion/torsion | F₂/F₃ excluded where needed; F₅ and F₇ | h(u) need not lie in B; c and inversion have different torsion behavior. |
| 3.7 small fields | F₂, F₃, F₄, F₅, F₇, F₁₁ | Independent relation-matrix checks agree; large-field order formulas not applied at q=2,3. |
| 3.8 exterior comparison | Cyclic units; ℂ; ⟨2⟩ over ℚ | F₅ exterior Bloch differs from Suslin Bloch; two-divisibility repairs diagonal loss. |
| 3.9 lecture free kernel/maps | F₂, F₃; R(2,3) over F₅; 4[−1] over ℚ | Relation subgroup not contained in raw kernel; raw comparison has infinite kernel. Attribution corrected. |
| 3.10 lecture obstruction | F₂/F₃; F₅; sixfold lift γ | Quotient by raw kernel is essential; six annihilates the cokernel, not the free kernel. |
| 3.11 generic configuration | No injective five-tuples in F₂/F₃ | Generic presentation agrees with ordinary five-term quotient; boundary changes sign. |
| 3.12 all-curve specialization | Smooth-point DVR; F₃ versus ≥4 | Rational kernel can be ℚ at F₃; conjectural vanishing remains conditional. |
| 3.13 older CGZ/exterior | ξ₂,₁ over ℚ; forbidden 0/0; diagonal relation | Nonzero exterior boundary forces intersection repair; projective arithmetic explicitly restricts admissibility. |
| 3.14 negative tensors | F₅; u versus −u; ℚ exterior detector | Q_neg can be zero while Q_s=ℤ/2; no general projection onto the exterior square asserted. |
| 3.15 published projective quotient | F₂/F₃/F₅/F₁₁; [0],[1],[∞] | Relation subgroup really lies in the negative-target kernel; P/H model restricted to ≥4. |
| 3.16 exact convention maps | F₅/F₇/F₁₁; n=1,2,3; characteristic two | Published comparison surjective only in stated range; odd coefficients kill two-primary correction, not all-curve kernel. |
| 4.1 hyperhomology | C=0; C=M[0]; G=1; two-point X | General target retained; finite X does not give ordinary group homology. |
| 4.2 independent frames | Rank 0/1; repeated/dependent vectors; infinite F | Independence, not merely distinctness, controls the frame complex; stable range hypotheses retained. |
| 4.3 scalar/affine acyclicity | Trivial module; finite F versus infinite F | Scalar choice requires the infinite-field setting; Borel comparison is not a subgroup identity. |
| 4.4 frame coinvariants/products | n=1, n=2; zero/unit entries | Top boundary and ordered product must retain the Steinberg relation and unit conventions. |
| 4.5 connecting/retraction θ | n=1; {a,1−a,b}; real all-negative triple | Correct normalization does not multiply by 2; unstable rank-two supplier gap identified. |
| 4.6 frame algebra splitting | n=2; multiplication by e; intersection | No use of e-injectivity before simultaneous stability induction; circular proof avoided. |
| 4.7 diagonal/monomial groups | Rank 0/1; identity permutations; block stabilization | Semidirect product projection and inclusions have matching directions. |
| 4.8 stability | r=n and r=n−1; infinite versus finite fields | Stable range not extended one rank too early; finite branch remains separate. |
| 4.9 ordered configuration complex | Two- and three-point sets; repeated tuples | H₁ for two points has rank 1; three-point top H₂ has rank 2. Repetitions excluded, not permutation signs. |
| 4.10 projective coinvariants | Degrees 0–3; F₂/F₃ versus infinite F | P(F) is a homology group of coinvariants, not the free E¹ term. |
| 4.11 rank-two spectral sequence | (∞,0) boundary; (a,1); mixed H₁⊗H₁ | d¹=1−σ with those representatives; mixed swap is negative. d³ calculation remains open. |
| 4.12 ψGL₂ | Free quadruple versus homology class; [2] over ℚ | Edge lands in B only after killing d³; kernel proof read in Suslin pp.223–224. |
| 4.13 rotations/cone | Rotation period; cone endpoint; degenerate tuples | Chain/cone sign pinned by chosen conventions; no freely interchangeable cone orientation. |
| 4.14 rank-three comparison | Normalized tuple; five rotations; field embedding | Raw ψ′([a;x])=[a] need not be in B; cone correction is −2c for this convention. |
| 4.15 permutation/monomial sequence | x=0,±1 excluded; 3-primary c; two-primary part | Corrected exercise formula already retained; separate LNM proof inputs exposed. |
| 4.16 monomial π₃ quotient | Unit summand; η³; product image | Quotient is by decomposable products; stable quotient ℤ/12, not full stem ℤ/24. |
| 4.17 cyclic Chern/doubling | C₇ power-two map; inversion; order two | H₃ power map has weight a², giving 4, not 2; δ doubling and c₂ sign kept separate. |
| 4.18 closure detector | Algebraically closed field; torsion versus free part | e-invariant used only on torsion; ordinary tensor of divisible roots is not μ(2). |
| 4.19 enhanced Tor/roots | Characteristic two; even finite roots; infinite μ | Enhanced extension doubles finite even order; abstract root identification is not natural. Infinite-order wording fixed. |
| 4.20 Suslin exact sequence | ℚ; ℝ; algebraically closed field; finite fields excluded | Enhanced term remains; naturality uses the actual comparison and closure detector, not cyclic orders. |
| 5.1 finite K₃ quotient/maps | q=2,3; extension degree 1; Frobenius | Milnor group zero; transferred L.1 maps retain weight q² and restriction/transfer identities. |
| 5.2 unstable SL₂ H₃ | q=2,3,4; characteristic primary part | Localized cyclic group has order q²−1; integral group can have extra characteristic torsion. |
| 5.3 finite stabilization | q=2,3; closure colimit; actual Hurewicz | Inverse stable Hurewicz needs K₂=0; Sah input and naturality remain open. |
| 5.4 finite refined map | q=4,5; refined versus ordinary symbols | Uses its own complex/torsion map; infinite contracting homotopy is unavailable. |
| 5.5 finite Bloch exact sequence | q=2,3 excluded; q=4,5,7,11 | Orders agree with presentations in the valid range; canonical b_F uses σ_F inverse, not chosen generators. |
| 5.6 odd coefficients/Cartan | q odd/even; n=1; gcd(n,q²−1); μ_n | Norm-one torus requires q odd and n|(q+1); even q not silently included. |
| 5.7 arithmetic quotients | ℚ; ℚ(i); no canonical free generator | ℚ quotient has order 24 and no section; Gaussian ambient input mapped to N.4/N.5/N.7. |
| 5.8 real Rogers | x=1/2,2,−1; c=[2]+[−1] | Shifted values give ρ(c)=−π²/6 of order 6 modulo π²; Bloch–Wigner cannot detect it. |
| 6.1 five-term certificates | Zero certificate; one relation; negative coefficients | Equality checked in actual free presentation; finite support does not decide all equalities. |
| 6.2 zero-boundary certificates | Zero; F₅ raw relation; noncycle | Boundary witness is additional data, not inferred from a formal symbol sum. |
| 6.3 root multiples | m=0/1 generic helper; genuine roots m≥2 | Underlying integral element is m[x]; no division in ℤ. Proved scalar and zero controls. |
| 6.4 root coefficients | m=2 over ℤ/5; zero symbol; 2ℤ⊂ℤ tensor ℤ/2 | Inverse is 3; flatness not assumed; nonflat kernel target and unit failure explicit. |
| 6.5 lift torsors/bar witnesses | ℤ/24→ℤ/6; trivial G; nonzero boundary | Four lifts, no additive section; nonzero fibre empty for trivial G; witnesses differ by boundaries. |
| 6.6 coefficient exports | ℚ; odd n; n divisible by 2/3 | Rationalization/ordinary modulo do not give genuine finite coefficients; exact correction primes retained. |
| 6.7 finite Chern/Φ | n=1; char divides n excluded; c=2,r=3 on ℤ/5; ℚ,n=5 | Φ=4 on 1; scalar is inverted; tame residue 2 mod31 has exact order 5. General local Chern target added; no unverified right-end equality. |

## Lean signature audit and validation

The file has 401 lines, 22 theorem targets and 19 proved examples. All retained
light definitions have real bodies over pinned carriers; missing heavier
objects are recorded in the closing comment and fully specified in the README.
No `True` or admitted `Prop` carrier replaces mathematics. The import is
`Mathlib`; no Tau Ceti import is needed for the retained representative carriers.

| Signature inspected | README agreement / negative control |
| --- | --- |
| `K3Homological.comparison_apply` | Four actual additive equivalences; reverses q and j in the stated order. |
| `comparison_eq_zero` | Arbitrary additive groups, zero detection follows from the equivalence, not an extra conclusion hypothesis. |
| `eval3_eq_iff_certificate` | Actual integral cycles, actual homology projection, z−z′ and a finite degree-four chain. |
| `eval3_surjective` | Actual supplied comparison equivalence; no false assertion for an arbitrary homology map. |
| `bar_four_identity_boundary`, `bar_noncycle` | Unnormalised complex; noncycle requires g≠1. |
| `Symbols.fiveTermRaw_oneSub` | Both admissibility hypotheses present; reflected order is (1−y,1−x). |
| `cyclic_seven_power_two` | Coefficient morphism explicitly identified with the identity linear map; power-two H₃ scalar is four. |
| `finite_sl2_localized_homology` | Every finite field, actual prime characteristic and localization; asserts Nonempty equivalence, not a natural generator. |
| `rootCoefficient_toPre` | General commutative R and specified unit m; uses tensor map of the kernel inclusion, no flatness. |
| `rootCoefficient_denominator_independent` | Both annihilation witnesses and both invertible denominators included. |
| `SuslinLift.unique_difference` | Inclusion injective and image exactly the zero fibre; no section/surjectivity conclusion smuggled into assumptions. |
| `BarLiftCertificate.exists_of_surjective` | Actual linear homology map with surjectivity; output existence only. |
| `BarLiftCertificate.trivial_nonzero` | Trivial G and β≠0 are both explicit. |
| `finiteCoefficientBlochEquiv_spec` | Φ=r⁻¹c; inverse=c⁻¹r, not the reverse order. |
| `finiteCoefficientBlochEquiv_on_quotient` | Generic homomorphisms j_K,j_B and commuting scalar hypotheses suffice; inverse unit γ⁻¹ retained, including degenerate coefficient ring. |

Validation performed on the final deliverables:

- `lean-check research/blueprint/packages/K3BlochGroups/Suggested.lean`:
  exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the
  pinned Tau Ceti environment. Only the 22 expected theorem `sorry` warnings;
  every `example` is proved. Available memory was 75 GiB before the final run;
  no Lean server or package build was started.
- `python3 scripts/check_blueprint.py` on the parent and each V.1–V.6 packet:
  all seven report 0 errors and 0 warnings; packets unchanged.
- Independent scratch computations used integer elementary row/column
  operations on the five-term relation matrices. They give P(F₂)=0,
  P(F₃)=ℤ, and cyclic P(F₄),P(F₅),P(F₇),P(F₁₁) of orders 5,6,8,12.
  They also check the two-/three-point ordered-complex ranks and the exact
  order-five tame residue 2 mod31. These are finite numerical controls, not
  substitutes for the general theorems or Lean proofs.
- Intake `check-files` on the four changed deliverables: 0 problems.
- `git diff --check`: passed. No packet, supplier, upstream, source document
  or unrelated repository file changed.

No separate handoff file is needed: the numbered defects above identify the
exact statements, owners and source locations a subsequent fix must address.
