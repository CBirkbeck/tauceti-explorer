# Kaletha (2016): rigid inner forms of real and p-adic groups, extraction and routing

Issue [#1190](https://github.com/CBirkbeck/tauceti-explorer/issues/1190). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints (codex-a71f92, codex-c83e7a), whose report follows below as history.
- **The paper.** T. Kaletha, *Rigid inner forms of real and p-adic groups*, Ann. of Math. 184 (2016), 559–632.
  - The published PDF (SHA-256 55fc2ed2…) and the author's errata (errata.pdf, SHA-256 31e5f2d4…) were re-fetched, and both hashes match the checkpoint.
  - Errata §3, which covers this paper, was re-read in full.
- **Items.** The result has **157 items: 21 library, 24 planned and 112 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Fifteen are recorded under `sourceIssues`. E01–E06 follow the author's errata and keep `known` values that name it.

## This continuation (cc-442dc5)

**Items.**
- Fact 5.1 was the one numbered statement without an item. It is now T45: automorphisms of a rigid inner twist are inner by G′(F).
- D20 cited a "Definition 5.1" that does not exist; its locator is now §5.1.
- T21 now names Fact 4.3.

**Findings rechecked.**
- **E07.** The §3.4 claim that H^1 → H^1_ab is an isomorphism whenever H^1(Γ, G_sc) = 1 is false. The equivalence relation divides by Z^1(Γ, G1_sc) for the twist G1, and H^1(R, SU(2)) ≠ 1 although H^1(R, SL2) = 1. The two cases the paper names, p-adic F and tori, are unaffected.
- **E05.** Corollary 5.4, corrected in the author's errata, is the other finding that affects a stated result.

**Reclassified to affect nothing.**
- **E08.** A degree slip in a cochain computation.
- **E10.** An expository remark that no argument uses.
- **E11.** "Unit circle" should be C^×. The factor is normalized straight afterwards.
- **E12 and E13.** Slips in recalling Shelstad's Cayley construction. The intended forms are s_α·Ad(φ(σ))(s_α)^(−1) = s_α² and a product over one root from each ± pair, as in [She82, p. 423]; the text's own "nonproportional" signals the latter.

**Gaps.**
- GAP03 is recorded as findings.
- The others are deferred as cited suppliers' proofs, design work or review.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E01** (gap; affects the proof), Proposition3.6,printed574–575;published74-page version. *Printed:* a *Correction:* Replace the connected/abelian-only surjectivity argument by the author’s direct cocycle lift for arbitrary affine G.
- **E02** (error; affects the proof), §4.4 beforeLemma4.4,printed582;published74-page version. *Printed:* ζ_k *Correction:* Choose lifts of the already chosen Weil section first; define zeta_k as their projections, and then extend the next section using the coset product.
- **E03** (gap; affects the proof), Formula(4.8),printed584;published74-page version. *Printed:* p *Correction:* Extend p and delta_e to the quotient tori Res Gm/Gm before evaluating the displayed non-torsion cochains.
- **E04** (gap; affects the proof), ProofLemma4.7,printed586;published74-page version. *Printed:* ϕ_(λ̄,k) *Correction:* Extend phi_(lambdabar,k) from u_k to Res_(E_k/F)Gm/Gm with target S by the product of the conjugate n_k*lambdabar cocharacters.
- **E05** (error; affects a stated result), Corollary5.4,printed598;published74-page version. *Printed:* H¹(u→W,Z→G) *Correction:* Use H1_ab for the left factor when claiming trivial left kernel; pull back to full H1 only as a pairing constant on K-groups.
- **E06** (misprint; affects the proof), §5.6 before(5.13),printed615;also embedding discussion printed594. *Printed:* g⁻¹z(w)w(g) *Correction:* Apply eta_w^-1 to this cocycle when defining the invariant in H1rig of the abstract parameter torus S; use the analogous eta^-1 in the general embedding construction.
- **E07** (error; affects a stated result), §3.4,printed577;arXivv5 andauthor ri4 PDF16. *Printed:* H¹(Γ,G_sc)=1 *Correction:* Require H1(F,Gprime_sc)=1 for every inner twist occurring in the equivalence fibers. The claimed conclusion remains valid for p-adic F and for tori.
- **E08** (misprint; affects nothing), ProofLemma4.5,printed584 final display;rendered publishedPDF26. *Printed:* C²(Γ,S_E/F); =p(ξ_(k+1)) *Correction:* The calculation is in C1, and its last equality to p(xi_(k+1)) must be removed. After differentiating, the xi term occurs in the next coboundary calculation.
- **E09** (misprint; affects nothing), ProofTheorem4.11 diagram,printed590;rendered publishedPDF32. *Printed:* H¹_sc *Correction:* Use H1_ab in the published diagram.
- **E10** (error; affects nothing), §5.1,printed592;arXivv5 andauthor ri4 PDF29. *Printed:* an infinite set *Correction:* Say that the all-Z fibers may become infinite, not that they always do.
- **E11** (error; affects nothing), §5.3,printed600;arXivv5 andauthor ri4 PDF36. *Printed:* unit circle *Correction:* The stated ratio condition determines an absolute factor up to C units. Restrict the ambiguity to the unit circle only after imposing a modulus normalization.
- **E12** (misprint; affects nothing), §5.6 Cayley calculation,printed616;rendered publishedPDF58;author/arXivPDF49. *Printed:* s_α Ad(φ(j))(s_α)=s_α² *Correction:* Use s_alpha Ad(phi(j))(s_alpha)^-1=s_alpha². Its IMAGE in the Weyl group is the reflection; the representative itself may have order4.
- **E13** (misprint; affects nothing), §5.6 Cayley product,printed616;rendered publishedPDF58;author/arXivPDF49. *Printed:* ∏_(α∈Δ_φ^∨) s_α *Correction:* Take a product over a positive subsystem, equivalently one root from each opposite pair, as in Shelstad1982 printed423.
- **E14** (misprint; affects nothing), ProofProposition5.6,printed605,relative cochain formula;published text. *Printed:* σ(g) *Correction:* Use sigma(g_i) in each cochain indexed by i.
- **E15** (misprint; affects nothing), §5.7,printed626,local refined datum;rendered publishedPDF68;author ri4 PDF57. *Printed:* Z(Ĝ_sc) *Correction:* Use Z(Gsc), the physical finite central subgroup used by the local rigidifications.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **GAP01, Declaration-sized and recursive closure** (deferred). Every numbered statement is now an item (Fact 5.1 added as T45; the locators of D20 and T21 fixed). Declaration-sized splitting of bundled interfaces is design work.
- **GAP02, Continuous profinite and local duality suppliers** (deferred). Finite local duality, norm existence and the relative Weil transfer are cited suppliers' proofs.
- **GAP03, Explicit cochain proof closure** (recorded). The paper's own cochain slips are E01–E04 and E08. The elementary derivations the source leaves to the reader are implementation work.
- **GAP04, Reductive cohomology and relevance** (deferred). Kneser, Kottwitz, Borovoi and Arthur inputs are cited suppliers' proofs.
- **GAP05, Full real classification and transfer corpus** (deferred). Langlands, Shelstad and Kostant–Vogan inputs are cited suppliers' proofs; E12 and E13 record the recollection of Shelstad's Cayley construction.
- **GAP06, Global original-source extraction** (deferred). The global theory is in Kal15b, a separate paper; the global multiplicity formula is Conjecture 5.11.
- **GAP07, Independent source-finding review** (deferred). Independent review of the findings is the review pipeline's job, not the extraction's.
- **GAP08, Design and Lean checks** (deferred). Design and Lean are later work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every `dependsOn` target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of E08 or E10–E13, this continuation supersedes it.

## Kaletha: compact coefficients and profinite extensions

Codex — codex-c83e7a, 23 September 2026. Refs #1190. Continues [PR #1968](https://github.com/CBirkbeck/tauceti-explorer/pull/1968). **Partial**: the remaining original-source, cochain and implementation obligations are stated below. No formalization is claimed.

This continuation supplies the precise inverse-limit hypotheses behind Theorem 3.1 and the continuous extension classification used in §3.2. It reuses the pinned profinite quotient sections, factor-set extension and degree-one inflation–restriction theorem. A direct contraction proof of deep-unit powers supplies the finite local H¹ input without importing local reciprocity into the duality layer.

The extraction now has **156 items: 21 library, 24 planned and 111 missing**. The 59 definitions and constructions have 177 API contracts, 177 proposed tests and concrete uses. There are 336 internal prerequisite edges and one external stage edge; the internal graph is acyclic. Every missing item has exactly one route. All 142 inherited IDs, 168 API names, 168 test names, seven routes and 15 unreviewed source findings are preserved.

### Source scope

The earlier complete reading of the [published 74-page paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p06-p.pdf), pp559–632, remains the primary extraction. This continuation freshly reread pp566–575, including all of §§3.1–3.2 and the first §3.3 proofs. It does not claim another complete reading. The current [author errata](https://www.math.uni-bonn.de/people/kaletha/errata.pdf), §3 on PDF pages6–7, was fetched and reread; its SHA256 is unchanged from the preceding checkpoint. All 15 source findings retain their previous content and unreviewed status.

The new original source is [Neukirch–Schmidt–Wingberg, corrected electronic second edition, version2.3](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf?download=1). The exact acquisition hash and scopes appear below. Read in full were II §7 through Theorem2.7.7, pp136–143; the referenced Schreier proof1.2.4, pp17–20; and I §1, pp5–11, including exercise4 on continuous quotient sections. Local pp375–384 were also read, including the finiteness and duality statements and proofs. The book as a whole was not read. The unqueried PDF URL redirected to HTML; the query link supplied the verified PDF.

### The inverse-limit obstruction

For a countable tower of abelian groups B_n with maps f_n:B_(n+1)→B_n, put

    Δ((x_n))_n = x_n − f_n(x_(n+1)).

The ordinary kernel is lim B_n, and the ordinary cokernel is lim¹ B_n. Products are exact in abelian groups, so the snake lemma gives the six-term sequence for a short exact sequence of towers. NSW2.7.4 identifies this cokernel with the derived limit and proves that higher derived limits vanish for this index category. These are ordinary abelian-group quotients; no topological closure is inserted.

If all transitions are surjective, solve Δx=y recursively: choose x_0, then lift x_n−y_n to x_(n+1). For a Mittag–Leffler tower pass to its stable images B′_n. Their transitions are surjective, and B″_n=B_n/B′_n is ML-zero. On B″ the coordinatewise finite telescoping sum Σ_(j≥n) f_(n,j)y_j inverts Δ. Lift that solution to B, then correct its error using the surjective system B′. This proves lim¹=0. A tower of finite groups is Mittag–Leffler even when its original maps are not surjective.

For profinite G and a countable tower of finite discrete continuous G-modules A_n with **surjective** maps, continuous cochains into A=lim A_n are the compatible coordinate cochains. The existing discrete-target lifting theorem makes every map on cochains surjective. Hence there is a short exact sequence of ordinary complexes

    0 → C•(G,A) → ∏ C•(G,A_n) →Δ ∏ C•(G,A_n) → 0.

Ordinary cohomology commutes with these products: cycles are coordinatewise cycles and primitives for a tuple of boundaries can be chosen coordinatewise. The long exact sequence therefore gives, for q≥1,

    0 → lim¹ H^(q−1)(G,A_n) → H^q_cts(G,A)
      → lim H^q(G,A_n) → 0.

For arbitrary finite coefficient towers, replace A_n by its stable image A′_n. The quotient coefficient tower is ML-zero, uniformly in all cochain degrees. Its cohomology towers are consequently ML-zero. The cohomology exact sequence and the six-term limit sequence identify both lim and lim¹ for the original and stable-image systems. This removes the surjectivity hypothesis, as in NSW2.7.5.

The finite group that kills the obstruction in degree q is **H^(q−1)**. Degree one needs no extra hypothesis because A_n^G is finite. The existing [CHT item154](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/papers/PAPER-CADORET-HUI-TAMAGAWA-17.result.json) already supplies this degree-one case at the same ArithmeticGaloisDuality:R02.1 owner, by a direct finite-fibre proof. Degree two needs finite H¹ at the finite levels. That input holds for the local fields in Kaletha’s theorem by P23; it does not follow from finite coefficients for an arbitrary profinite group.

The continuous cochain complex remains the existing canonical one. The usual homogeneous/inhomogeneous formulas are given in P21. The typed comparison of its underlying cohomology group with the explicit carrier is implementation work, and no homeomorphism with a pointwise quotient topology is asserted.

Two boundaries are useful. For G=∏ C2 with trivial C2 coefficients, the coordinate characters already give an infinite H¹, despite finite coefficients. For the tower Z←×2 Z, lim=0 and lim¹=Z2/Z. The alternating binary sequence (1,0,1,0,…) represents −1/3 in Z2 and hence a nonzero quotient class. A hypothetical integral solution of Δx=y would make 3x_0+1 divisible by every power of2, forcing x_0=−1/3. Every finite truncation is solvable, so finite enumeration alone cannot settle this infinite obstruction.

### The local finiteness input

The [ClassFieldTheory Layer5](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ClassFieldTheory/README.md) owner explicitly keeps local duality independent of reciprocity. NSW’s full duality proof uses reciprocity, so this continuation supplies a smaller degree-one argument compatible with that order.

First let K/Qp be finite, pi a uniformizer and n≥1. If u=1+n²*pi*a with a integral, expand

    P(Y) = ((1+n*pi*Y)^n − u)/(n²*pi) = Y − a + pi*Q(Y).

Here Q has integral coefficients: the degree-j coefficient of P for j≥2 is binomial(n,j)n^(j−2)pi^(j−1). Integral polynomials are 1-Lipschitz on the valuation ring, by factoring y^j−z^j. The iteration y_(r+1)=a−pi*Q(y_r), starting at zero, has successive differences whose valuations increase at every step. Completeness gives a root of P, and x=1+n*pi*y satisfies x^n=u.

Thus U^(2v(n)+1) is contained in the n-th powers, including when p divides n. The power subgroup is open. Compactness gives a finite quotient of the unit group by its n-th powers, and the valuation quotient is Z/nZ; therefore K×/(K×)^n is finite. This sufficient depth does not assert the sharp cardinality formula already planned by LocalFieldsRamification Layer1. In equal characteristic p the conclusion fails at n=p: arbitrarily deep 1+t^m with p not dividing m are not p-th powers in Fp((t)).

For a finite G_F-module M, choose a finite Galois K/F splitting its action and containing the roots of unity of its exponent. Over K it is a finite sum of mu_d modules. Kummer theory and the preceding finiteness give finite H¹(K,M). The **already-built** degree-one inflation–restriction exactness then gives finite H¹(F,M): its kernel comes from cohomology of a finite group with finite coefficients, and its image is contained in finite H¹(K,M). For F=R, all finite-coefficient cochain groups of C2 are finite directly. This establishes precisely the hypothesis used in the degree-two limit comparison, without the full Hochschild–Serre spectral sequence.

### Profinite Schreier theory on the existing carrier

Tau Ceti already constructs the algebraic factor-set extension and proves its abstract classification. It also already supplies normalized continuous sections E/H→E for a closed subgroup H of a profinite group. The new interfaces add the topology and continuous coboundary witnesses.

For continuous normalized c:G×G→A, place the product topology on the existing FactorSet.Extension. Multiplication and inverse are continuous by their explicit formulas; compactness, Hausdorffness and total disconnectedness come from A×G. Inclusion is a closed embedding, projection is an open quotient and the canonical section is continuous.

Conversely, in a profinite extension, identify A with its closed image and identify E/A with G by the compact-to-Hausdorff continuous bijection. The pinned section theorem produces s. Its factor set s(g)s(h)s(gh)⁻¹ is continuous into A and represents the extension. A change s′=b·s changes the factor set by +db in additive notation.

For c′=c−db, the extension equivalence E_c→E_c′ is

    (a,g) ↦ (a+b(g),g).

The existing algebraic rescaleEquiv supplies this map; continuity of b makes both directions continuous. Conversely a continuous extension equivalence supplies a continuous b. Equality in abstract H² alone would not supply that witness. Normalization uses the continuous constant-cochain correction. These constructions give NSW2.7.7, including the equivalence between zero class and continuous group-theoretic splitting.

An automorphism fixing A and G has the same form with b a continuous one-cocycle. Conjugation by a_0∈A gives b(g)=a_0−g·a_0. Its kernel is A^G and the quotient of all extension automorphisms by these inner automorphisms is H¹_cts(G,A). Thus Kaletha’s H¹(Gamma,u)=0 makes every such automorphism inner; the conjugating element is determined modulo u^Gamma, not uniquely. Raw cocycles still do not acquire a canonical identification between extension realizations.

### Library and ownership evidence

Freshly read pinned statements include:

- [Normalized continuous sections](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/Section.lean#L226), including the more general quotient projection.
- [FactorSet.Extension and its groupExtension](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean#L155), with the inverse, section and rescaling formulas.
- [Continuous discrete-target cochain lifts](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean#L154).
- [Degree-one inflation–restriction exactness](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L336).
- [Mathlib’s finite-image Mittag–Leffler theorem](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean#L230) and its stable-image API.

The reviewed coverage for ArithmeticGaloisDuality R02.1/D7, ProfiniteCohomology Layer0, ClassFieldTheory Layer5 and the relevant LocalFieldsRamification Layer1 targets was read before assigning statuses. The new limit interfaces refine the existing R02.1 plan. The three new missing profinite extension interfaces use its existing source route. Local finite H¹ and power classes import their existing upstream stages. No new roadmap or duplicate continuous cohomology carrier is proposed.

### Main theorem context retained from the earlier extraction

| Scope | Result | Status in this source |
|---|---|---|
| R or finite extensions of Qp; finite central Z in affine G | Rigid H1, finiteness and surjectivity to ordinary H1(G/Z), including disconnected G after the author correction | Proved |
| Connected reductive G | Enlarged Tate–Nakayama for H1_ab, plus dual-component pairing | Proved; full real H1 is not generally the abelianized group |
| All rigid real forms | Equivalence with strong real forms | Proved |
| Every real tempered parameter | Compound-packet bijection, stability and normalized endoscopic character identities | Proved using Langlands and Shelstad |
| Arbitrary p-adic reductive G | The corresponding refined packet description and identities | Conjectural; the SL2 example has its separate known classification |
| Number-field overview with its stated simply-connected-derived hypothesis | Adelic product of normalized geometric transfer factors and Arthur globalization input | Unconditional external theorem |
| Global packets and their product character | Requires local refined packets and the conjectural global Langlands group | Conditional |
| Automorphic multiplicity,Conjecture5.11 | Sum of invariant dimensions of global packet labels | Conjectural |

For local cohomology, u is the inverse limit of the finite multiplicative quotients `Res_(E/F) mu_n / mu_n`. Its continuous H1 vanishes; its H2 is Zhat in the p-adic case and C2 over R. The canonical class is **negative one**. The extension W realizing that class is a rigid Galois extension, distinct from the local Weil group W_F. The coefficient points G(Fbar) have the discrete topology even though u and W are profinite. The restriction of a W-cocycle to u must be algebraic and central.

The torus lattice is `Ybar/IY`, with `Y=X_*(S)` inside `Ybar=X_*(S/Z)`. Its torsion subgroup classifies rigid torus cohomology. Replacing the denominator with `IYbar` loses information: for the real norm-one torus with Z=mu_n, the correct group is C_(2n). Reductive duality first passes to a coroot quotient and then to **abelianized** rigid cohomology. Equivalence uses the simply connected cover of the cocycle-twisted group. Untwisted H1 vanishing alone is insufficient over R.

The ordinary transfer-factor package receives a rigid character correction. The unprimed convention uses the inverse character; the prime convention used by the real character identity uses the positive character. Testing only real order-two characters hides this difference, so the diagnostic uses an order-three character as well. A relative-ratio identity alone does not fix the modulus of an absolute factor.

### Proof architecture and ownership

The cohomology chain runs from finite local duality and continuous inverse-limit comparisons, through u and its canonical extension, to the explicit enlarged Tate–Nakayama map. The unbalanced cup operation is a reusable cochain construction under ArithmeticGaloisDuality. It is not a new private copy of ordinary Tate cohomology. Weil sections must be chosen in the corrected order, and finite maps must be extended to quotient tori before evaluating the root-extracted cochains.

The real chain starts with discrete-series parameter tori and admissible embeddings, then reduces a general tempered parameter through its minimal cuspidal Levi and R-group roots. Positive-root Cayley transforms lead to limit-discrete series. Noncompact imaginary-root conditions become parity conditions in torus cohomology. The exact component sequence then gives the packet labels, and Shelstad spectral transfer supplies the character identity. The ordinary analytic representation and transfer foundations are imported; their existence does not by itself prove the classification.

One continuation, `EndoscopicTransferRigidInnerFormsPartII`, owns the rigid gerbe, refined data and full real packet theorem, with a later global rigid interface. Its parent’s ET.0 and ET.1 continue to own ordinary conjugacy, ordinary Tate–Nakayama, z-pairs, transfer factors and global products. The existing `EndoscopicTransferAndUnitaryTraceComparisonPartII` candidate from Groechenig–Wyss–Ziegler is geometric stabilization through p-adic integration; its full brief was inspected and is a different direction. These candidate identifiers are not existing stages.

#### Route 1: ReductiveGroupsPartII

`source` → `ReductiveGroupsPartII`. Reuse Weil restriction, multiplicative-type quotients, dual groups and central isogenies. Add the precise augmentation and coroot-coinvariant adapters as source contracts; do not rebuild the pinned torus and lattice carriers.

Existing stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.5`.

Items: P09, P14, P15.

#### Route 2: ArithmeticGaloisDuality

`source` → `ArithmeticGaloisDuality`. The existing compact-coefficient, Hochschild–Serre and Tate-duality owner supplies the generic cochain comparisons. Place the new reusable unbalanced cochain product and its Leibniz proof here. Import ordinary finite local duality and real Brauer invariants from ClassFieldTheory; no second Poitou–Tate or continuous-cohomology carrier.

Existing stages: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `ArithmeticGaloisDuality:D7`.

Items: P03, P04, P06, D14, T21, T22.

#### Route 3: EndoscopicTransferAndUnitaryTraceComparison

`source` → `EndoscopicTransferAndUnitaryTraceComparison`. Ordinary nonabelian H1, fundamental tori, abelianization, stable conjugacy, ordinary endoscopic data, z-pairs and the torus-complex transfer comparison are already in ET.0. The rigid gerbe and refined real packets are the separate continuation below.

Existing stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Items: P10, P11, P12, P13, D30, D34.

#### Route 4: EndoscopicTransferAndUnitaryTraceComparison

`source` → `EndoscopicTransferAndUnitaryTraceComparison`. ET.1 already owns absolute normalizations, conventions, central extension transport and the global product formula. Add the rigid correction, its two convention signs, its relative-factor proof and the global rigid product/globalization adapters here; the full real packet classification remains in the continuation.

Existing stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Items: D32, D33, T51, T52, D36, G05, G09.

#### Route 5: AutomorphicFormsOnReductiveGroups

`source` → `AutomorphicFormsOnReductiveGroups`. Use the existing real admissible (g,K)-module, globalization and character foundation. The real local Langlands and Shelstad packet theorems are additional results, not credited to this basic representation stage.

Existing stages: `AutomorphicFormsOnReductiveGroups:AF.1`.

Items: P16, P18.

#### Route 6: SmoothRepresentationsOfLocalGroups

`source` → `SmoothRepresentationsOfLocalGroups`. Reuse smooth admissible complex representations, normalized induction and temperedness for the p-adic conjecture and SL2 example; no second representation category is proposed.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Items: P17.

#### Route 7: Endoscopic transfer and unitary trace comparison, Part II: rigid inner forms and real tempered packets

`part-ii` → `EndoscopicTransferRigidInnerFormsPartII`. ET.0–1 own ordinary cohomological and transfer foundations but the existing endpoint is a unitary stable trace comparison, not the universal rigid gerbe or all real tempered packets. The existing GWZ20-B candidate EndoscopicTransferAndUnitaryTraceComparisonPartII is geometric stabilization via p-adic integration; its full brief was read and is a distinct lane. One rigid continuation owns the shared local/global rigid carriers and exports them to existing transfer layers.

First prerequisite: `EndoscopicTransferAndUnitaryTraceComparison`. Galaxy: `langlands`.

Build on Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison), with its ET.0 ordinary stable-conjugacy, nonabelian/abelianized H1 and torus-complex Tate–Nakayama package as the first prerequisite. Import ET.1 transfer factors and their explicit conventions, Arithmetic Galois duality (ArithmeticGaloisDuality R02.1,R02.2,D7), the existing Tau Ceti ProfiniteCohomology and ClassFieldTheory roadmaps, ReductiveGroupsPartII RG2.0a/RG2.5, Automorphic forms (AutomorphicFormsOnReductiveGroups AF.1) and Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.0/SR.2/SR.3). Use the pinned continuous cochain, low Tate degree, Kummer, abstract extension and algebraic torus carriers. Do not reconstruct them or treat them as the missing continuous comparisons.

Construct u as the inverse limit of Res mu_n/diagonal mu_n over characteristic-zero local F, prove H1(F,u)=0 and H2(F,u)=Zhat for p-adic F or C2 for R, choose xi=-1 and realize the profinite extension W. Keep W distinct from W_F and use discrete G(Fbar) in its cocycles. Define affine central-pair categories, algebraic central restrictions, barred cocycles and rigid H1 with their exact functorialities. Use the author’s direct proof to lift H1(F,G/Z) for arbitrary affine, including disconnected, G. Prove finite fixed-Z classes and all reductive inner forms rigidify. Define abelianized rigid H1 using the simply connected cover of the TWISTED group, not only untwisted H1 vanishing.

Construct Ybar/IY, the reductive coroot quotient and their norm-kernel colimit. Import the generic unbalanced cochain operation from ArithmeticGaloisDuality, choose Weil lifts before coset representatives, and extend finite maps to quotient tori before root-extracted cochain evaluation. Prove the explicit torus isomorphism Theorem4.8 and reductive H1_ab isomorphism Theorem4.11 with the normalized restriction squares. Prove the dual plus-component pairing: trivial left kernel on H1_ab, perfect for p-adic F or tori, real norm-annihilator image in general. Define rigid groupoids, stable-conjugacy and torus-embedding invariants with eta^-1 transport, and prove the all-Z strong-real-form equivalence Theorem5.2. Fixed-Z fibers are finite; the all-Z union only MAY be infinite.

Define refined endoscopic data and parameter-centralizer covers here; export the rigid torus pairing to ET.1, which owns the actual transfer factor construction and global product. Construct the real Weil carrier once, importing ordinary archimedean reciprocity. Cover the full real tempered case beyond ET.1’s unitary application range: Langlands discrete-series parameters, admissible embeddings, Whittaker normalization, minimal cuspidal Levi, R-group root subsystem, positive-root Cayley transforms, coherent continuation, the noncompact imaginary-root criterion and irreducible induction. Correct both printed Cayley formulas using Shelstad1982 p423. Prove Theorem5.8, the parity image, Proposition5.9’s exact component sequence, the full real compound-packet bijection and stable characters, then Proposition5.10 and identity(5.11) with the prime transfer convention. Real component groups are abelian here but may have order4 elements; p-adic lifted groups may be nonabelian.

Final proved local endpoints are the finite/dual rigid cohomology theorems, equivalence with strong real forms, and the real tempered labeling, stability and endoscopic identities. The general p-adic refined LLC is only a conjecture specification. Include the SL2 example with Q8 labels and dimension2 weighting using its actual representation-theoretic supplier. Add a later global interface from Kal15b, explicitly restricted to the overview’s number-field/quasi-split/simply-connected-derived assumptions: global gerbe, localization modulo central coboundaries, global duality and rigid lift. Export these to ET.1’s unconditional adelic product and Arthur globalization theorem. The adelic packet/pairing is conditional on local packet conjectures and the conjectural global Langlands group; Conjecture5.11 is not a proved multiplicity formula.

Tests must include mu_n in the real norm-one torus giving C_(2n), split-torus vanishing, the two compact SL2 rigid labels with equal abelianization, a disconnected finite central cocycle lift, odd-order inverse/positive transfer signs, Q8’s four one-dimensional and one two-dimensional labels, a real C4 component group, an irrelevant packet, a vanishing coherent continuation and the corrected rank-one Cayley product. Suggested files: TauCeti/NumberTheory/GaloisCohomology/Rigid/{UniversalGroup,Cocycles,TateNakayama,Duality}.lean; TauCeti/RepresentationTheory/Endoscopy/{RigidTwists,RefinedData,RealPackets,GlobalRigidInterface}.lean. Generic unbalanced cochains belong in TauCeti/RepresentationTheory/Homological/TateCohomology/UnbalancedCup.lean under the shared duality owner. ET.1 uses TauCeti/RepresentationTheory/Endoscopy/RigidTransferFactors.lean. Choose definition and named-theorem planets rather than formula numbers. Close the gap register and recursively split original suppliers before calling the design complete.

Items: D01, T01, T02, T03, D02, T04, D03, T05, D04, D05, D06, T06, T07, T08, T09, T10, T11, T12, T13, T14, D07, T15, D10, D11, T20, D12, D13, D15, T23, D16, D17, T24, T25, D18, T26, T27, T28, T29, T30, T31, D20, D21, T40, D22, D23, T41, D24, D25, D26, T42, D27, T43, T44, D31, T50, D35, C01, C02, T53, T54, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, G01, G02, G03, G04, G06, G07, G08, G10, T03R, T04S, T12F, T14R, T23B, T24X, T40E, R10I.

### Current routes

#### 1. ReductiveGroupsPartII — source

Reuse Weil restriction, multiplicative-type quotients, dual groups and central isogenies. Add the precise augmentation and coroot-coinvariant adapters as source contracts; do not rebuild the pinned torus and lattice carriers.

Stages: ReductiveGroupsPartII:RG2.0a, ReductiveGroupsPartII:RG2.5.

Items: P09, P14, P15.

#### 2. ArithmeticGaloisDuality — source

The existing compact-coefficient, Hochschild–Serre and Tate-duality owner supplies the generic cochain comparisons. Place the new reusable unbalanced cochain product and its Leibniz proof here. Import ordinary finite local duality and real Brauer invariants from ClassFieldTheory; no second Poitou–Tate or continuous-cohomology carrier. The generic profinite extension topology, continuous Schreier classification and extension-automorphism interface also belong to this compact-coefficient owner. They reuse the pinned abstract factor-set carrier and normalized quotient sections.

Stages: ArithmeticGaloisDuality:R02.1, ArithmeticGaloisDuality:R02.2, ArithmeticGaloisDuality:D7.

Items: P03, P04, P06, D14, T21, T22, P24, P25, P26.

#### 3. EndoscopicTransferAndUnitaryTraceComparison — source

Ordinary nonabelian H1, fundamental tori, abelianization, stable conjugacy, ordinary endoscopic data, z-pairs and the torus-complex transfer comparison are already in ET.0. The rigid gerbe and refined real packets are the separate continuation below.

Stages: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Items: P10, P11, P12, P13, D30, D34.

#### 4. EndoscopicTransferAndUnitaryTraceComparison — source

ET.1 already owns absolute normalizations, conventions, central extension transport and the global product formula. Add the rigid correction, its two convention signs, its relative-factor proof and the global rigid product/globalization adapters here; the full real packet classification remains in the continuation.

Stages: EndoscopicTransferAndUnitaryTraceComparison:ET.1.

Items: D32, D33, T51, T52, D36, G05, G09.

#### 5. AutomorphicFormsOnReductiveGroups — source

Use the existing real admissible (g,K)-module, globalization and character foundation. The real local Langlands and Shelstad packet theorems are additional results, not credited to this basic representation stage.

Stages: AutomorphicFormsOnReductiveGroups:AF.1.

Items: P16, P18.

#### 6. SmoothRepresentationsOfLocalGroups — source

Reuse smooth admissible complex representations, normalized induction and temperedness for the p-adic conjecture and SL2 example; no second representation category is proposed.

Stages: SmoothRepresentationsOfLocalGroups:SR.0, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.

Items: P17.

#### 7. EndoscopicTransferRigidInnerFormsPartII — part-ii

ET.0–1 own ordinary cohomological and transfer foundations but the existing endpoint is a unitary stable trace comparison, not the universal rigid gerbe or all real tempered packets. The existing GWZ20-B candidate EndoscopicTransferAndUnitaryTraceComparisonPartII is geometric stabilization via p-adic integration; its full brief was read and is a distinct lane. One rigid continuation owns the shared local/global rigid carriers and exports them to existing transfer layers.

Design brief: Build on Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison), with its ET.0 ordinary stable-conjugacy, nonabelian/abelianized H1 and torus-complex Tate–Nakayama package as the first prerequisite. Import ET.1 transfer factors and their explicit conventions, Arithmetic Galois duality (ArithmeticGaloisDuality R02.1,R02.2,D7), the existing Tau Ceti ProfiniteCohomology and ClassFieldTheory roadmaps, ReductiveGroupsPartII RG2.0a/RG2.5, Automorphic forms (AutomorphicFormsOnReductiveGroups AF.1) and Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.0/SR.2/SR.3). Use the pinned continuous cochain, low Tate degree, Kummer, abstract extension and algebraic torus carriers. Do not reconstruct them or treat them as the missing continuous comparisons.

Construct u as the inverse limit of Res mu_n/diagonal mu_n over characteristic-zero local F, prove H1(F,u)=0 and H2(F,u)=Zhat for p-adic F or C2 for R, choose xi=-1 and realize the profinite extension W. Keep W distinct from W_F and use discrete G(Fbar) in its cocycles. Define affine central-pair categories, algebraic central restrictions, barred cocycles and rigid H1 with their exact functorialities. Use the author’s direct proof to lift H1(F,G/Z) for arbitrary affine, including disconnected, G. Prove finite fixed-Z classes and all reductive inner forms rigidify. Define abelianized rigid H1 using the simply connected cover of the TWISTED group, not only untwisted H1 vanishing.

Construct Ybar/IY, the reductive coroot quotient and their norm-kernel colimit. Import the generic unbalanced cochain operation from ArithmeticGaloisDuality, choose Weil lifts before coset representatives, and extend finite maps to quotient tori before root-extracted cochain evaluation. Prove the explicit torus isomorphism Theorem4.8 and reductive H1_ab isomorphism Theorem4.11 with the normalized restriction squares. Prove the dual plus-component pairing: trivial left kernel on H1_ab, perfect for p-adic F or tori, real norm-annihilator image in general. Define rigid groupoids, stable-conjugacy and torus-embedding invariants with eta^-1 transport, and prove the all-Z strong-real-form equivalence Theorem5.2. Fixed-Z fibers are finite; the all-Z union only MAY be infinite.

Define refined endoscopic data and parameter-centralizer covers here; export the rigid torus pairing to ET.1, which owns the actual transfer factor construction and global product. Construct the real Weil carrier once, importing ordinary archimedean reciprocity. Cover the full real tempered case beyond ET.1’s unitary application range: Langlands discrete-series parameters, admissible embeddings, Whittaker normalization, minimal cuspidal Levi, R-group root subsystem, positive-root Cayley transforms, coherent continuation, the noncompact imaginary-root criterion and irreducible induction. Correct both printed Cayley formulas using Shelstad1982 p423. Prove Theorem5.8, the parity image, Proposition5.9’s exact component sequence, the full real compound-packet bijection and stable characters, then Proposition5.10 and identity(5.11) with the prime transfer convention. Real component groups are abelian here but may have order4 elements; p-adic lifted groups may be nonabelian.

Final proved local endpoints are the finite/dual rigid cohomology theorems, equivalence with strong real forms, and the real tempered labeling, stability and endoscopic identities. The general p-adic refined LLC is only a conjecture specification. Include the SL2 example with Q8 labels and dimension2 weighting using its actual representation-theoretic supplier. Add a later global interface from Kal15b, explicitly restricted to the overview’s number-field/quasi-split/simply-connected-derived assumptions: global gerbe, localization modulo central coboundaries, global duality and rigid lift. Export these to ET.1’s unconditional adelic product and Arthur globalization theorem. The adelic packet/pairing is conditional on local packet conjectures and the conjectural global Langlands group; Conjecture5.11 is not a proved multiplicity formula.

Tests must include mu_n in the real norm-one torus giving C_(2n), split-torus vanishing, the two compact SL2 rigid labels with equal abelianization, a disconnected finite central cocycle lift, odd-order inverse/positive transfer signs, Q8’s four one-dimensional and one two-dimensional labels, a real C4 component group, an irrelevant packet, a vanishing coherent continuation and the corrected rank-one Cayley product. Suggested files: TauCeti/NumberTheory/GaloisCohomology/Rigid/{UniversalGroup,Cocycles,TateNakayama,Duality}.lean; TauCeti/RepresentationTheory/Endoscopy/{RigidTwists,RefinedData,RealPackets,GlobalRigidInterface}.lean. Generic unbalanced cochains belong in TauCeti/RepresentationTheory/Homological/TateCohomology/UnbalancedCup.lean under the shared duality owner. ET.1 uses TauCeti/RepresentationTheory/Endoscopy/RigidTransferFactors.lean. Choose definition and named-theorem planets rather than formula numbers. Close the gap register and recursively split original suppliers before calling the design complete.

Items: D01, T01, T02, T03, D02, T04, D03, T05, D04, D05, D06, T06, T07, T08, T09, T10, T11, T12, T13, T14, D07, T15, D10, D11, T20, D12, D13, D15, T23, D16, D17, T24, T25, D18, T26, T27, T28, T29, T30, T31, D20, D21, T40, D22, D23, T41, D24, D25, D26, T42, D27, T43, T44, D31, T50, D35, C01, C02, T53, T54, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, G01, G02, G03, G04, G06, G07, G08, G10, T03R, T04S, T12F, T14R, T23B, T24X, T40E, R10I.

### Remaining gaps

- **GAP01 — Declaration-sized and recursive closure**: All74 primary published pages were read. Several original-source interfaces and bundled definitions still need exact declaration-sized splitting. In particular T11’s full pointed diagram, P10/P11’s arithmetic hypotheses, R02/R06/R09/R18’s parameter and representation data, and G01/G02/G06/G09’s global interfaces are not closed by this checkpoint.
- **GAP02 — Continuous profinite and local duality suppliers**: NSW2.7.3–2.7.7 and the full referenced Schreier proof have now been read and decomposed. P19–P22 supply the exact countable finite-coefficient limit hypotheses, P23/P27 give a direct degree-one local finiteness route, and L29/P24–P26 supply profinite extension realization and automorphisms. Remaining: typed comparison with the canonical cohomology carrier, finite local duality, local norm existence and relative Weil transfer at their original sources. The latter arithmetic tasks are not closed by reading NSW statements, and the local-duality owner must not acquire a reciprocity dependency.
- **GAP03 — Explicit cochain proof closure**: Complete every boundary degree and continuity condition of the unbalanced product, corrected section choices, quotient-torus extensions and cochain identities. The source leaves elementary derivations to the reader; degree checks alone are not proofs of those identities. The generic continuous section needed in §3.2 is now credited to the pinned library; this does not solve the simultaneous relative-Weil section choices of §4.4 or the unbalanced product identities.
- **GAP04 — Reductive cohomology and relevance**: Read PR/Kneser/Kottwitz/Borovoi/Arthur at source for local H1 finiteness, fundamental tori, abelianization, anisotropic H2 vanishing, ordinary Levi injectivity and relevant K-groups. The general real untwisted-H1 criterion is corrected, not silently assumed.
- **GAP05 — Full real classification and transfer corpus**: Shelstad1982 printed415–423 was read, not the complete paper. Read Langlands1989, Shelstad1979/1982/2008/2010 and Kostant/Vogan for discrete classification, genericity, R-groups, coherent continuation, induction, component cardinalities and geometric/spectral descent. Verify each discriminant exponent, transfer convention and Kottwitz sign in the original sources before closing R19.
- **GAP06 — Global original-source extraction**: Read Kal15b in full with its own current errata, specify the global gerbe and lattice conditions, all localization choices, unramified statements and exact Arthur globalization hypotheses. Separate proved geometric products, conditional packet products and the multiplicity conjecture. This overview does not provide a complete global blueprint.
- **GAP07 — Independent source-finding review**: Review E01–E15 at the exact versions. E01–E06 follow author errata; E07–E15 are worker findings requiring independent verdicts. The source-version note on already-corrected Lemma4.7 must be preserved. No main theorem is claimed refuted by the identified proof/notation defects.
- **GAP08 — Design and Lean checks**: Routes and the candidate continuation are proposals. No Lean file was supplied or compiled for this paper issue. A later design must make the suggested APIs and tests elaborate, choose planets and complete the proof DAG. Schema and finite diagnostics are not formalization.

### Source findings awaiting independent review

All 15 inherited findings are preserved exactly. Author corrections and worker findings retain their distinct provenance. No new source error is claimed by this continuation, and no independent verdict is supplied.

```json
{
  "id": "PAPER-KALETHA-16/E01",
  "kind": "gap",
  "locator": "Proposition3.6,printed574–575;published74-page version",
  "printed": "a",
  "correction": "Replace the connected/abelian-only surjectivity argument by the author’s direct cocycle lift for arbitrary affine G.",
  "reason": "Lift a quotient cocycle to ztilde, let alpha(sigma,tau)=ztilde(sigma) sigma(ztilde(tau)) ztilde(sigma tau)^-1 in Z, choose phi with alpha=phi(xi) after a central cochain adjustment, and set z(x,sigma)=phi(x)ztilde(sigma). This proves the statement also for disconnected affine G.",
  "affects": "the proof",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E02",
  "kind": "error",
  "locator": "§4.4 beforeLemma4.4,printed582;published74-page version",
  "printed": "ζ_k",
  "correction": "Choose lifts of the already chosen Weil section first; define zeta_k as their projections, and then extend the next section using the coset product.",
  "reason": "A prescribed zeta_k(x) need not be the Galois image of any lift of the chosen Weil element s_k(x). The author’s errata credits Taibi and supplies the compatible order of choices.",
  "affects": "the proof",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E03",
  "kind": "gap",
  "locator": "Formula(4.8),printed584;published74-page version",
  "printed": "p",
  "correction": "Extend p and delta_e to the quotient tori Res Gm/Gm before evaluating the displayed non-torsion cochains.",
  "reason": "The finite maps u_(k+1)->u_k and mu_n->u_k alone do not have the domains of the two root-extracted cochains. The same norm/power and distinguished-coordinate formulas give the needed extensions.",
  "affects": "the proof",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E04",
  "kind": "gap",
  "locator": "ProofLemma4.7,printed586;published74-page version",
  "printed": "ϕ_(λ̄,k)",
  "correction": "Extend phi_(lambdabar,k) from u_k to Res_(E_k/F)Gm/Gm with target S by the product of the conjugate n_k*lambdabar cocharacters.",
  "reason": "The last comparison evaluates phi on an element of the quotient torus, not necessarily on u_k. Norm-zero ensures that the product kills the diagonal Gm. The separate delta_e-to-n_k*lambdabar symbol correction in the errata is ALREADY present in the published penultimate display and is not reported as an outstanding published misprint.",
  "affects": "the proof",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E05",
  "kind": "error",
  "locator": "Corollary5.4,printed598;published74-page version",
  "printed": "H¹(u→W,Z→G)",
  "correction": "Use H1_ab for the left factor when claiming trivial left kernel; pull back to full H1 only as a pairing constant on K-groups.",
  "reason": "Theorem4.11 identifies the lattice group with H1_ab. Over R different full rigid classes can have the same abelianized image, as the compact SL2 pair in E07 demonstrates. The author explicitly corrects this; the p-adic and torus cases are unaffected.",
  "affects": "a stated result",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E06",
  "kind": "misprint",
  "locator": "§5.6 before(5.13),printed615;also embedding discussion printed594",
  "printed": "g⁻¹z(w)w(g)",
  "correction": "Apply eta_w^-1 to this cocycle when defining the invariant in H1rig of the abstract parameter torus S; use the analogous eta^-1 in the general embedding construction.",
  "reason": "The displayed expression lies in eta_w(S), while the pairing and Tate–Nakayama map use S. The author errata makes this transport explicit.",
  "affects": "the proof",
  "known": "Kaletha, Errata and addenda, §3, PDF6–7, https://www.math.uni-bonn.de/people/kaletha/errata.pdf (read2026-09-22)",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E07",
  "kind": "error",
  "locator": "§3.4,printed577;arXivv5 andauthor ri4 PDF16",
  "printed": "H¹(Γ,G_sc)=1",
  "correction": "Require H1(F,Gprime_sc)=1 for every inner twist occurring in the equivalence fibers. The claimed conclusion remains valid for p-adic F and for tori.",
  "reason": "Take G=SL2 over R, Z=mu2. Ordinary H1(R,SL2)=1 by Hilbert90 and determinant surjectivity. Let J=(0,1;-1,0). The strong real forms ±J sigma have square -I and define distinct rigid classes over the same compact inner form. An isomorphism would require gJ=-J conjugate(g). Solving gives g=(a,b;conjugate(b),-conjugate(a)), whose determinant is -|a|²-|b|², never1. Their relative cocycle -I lifts to the simply connected compact twist itself, so D07 identifies them. Hence H1rig->H1ab is not injective despite vanishing for the untwisted Gsc. Corollary3.8 already describes the three rigid classes over two inner forms.",
  "affects": "a stated result",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E08",
  "kind": "misprint",
  "locator": "ProofLemma4.5,printed584 final display;rendered publishedPDF26",
  "printed": "C²(Γ,S_E/F); =p(ξ_(k+1))",
  "correction": "The calculation is in C1, and its last equality to p(xi_(k+1)) must be removed. After differentiating, the xi term occurs in the next coboundary calculation.",
  "reason": "Both preceding terms are unbalanced products of degrees2 and-1, hence degree1. The xi term has degree2. The correct degree-one equality is what identifies alpha with eta_k cup delta_e. The same degree mismatch appears in the targeted author version.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E09",
  "kind": "misprint",
  "locator": "ProofTheorem4.11 diagram,printed590;rendered publishedPDF32",
  "printed": "H¹_sc",
  "correction": "Use H1_ab in the published diagram.",
  "reason": "The published§3.4 and Theorem4.11 use H1_ab for the quotient functor. The older arXiv version consistently called it H1_sc, so this is a leftover notation in the published version, not an error in the older naming.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E10",
  "kind": "error",
  "locator": "§5.1,printed592;arXivv5 andauthor ri4 PDF29",
  "printed": "an infinite set",
  "correction": "Say that the all-Z fibers may become infinite, not that they always do.",
  "reason": "For G=SL2 the center mu2 is finite and is already the largest finite central subgroup, so the colimit stabilizes at the finite H1rig set. For a split torus Proposition3.5 gives a singleton for every finite Z, hence a singleton colimit even though infinitely many Z are available.",
  "affects": "a stated result",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E11",
  "kind": "error",
  "locator": "§5.3,printed600;arXivv5 andauthor ri4 PDF36",
  "printed": "unit circle",
  "correction": "The stated ratio condition determines an absolute factor up to C units. Restrict the ambiguity to the unit circle only after imposing a modulus normalization.",
  "reason": "If Delta satisfies every displayed relative-ratio condition, then 2*Delta satisfies the same conditions. The scalar2 is not of unit modulus. This concerns the sufficiency of the written defining condition, not the standard separately normalized transfer factor.",
  "affects": "a stated result",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E12",
  "kind": "misprint",
  "locator": "§5.6 Cayley calculation,printed616;rendered publishedPDF58;author/arXivPDF49",
  "printed": "s_α Ad(φ(j))(s_α)=s_α²",
  "correction": "Use s_alpha Ad(phi(j))(s_alpha)^-1=s_alpha². Its IMAGE in the Weyl group is the reflection; the representative itself may have order4.",
  "reason": "The source says the root spaces have eigenvalue-1, so theta(s_alpha)=s_alpha^-1. Thus the printed left side is1. In the rank-one projective model theta=Ad diag(i,-i), s=(I+iK)/sqrt2 gives s²=iK, a nontrivial Weyl representative. The exact Gaussian-matrix diagnostic verifies this. Shelstad1982 printed423 uses twisted conjugation s_alpha phi(j) s_alpha^-1.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E13",
  "kind": "error",
  "locator": "§5.6 Cayley product,printed616;rendered publishedPDF58;author/arXivPDF49",
  "printed": "∏_(α∈Δ_φ^∨) s_α",
  "correction": "Take a product over a positive subsystem, equivalently one root from each opposite pair, as in Shelstad1982 printed423.",
  "reason": "Delta_phi^vee is described as a root system A1^r, hence contains both signs. The compatible root-vector formula gives the same rank-one factor for alpha and -alpha, so multiplying the full pair squares the reflection. For the tempered PGL2 parameter with trivial C-unit restriction and phi(j)=class diag(i,-i), this makes the Weyl action trivial and fails to enlarge the torus Levi; the single positive-root factor gives the required rank-one enlargement. Original Shelstad scans415–423 were inspected, with an explicit positive-root product at423.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E14",
  "kind": "misprint",
  "locator": "ProofProposition5.6,printed605,relative cochain formula;published text",
  "printed": "σ(g)",
  "correction": "Use sigma(g_i) in each cochain indexed by i.",
  "reason": "The formula starts with g_i^-1 z(sigma) and its target is the corresponding centralizer S_i. The unindexed g is not the chosen conjugator for that pair. This is a local index repair, not a failure of the relative-transfer comparison.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

```json
{
  "id": "PAPER-KALETHA-16/E15",
  "kind": "misprint",
  "locator": "§5.7,printed626,local refined datum;rendered publishedPDF68;author ri4 PDF57",
  "printed": "Z(Ĝ_sc)",
  "correction": "Use Z(Gsc), the physical finite central subgroup used by the local rigidifications.",
  "reason": "The local z_v are explicitly cocycles for Z(Gsc)->Gsc->G, and refined data are defined relative to a finite central subgroup of G over F. The printed dual center is a complex algebraic group in a different carrier. The surrounding dual cover calculation is consistent with the corrected physical subgroup.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "Author publication page and linked errata.pdf checked2026-09-22; errata§3 PDF6–7 read in full.",
    "Annals article page for DOI10.4007/annals.2016.184.2.6 and published PDF checked; no separate journal correction linked there was found.",
    "arXiv1304.3292 history and v5(9February2015), plus current author ri4.pdf: targeted comparisons, not full collation. The author errata, rather than a claim that no correction exists, controls known findings.",
    "Web searches for the exact title with errata/correction and author-site corrections,2026-09-22. Limited search; findings labelled new require independent review."
  ],
  "verificationStatus": "worker finding awaiting independent review; no independent verdict claimed"
}
```

### Complete interface ledger

Every implementation status remains unchecked.

#### L06 — Connected reductive group predicate

**definition · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.reductiveCommHopfAlgProperty, tauceti:TauCeti.reductiveCommHopfAlgProperty_iff.

- API `Kaletha16.L06.geometricRadical` (characterisation): Reuse the geometric normal-unipotent-subgroup characterization.
- API `Kaletha16.L06.baseChange` (compatibility): Transport the predicate through permitted field extensions.
- API `Kaletha16.L06.iso` (functoriality): Transport reductivity under Hopf-algebra isomorphisms.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

- Proposed test `L06.test1`: G_m is reductive.
- Proposed test `L06.test2`: GL_n is reductive in characteristic zero.
- Proposed test `L06.test3`: The additive group is not reductive.

#### L07 — Algebraic torus predicate

**definition · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.torusCommHopfAlgProperty, tauceti:TauCeti.torusCommHopfAlgProperty_iff.

- API `Kaletha16.L07.fromSplitting` (constructor): A geometric split-torus isomorphism proves the predicate.
- API `Kaletha16.L07.geometricFiber` (compatibility): The geometric fiber has the specified finite rank.
- API `Kaletha16.L07.iso` (functoriality): Transport the torus predicate along an isomorphism.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

- Proposed test `L07.test1`: G_m is rank one.
- Proposed test `L07.test2`: A norm-one quadratic torus need not be split.
- Proposed test `L07.test3`: G_a is not a torus.

#### L08 — Geometric character lattice

**definition · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup, tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup.

- API `Kaletha16.L08.galoisAction` (projection): Expose the action inherited from geometric scalar extension.
- API `Kaletha16.L08.charactersAsMaps` (compatibility): Identify a character with a group-scheme map to G_m.
- API `Kaletha16.L08.addCharacters` (simp): Addition of characters corresponds to multiplication of their values.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

- Proposed test `L08.test1`: X*(G_m) is Z.
- Proposed test `L08.test2`: Conjugation acts by minus one on a real norm-one torus.
- Proposed test `L08.test3`: The trivial torus has zero character group.

#### L09 — Cocharacter lattice and pairing

**definition · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice, tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual, tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing.

- API `Kaletha16.L09.dual` (equivalence): Use the integral-dual linear equivalence.
- API `Kaletha16.L09.pairing` (projection): Evaluate a character on a cocharacter as an integer exponent.
- API `Kaletha16.L09.galois` (compatibility): The dual action evaluates against the inverse Galois action on characters.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

- Proposed test `L09.test1`: For G_m, exponents a and b pair to ab.
- Proposed test `L09.test2`: The zero cocharacter pairs to zero.
- Proposed test `L09.test3`: Simultaneous sign reversal on a norm-one torus preserves the pairing.

#### L10 — Perfect character-cocharacter pairing

**theorem · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

For a torus over a field, its integral character-cocharacter pairing is perfect.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair.

1. Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

#### L16 — Finite free cocharacter lattice

**theorem · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

For a torus over a field its integral cocharacter module is finite free.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free, tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite.

1. Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

#### L17 — Galois invariance of the pairing

**theorem · library**. §§2,3.1,4.1: algebraic group and lattice prerequisites

For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged.

Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

Library: tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant.

1. Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

- Use: §§3.1 and4.1 — Build multiplicative-type quotients and character/cocharacter lattices; no local duality or rigid gerbe is supplied by this carrier.

#### L20 — Absolute Galois group

**definition · library**. §2

For a field F, Gamma is Aut_F(Fsep) with its Krull topology; it is topologically isomorphic to the algebraic-closure version.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.AbsoluteGaloisGroup, tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv.

- API `Kaletha16.L20.construct` (constructor): Form the separable-closure automorphism group.
- API `Kaletha16.L20.characterise` (characterisation): Identify its topology with the Krull topology.
- API `Kaletha16.L20.transport` (functoriality): Restrict algebraic-closure automorphisms through the topological group equivalence.

- Use: §3 — All continuous coefficient actions use this Gamma.

- Proposed test `Kaletha16.L20.test1`: Gamma_R has two elements.
- Proposed test `Kaletha16.L20.test2`: Gamma_C is trivial.
- Proposed test `Kaletha16.L20.test3`: The abstract discrete topology on an infinite absolute Galois group is not substituted.

#### L21 — Discrete units and Kummer coefficients

**definition · library**. §3.1

For any field F and natural n, the additive versions of Fsep units and its n-th roots of unity carry their actual continuous Gamma actions and the discrete topology.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.UnitsCoeff, tauceti:TauCeti.unitsCoeff_continuousSMul, tauceti:TauCeti.KummerCoeff, tauceti:TauCeti.kummerCoeff_continuousSMul.

Prerequisites: PAPER-KALETHA-16/L20.

- API `Kaletha16.L21.construct` (constructor): Form UnitsCoeff and KummerCoeff with inherited Galois actions.
- API `Kaletha16.L21.characterise` (characterisation): The inclusion identifies mu_n with the n-torsion of units.
- API `Kaletha16.L21.transport` (functoriality): Use equivariant inclusion and powering, retaining the cyclotomic action.

- Use: Theorem3.1 and§4.5 — Finite-level coefficients in the projective gerbe construction.

- Proposed test `Kaletha16.L21.test1`: Complex conjugation acts by inversion on mu_3.
- Proposed test `Kaletha16.L21.test2`: mu_1 is trivial.
- Proposed test `Kaletha16.L21.test3`: Constant Z/n coefficients cannot replace mu_n when the action is nontrivial.

#### L22 — Discrete Kummer short exact sequence

**theorem · library**. §3.1

If n is invertible in the field F, inclusion mu_n -> Fsep units and n-th power form a short exact sequence of discrete Gamma-modules.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.kummerShortExact.

Prerequisites: PAPER-KALETHA-16/L21.

1. The pin proves root extraction in the separable closure, equivariance and exactness; no Kummer H1 surjectivity is credited here.

#### L23 — Continuous cohomology carrier

**definition · library**. §3.1

For a continuous topological representation A of a topological group, continuousCohomology is the homology of its homogeneous continuous cochains. This credits the carrier, not inverse-limit or finite-quotient comparison theorems.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: mathlib:TopRep.homogeneousCochains, mathlib:continuousCohomology.

- API `Kaletha16.L23.construct` (constructor): Construct homogeneous continuous cochains.
- API `Kaletha16.L23.characterise` (characterisation): Identify the cohomology object with homology of that complex.
- API `Kaletha16.L23.transport` (functoriality): Induce maps from continuous equivariant coefficient homomorphisms.

- Use: Theorem3.1 — Base object for compact coefficients u.

- Proposed test `Kaletha16.L23.test1`: Trivial finite group cochains recover the expected degree-zero invariants.
- Proposed test `Kaletha16.L23.test2`: Zero coefficients have zero cohomology.
- Proposed test `Kaletha16.L23.test3`: The cohomology of an inverse limit is not identified with a limit without a comparison theorem.

#### L24 — Explicit continuous abelian H1 and H2

**definition · library**. §§3.1,4.5

For a topological additive coefficient group with continuous action, the low-degree continuous cocycle/coboundary quotients H1 and H2 exist under the pinned continuity hypotheses. They are used as bare additive groups; the pointwise quotient topology is not the discrete comparison topology.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.ContCohomology.H1, tauceti:TauCeti.ContCohomology.H2.

Prerequisites: PAPER-KALETHA-16/L23.

- API `Kaletha16.L24.construct` (constructor): Form Z1/B1 and Z2/B2 using continuous cochains.
- API `Kaletha16.L24.characterise` (characterisation): Test classes by continuous cocycle and coboundary equations.
- API `Kaletha16.L24.transport` (functoriality): Transport by continuous equivariant coefficient maps.

- Use: §§3.1 and4.5 — Carry xi and the finite-level coboundary equations.

- Proposed test `Kaletha16.L24.test1`: A finite trivial coefficient action gives continuous homomorphisms in degree one.
- Proposed test `Kaletha16.L24.test2`: Zero coefficients give singleton quotients.
- Proposed test `Kaletha16.L24.test3`: Nonabelian G-valued cocycles cannot be inserted into these additive quotient groups.

#### L25 — Finite-extension Hilbert 90

**theorem · library**. §3.1 prerequisite

For a finite-dimensional field extension L/F, every multiplicative one-cocycle Aut_F(L) -> L units is a coboundary, so the abstract group H1 is trivial.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units, mathlib:groupCohomology.H1ofAutOnUnitsUnique.

1. Read the finite-extension theorem; the continuous absolute-Galois reduction remains a separate planned import.

#### L26 — Tate degree-zero norm quotient

**theorem · library**. §4.1

For a finite group acting on a module over a commutative ring, Tate H0 is invariants modulo the image of the norm.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.TateCohomology.H0IsoNormQuotient.

1. Import the exact pinned isomorphism; local invariant maps are additional arithmetic results.

#### L27 — Tate degree-minus-one norm kernel

**theorem · library**. §§4.1,4.3

For a finite group acting on a module over a commutative ring, Tate H(-1) is the norm kernel modulo the augmentation submodule.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.TateCohomology.HNegOneIsoNormKernelQuotient.

1. Import the exact isomorphism; this is not the unbalanced cup pairing.

#### L28 — Abstract extension classification by H2

**theorem · library**. §3.2 prerequisite

For an abstract group Gamma acting on an abelian group M, normalized factor sets modulo coboundaries correspond to H2; extensions inducing that action are equivalent exactly when their section factor sets have the same class. No topology or continuous section is part of this credit.

Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

Library: tauceti:TauCeti.FactorSet.cohomologyClassEquiv, tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq.

1. The pinned factor-set and extension equivalences provide the algebraic model; the profinite realization and continuity are missing suppliers.

#### P01 — Continuous Hilbert 90 and Kummer comparison

**theorem · planned**. §§3.1,4.6

For a field F, continuous H1(Gamma,Fsep units) vanishes; for n invertible in F the connecting map identifies F units/(F units)^n with H1(Gamma,mu_n), retaining its cyclotomic action.

Planned: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory.

Prerequisites: PAPER-KALETHA-16/L20, PAPER-KALETHA-16/L21, PAPER-KALETHA-16/L22, PAPER-KALETHA-16/L25.

1. Descend each continuous cocycle to a finite Galois extension, apply Hilbert90 and the continuous long exact sequence.

#### P02 — Finite quotient and Shapiro comparisons

**theorem · planned**. §3.1

For profinite Gamma and discrete continuous abelian coefficients, continuous cohomology is the compatible finite-quotient colimit; induction/coinduction from an open subgroup gives the Shapiro isomorphisms with restriction/corestriction compatibility.

Planned: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma.

Prerequisites: PAPER-KALETHA-16/L23.

1. Use the existing profinite-cohomology owner, not a private copy in endoscopy.

#### P03 — Compact-coefficient derived inverse-limit comparison

**theorem · planned**. Theorem3.1,NSW2.7.6–2.7.7

For a profinite group G and a countable tower A_n of finite discrete continuous abelian G-modules, A=lim A_n with its actual inverse-limit topology satisfies, for q≥1, 0→lim¹H^(q−1)(G,A_n)→H^q_cts(G,A)→lim H^q(G,A_n)→0; H0 commutes with the limit. Surjective transitions are not required. Mittag–Leffler of H^(q−1), in particular its levelwise finiteness, kills the obstruction. Degree one is unconditional because invariants of finite coefficients are finite. Degree two needs the H1 hypothesis, supplied for the local fields here by P23.

Planned: ArithmeticGaloisDuality:R02.1.

Prerequisites: PAPER-KALETHA-16/P22.

1. Apply the precise NSW2.7.5–2.7.6 interfaces P19–P22, now read at source. For H1 reuse CHT item154 at the same R02.1 owner; finite coefficients do not imply all cohomology groups finite for arbitrary profinite G. The existing canonical carrier is retained and its typed comparison is an implementation obligation.

#### P04 — Continuous Hochschild–Serre and transgression

**theorem · planned**. §3.3 Lemma3.3

For a profinite extension and the continuous abelian coefficients used here, construct inflation, restriction, the Hochschild–Serre edge sequence and its transgression, with explicit cochain sign convention.

Planned: ArithmeticGaloisDuality:R02.2.

Prerequisites: PAPER-KALETHA-16/L24.

1. Prove the edge map by a chosen section and then show independence; nonabelian pointed-set variants require their own contract.

#### P05 — Local finite-module duality

**theorem · planned**. Theorem3.1,Proposition3.2

For F a finite extension of Qp and finite discrete Gamma-module M, Tate local duality pairs H^i(F,M) perfectly with H^(2-i)(F,M dual(1)) using inv_F:H2(F,Fsep units)->Q/Z, including p-primary coefficients.

Planned: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Prerequisites: PAPER-KALETHA-16/L21, PAPER-KALETHA-16/L26, PAPER-KALETHA-16/L27.

1. Import the arithmetic invariant and finite duality from ClassFieldTheory; do not infer them from the Tate-complex carrier.

#### P06 — Real Tate duality

**theorem · planned**. Theorem3.1

For F=R and finite Galois coefficients, use modified Tate cohomology for Gamma=C2 and the real Brauer invariant to obtain the finite dualities used to compute H2(R,u).

Planned: ArithmeticGaloisDuality:D7.

Prerequisites: PAPER-KALETHA-16/L26, PAPER-KALETHA-16/L27, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants.

1. Retain the real Tate modification instead of extending ordinary positive-degree p-adic formulas blindly.

#### P07 — Local class formations and relative Weil extensions

**theorem · planned**. §4.4

For finite Galois E/F of nonarchimedean characteristic-zero local fields, construct its fundamental class and relative Weil extension, normalized invariant 1/[E:F], quotient maps for towers, and transfer/norm compatibility.

Planned: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-2-class-formations-and-fundamental-classes, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.

Prerequisites: PAPER-KALETHA-16/P05.

1. Use the existing class formation and local Weil-group roadmaps; section choices are later data.

#### P08 — Norm subgroups and local existence

**theorem · planned**. Theorem3.1

The norm subgroups N_(E/F) E units of finite abelian extensions form the local reciprocity neighborhoods required in the vanishing argument for the projective system u.

Planned: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence.

Prerequisites: PAPER-KALETHA-16/P07, PAPER-KALETHA-16/P27.

1. Use local class-field existence with its topological norm statement, not only an abstract Artin homomorphism.
2. P27 gives the required open finite-index subgroup of n-th powers, even when p divides n. Local existence then produces an abelian extension whose norm group is contained in it. Local existence itself remains an upstream arithmetic supplier.

#### P09 — Weil restriction and finite central quotients

**definition · planned**. §3.1

For finite separable E/F and positive n, form Res_(E/F)mu_n and its diagonal mu_n quotient as affine multiplicative-type groups. Over E their characters identify with the permutation module and its augmentation kernel.

Planned: ReductiveGroupsPartII:RG2.0a.

Prerequisites: PAPER-KALETHA-16/L07, PAPER-KALETHA-16/L08, PAPER-KALETHA-16/L21.

- API `Kaletha16.P09.construct` (constructor): Construct restriction of scalars and the diagonal central quotient.
- API `Kaletha16.P09.characterise` (characterisation): Identify the quotient character module with augmentation-zero elements of (Z/n)[Gal(E/F)] when E/F is Galois.
- API `Kaletha16.P09.transport` (functoriality): Transport the group and character maps along field towers and divisibility of n.

- Use: §3.1 — Finite-level algebraic carrier for u.

- Proposed test `Kaletha16.P09.test1`: For E=F the diagonal quotient is trivial.
- Proposed test `Kaletha16.P09.test2`: For quadratic E/F,n=2 its geometric order is2.
- Proposed test `Kaletha16.P09.test3`: An arbitrary noncentral subgroup quotient is outside this contract.

#### P10 — Local finiteness of ordinary nonabelian H1

**theorem · planned**. Lemma3.4,PR6.14

For a linear algebraic group H over R or a finite extension of Qp, H1(Gamma,H(Fbar)) is finite; this applies to every cocycle-twisted affine group occurring in the fibers below.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Prerequisites: PAPER-KALETHA-16/L20.

1. The finite component group and connected case need separate reductions; an abelian cochain implementation does not prove this.

#### P11 — Fundamental tori and cohomology surjectivity

**theorem · planned**. Corollary3.7,Lemma4.9,PR6.14/Kneser/Kottwitz

For a connected reductive local group G, a fundamental maximal torus S gives the ordinary H1 surjectivity used in§3.3 and§4.7; for p-adic Gsc every inner twist has trivial H1. Preserve the real anisotropic/fundamental hypotheses.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Prerequisites: PAPER-KALETHA-16/P10.

1. Read the original local H1 and fundamental-torus theorems; the real simply connected assertion is not p-adic vanishing.

#### P12 — Ordinary Tate–Nakayama for tori

**theorem · planned**. §4 introduction;§5.3

For a local torus S split by finite Galois E/F, the fundamental class gives a natural isomorphism (X_*(S)_Gamma)_tors -> H1(F,S), and pairings for the two-term torus complexes used in relative transfer are compatible with norm, restriction and central isogenies.

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Prerequisites: PAPER-KALETHA-16/L26, PAPER-KALETHA-16/L27, PAPER-KALETHA-16/P07, PAPER-KALETHA-16/R01, PAPER-KALETHA-16/P06.

1. Expose the exact normalization and two-term complex maps; do not identify all relative transfer classes with H1 of a single torus.

#### P13 — Ordinary inner twists and abelianized H1

**definition · planned**. §§2,3.4

For connected reductive G/F, an inner twist psi:G_Fbar->Gprime_Fbar has psi^-1 sigma(psi) inner; ordinary abelianized H1 is the crossed-module cohomology of Gsc->G, with its map from H1(G).

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Prerequisites: PAPER-KALETHA-16/P10.

- API `Kaletha16.P13.construct` (constructor): Construct the adjoint cocycle of an inner twist.
- API `Kaletha16.P13.characterise` (characterisation): Express abelianization through the crossed module Gsc->G.
- API `Kaletha16.P13.transport` (functoriality): Transport the class by an isomorphism of inner twists.

- Use: §§3.4,5.1 — The rigid construction enlarges this already owned ordinary theory.

- Proposed test `Kaletha16.P13.test1`: A pure G-cocycle yields an inner twist.
- Proposed test `Kaletha16.P13.test2`: A torus has ordinary abelianization equal to its H1.
- Proposed test `Kaletha16.P13.test3`: H1(R,SL2)=1 does not imply H1 for its compact inner twist is trivial.

#### P14 — Dual groups and central isogenies

**definition · planned**. §§4.1,5.3

For connected reductive G and finite central Z, form Gbar=G/Z and the dual isogeny Gbar_hat->G_hat with its based root-data Galois action, compatible maximal tori and coroot lattices.

Planned: ReductiveGroupsPartII:RG2.5.

Prerequisites: PAPER-KALETHA-16/L06, PAPER-KALETHA-16/L09.

- API `Kaletha16.P14.construct` (constructor): Dualize the finite central quotient.
- API `Kaletha16.P14.characterise` (characterisation): Identify the kernel through the character/cocharacter lattice inclusion.
- API `Kaletha16.P14.transport` (functoriality): Transport Levi inclusions and Galois actions through the dual root datum.

- Use: §5.3 — Carrier for the plus preimages and refined endoscopy.

- Proposed test `Kaletha16.P14.test1`: For SL2/mu2=PGL2 the dual cover is SL2(C)->PGL2(C).
- Proposed test `Kaletha16.P14.test2`: For Z=1 the dual cover is identity.
- Proposed test `Kaletha16.P14.test3`: The original finite subgroup Z over F is not the center of a complex dual group.

#### P15 — Weyl action on cocharacters modulo coroots

**theorem · missing**. Lemma4.2

For maximal tori S1,S2 of connected reductive G, conjugation identifies X_*(Si)/Qvee independently of the conjugating element and equivariantly for Gamma; homomorphisms of reductive groups induce compatible maps.

Prerequisites: PAPER-KALETHA-16/P14.

1. Each simple reflection differs from identity by a coroot; then check Galois conjugacy and functoriality.

#### P16 — Real representation foundation

**theorem · planned**. §§5.1,5.6

For real reductive groups, construct admissible (g,K)-modules, infinitesimal equivalence and the smooth moderate-growth globalization framework needed for real tempered representations. The analytic character theorem is the separate P18 contract.

Planned: AutomorphicFormsOnReductiveGroups:AF.1.

1. Import AF.1; the classification and endoscopic character identities are additional suppliers, not consequences of the carrier alone.

#### P17 — Smooth p-adic representation foundation

**theorem · planned**. §5.4

For reductive p-adic groups with complex coefficients, use smooth admissible irreducible representations, normalized parabolic induction and temperedness in the stated matrix-coefficient sense.

Planned: SmoothRepresentationsOfLocalGroups:SR.0, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.

1. Import the existing smooth representation stages and preserve characteristic-zero coefficients.

#### D01 — Projective multiplicative group u

**definition · missing**. §3.1

For F=R or finite over Qp, index finite Galois E/F and positive n by field extension and divisibility. Set u_(E/F,n)=Res_(E/F)mu_n/mu_n and u=lim u_(E/F,n); u(Fbar) has its profinite topology.

Prerequisites: PAPER-KALETHA-16/P09.

- API `Kaletha16.D01.construct` (constructor): Construct the directed system and its inverse limit as a pro-multiplicative group.
- API `Kaletha16.D01.characterise` (characterisation): Its character modules are augmentation kernels; all finite-level transition maps are surjective.
- API `Kaletha16.D01.transport` (functoriality): For E⊆K and n|m use norm K/E followed by the m/n power.

- Use: Theorems3.1 and4.8 — Universal central coefficient group for rigidification.

- Proposed test `Kaletha16.D01.test1`: u_(F/F,n)=1.
- Proposed test `Kaletha16.D01.test2`: The n=1 level is trivial.
- Proposed test `Kaletha16.D01.test3`: Using restriction instead of the norm reverses the character transition and is rejected.

#### T01 — Finite-level homomorphism identification

**theorem · missing**. (3.3)

If finite multiplicative Z/F is split by E and killed by n, evaluation at the distinguished coordinate identifies Hom_Gamma(u_(E/F,n),Z) with the norm-zero subgroup of Hom(mu_n,Z).

Prerequisites: PAPER-KALETHA-16/D01.

1. Dualize the augmentation sequence, then identify the invariant homomorphism by its identity-coordinate value.

#### T02 — Vanishing of H1(F,u)

**theorem · missing**. Theorem3.1(1)

For F=R or finite over Qp, continuous H1(Gamma,u)=0.

Prerequisites: PAPER-KALETHA-16/D01, PAPER-KALETHA-16/P01, PAPER-KALETHA-16/P02, PAPER-KALETHA-16/P03, PAPER-KALETHA-16/P08.

1. Compute each finite-level group by Shapiro and Kummer; show the relevant transitions eventually kill classes using norm neighborhoods and control lim1 separately.
2. For the coefficient-limit step use P03 in degree one: H0(Gamma,u_k) is finite, so lim¹ vanishes without assuming finite H1. The eventual-zero H1 transition argument remains the local-norm calculation; the limit comparison no longer has an unspecified hypothesis.

#### T03 — Second cohomology of u

**theorem · missing**. Theorem3.1(2),p-adic case

For F finite over Qp, continuous H2(Gamma,u) is canonically Zhat with the local-invariant normalization of§3.1.

Prerequisites: PAPER-KALETHA-16/D01, PAPER-KALETHA-16/P03, PAPER-KALETHA-16/P05, PAPER-KALETHA-16/P06, PAPER-KALETHA-16/P23.

1. Dualize finite levels, identify invariant augmentation characters and pass to limits; real invariants use the Tate modification.
2. For degree two, P23 supplies finite H1(Gamma,u_k), including the real case. P03 therefore gives H2(Gamma,u)=lim H2(Gamma,u_k). Finiteness of u_k alone would not justify this for an arbitrary profinite Gamma.

#### D02 — Canonical gerbe class

**construction · missing**. §3.1 afterTheorem3.1

Under T03 choose xi corresponding to -1, and represent it by a continuous normalized two-cocycle with values in u. The sign is part of the normalization.

Prerequisites: PAPER-KALETHA-16/T03, PAPER-KALETHA-16/T03R.

- API `Kaletha16.D02.construct` (constructor): Choose the class corresponding to negative one.
- API `Kaletha16.D02.characterise` (characterisation): Changing its cocycle representative preserves the class.
- API `Kaletha16.D02.transport` (functoriality): Push xi forward by algebraic Gamma-equivariant maps u->Z.

- Use: Proposition3.2 and§4.5 — Fixes the enlarged Tate–Nakayama and transfer-factor signs.

- Proposed test `Kaletha16.D02.test1`: Modulo3, the chosen invariant is2 rather than1.
- Proposed test `Kaletha16.D02.test2`: Over R the two signs coincide modulo2.
- Proposed test `Kaletha16.D02.test3`: Replacing -1 by1 changes the p-adic normalization for odd denominators.

#### T04 — Universal finite central obstruction class

**theorem · missing**. Proposition3.2,surjectivity

For every finite multiplicative Z/F, xi_*:Hom_Gamma(u,Z)->H2(Gamma,Z) is surjective.

Prerequisites: PAPER-KALETHA-16/T01, PAPER-KALETHA-16/D02, PAPER-KALETHA-16/P05, PAPER-KALETHA-16/P06.

1. Use local finite duality and the augmentation character description; split here concerns the character action, not a chosen constant group presentation.

#### D03 — Rigid Galois extension W

**construction · missing**. §3.2

Realize xi by a profinite extension 1->u->W->Gamma->1; in cocycle coordinates multiplication is (x,sigma)(y,tau)=(x sigma(y) xi(sigma,tau),sigma tau). W is distinct from the local Weil group W_F.

Use the existing FactorSet.Extension algebraic carrier L31 and add only P24 topology. P25 supplies the precise profinite classification; a continuous section is already built in L29.

Prerequisites: PAPER-KALETHA-16/D02, PAPER-KALETHA-16/L28, PAPER-KALETHA-16/P24, PAPER-KALETHA-16/P25.

- API `Kaletha16.D03.construct` (constructor): Build the topological extension from the continuous cocycle.
- API `Kaletha16.D03.characterise` (characterisation): Recover its kernel, quotient and extension class.
- API `Kaletha16.D03.transport` (functoriality): A coboundary change of xi induces an extension isomorphism.

- Use: Definition3.2 and§4.5 — Domain for the rigid cocycles.

- Proposed test `Kaletha16.D03.test1`: The split class gives a semidirect product.
- Proposed test `Kaletha16.D03.test2`: The C4 extension of C2 by C2 realizes the nontrivial finite shadow.
- Proposed test `Kaletha16.D03.test3`: An abstract section with discontinuous factor set does not construct a profinite realization.

#### T05 — Extension automorphisms are inner by u

**theorem · missing**. §3.2

Every automorphism of W inducing identity on u and Gamma is conjugation by an element of u; extension realizations of xi are isomorphic, but not canonically so on raw cocycles.

Prerequisites: PAPER-KALETHA-16/D03, PAPER-KALETHA-16/T02, PAPER-KALETHA-16/P26.

1. P26 identifies automorphisms fixing u and Gamma with continuous Z1(Gamma,u). T02 makes every class a coboundary, hence an inner conjugation by u. The conjugating element is determined modulo u^Gamma; no unique representative or canonical raw-cocycle identification is claimed.

#### D04 — Central-pair categories

**definition · missing**. §3.2

A consists of finite central multiplicative Z in an affine F-group G, with commuting-square homomorphisms. R is its full reductive connected subcategory and T its full torus subcategory.

Prerequisites: PAPER-KALETHA-16/L06, PAPER-KALETHA-16/L07.

- API `Kaletha16.D04.construct` (constructor): Construct an object from a central closed immersion and affine group.
- API `Kaletha16.D04.characterise` (characterisation): Recognize the reductive and torus full subcategories by their group hypotheses.
- API `Kaletha16.D04.transport` (functoriality): Compose the commuting-square homomorphisms and preserve the central restriction.

- Use: §§3–4 — Functorial domain; Theorem4.11 is on R, not arbitrary disconnected A.

- Proposed test `Kaletha16.D04.test1`: mu2->SL2 is an R-object.
- Proposed test `Kaletha16.D04.test2`: 1->1 is a T-object.
- Proposed test `Kaletha16.D04.test3`: A noncentral finite subgroup of SL2 is not an A-object.

#### D05 — Rigid continuous cocycles

**definition · missing**. §3.2

For [Z->G] in A, Z1(u->W,Z->G) consists of continuous W-cocycles valued in discrete G(Fbar), whose restriction to u is an algebraic homomorphism into Z. The W-action factors through Gamma.

Prerequisites: PAPER-KALETHA-16/D03, PAPER-KALETHA-16/D04.

- API `Kaletha16.D05.construct` (constructor): Build a rigid cocycle from its cocycle identity and algebraic central restriction.
- API `Kaletha16.D05.characterise` (characterisation): Read the algebraic map u->Z and ordinary quotient cocycle in G/Z.
- API `Kaletha16.D05.transport` (functoriality): Push cocycles along a morphism of central pairs.

- Use: §§3.3,5.1 — Carries extra normalization data of an inner twist.

- Proposed test `Kaletha16.D05.test1`: Inflation of an ordinary Gamma cocycle has trivial u-restriction.
- Proposed test `Kaletha16.D05.test2`: For G=1 only the trivial cocycle exists.
- Proposed test `Kaletha16.D05.test3`: A continuous abstract u->Z homomorphism without algebraicity evidence is insufficient.

#### D06 — Barred rigid cocycles and rigid H1

**definition · missing**. §3.2

Quotient D05 first by B1(W,Z) to obtain barred Z1, or by G(Fbar)-coboundaries to obtain the pointed set H1(u->W,Z->G). Only for commutative G is the latter naturally an abelian group.

Prerequisites: PAPER-KALETHA-16/D05.

- API `Kaletha16.D06.construct` (constructor): Form the central-coboundary quotient and the full conjugacy quotient separately.
- API `Kaletha16.D06.characterise` (characterisation): Two H1 representatives agree precisely by a G-valued coboundary.
- API `Kaletha16.D06.transport` (functoriality): Extension isomorphisms give canonical barred Z1 and H1 identifications by T05.

- Use: §§3.3–5.7 — Use barred cocycles for canonical localization and H1 for isomorphism classes.

- Proposed test `Kaletha16.D06.test1`: For a torus the group law is multiplication of cocycles.
- Proposed test `Kaletha16.D06.test2`: For Z=1 recover ordinary H1(Gamma,G).
- Proposed test `Kaletha16.D06.test3`: Full rigid H1(R,SL2) cannot be treated as an abelian group from its cardinality alone.

#### T06 — Inflation and restriction exactness

**theorem · missing**. §3.3

Inflation H1(Gamma,G)->H1(u->W,Z->G) is injective and its image is the fiber of the trivial algebraic restriction in Hom_Gamma(u,Z). These are pointed sets for nonabelian G.

Prerequisites: PAPER-KALETHA-16/D06.

1. A G-coboundary between inflated cocycles descends; a cocycle with trivial u-restriction factors continuously through Gamma.

#### T07 — Abelian transgression sign

**theorem · missing**. Lemma3.3

For commutative G in A, the connecting map Hom_Gamma(u,Z)->H2(Gamma,G) is xi_* followed by Z->G with the negative-transgression convention, giving the exact sequence displayed in§3.3.

Prerequisites: PAPER-KALETHA-16/T06, PAPER-KALETHA-16/P04, PAPER-KALETHA-16/D02.

1. Compute the section defect in D03 and align the sign of the Hochschild–Serre transgression. Do not append abelian H2 to a nonabelian pointed sequence.

#### T08 — Finiteness of rigid H1

**theorem · missing**. Lemma3.4

For every [Z->G] in A over R or finite over Qp, H1(u->W,Z->G) is finite.

Prerequisites: PAPER-KALETHA-16/T06, PAPER-KALETHA-16/P10, PAPER-KALETHA-16/T01.

1. The restriction image is finite; each nonempty fiber is a quotient of H1 of the corresponding twisted G, which is finite.

#### T09 — Split torus vanishing

**theorem · missing**. Proposition3.5

If S/F is a split torus and Z is finite central, H1(u->W,Z->S)=0.

Prerequisites: PAPER-KALETHA-16/T07, PAPER-KALETHA-16/T04, PAPER-KALETHA-16/P01, PAPER-KALETHA-16/T04S.

1. Use Hilbert90 and the injection on finite central obstructions furnished by the split character calculation.

#### T10 — Lifting all ordinary quotient cocycles

**theorem · missing**. Proposition3.6;author errata§3

For every affine G and finite central multiplicative Z, the map H1(u->W,Z->G)->H1(Gamma,G/Z) is surjective, including disconnected G.

Prerequisites: PAPER-KALETHA-16/T04, PAPER-KALETHA-16/D05, PAPER-KALETHA-16/T04S.

1. Lift a quotient cocycle to a continuous cochain ztilde. Its defect alpha lies in Z2(Gamma,Z). Choose phi with [alpha]=phi_*xi and adjust ztilde by a central cochain to obtain equality. Then z(x,sigma)=phi(x)ztilde(sigma) is the required cocycle; the erratum replaces the connected-only proof.

#### T11 — Central-cohomology exact diagram

**theorem · missing**. Proposition3.6 remaining diagram

For a central pair in A, the inflation/quotient maps fit the pointed exact rows of Proposition3.6; kernels and boundary maps agree with the ordinary central-extension sequence, and the right quotient map is T10.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/T06, PAPER-KALETHA-16/T10.

1. Write every arrow on cocycles and distinguish exact pointed sets from exact sequences of groups.

#### T12 — Anisotropic and fundamental torus reductions

**theorem · missing**. Corollary3.7(1)

If reductive G possesses an anisotropic maximal torus, restriction H1rig(Z->G)->Hom_Gamma(u,Z) is surjective.

Prerequisites: PAPER-KALETHA-16/P11, PAPER-KALETHA-16/T10.

1. Apply ordinary torus cohomology surjectivity to the quotient cocycle and then match the central restriction; retain the source torus hypotheses.

#### T13 — Every reductive inner form rigidifies

**theorem · missing**. Corollary3.8(1)

For connected reductive G, taking Z=Z(Gder), the maps H1rig(Z->G)->H1(Gamma,G/Z)->H1(Gamma,Gad) are surjective. Thus every inner twist admits rigidification with finite Z.

Prerequisites: PAPER-KALETHA-16/T10, PAPER-KALETHA-16/P13.

1. Use the induced central quotient and the simply connected/central cohomology comparison of the source.

#### T14 — Split-group fiber qualifications

**theorem · missing**. Corollary3.8(2),p-adic case

If G is split over a p-adic F and Z=Z(Gder), both maps H1rig(Z->G)->H1(F,G/Z)->H1(F,Gad) are bijections.

Prerequisites: PAPER-KALETHA-16/T13, PAPER-KALETHA-16/P11.

1. Use p-adic H1 vanishing for all simply connected inner twists; for R only the specified neutral-kernel argument applies. SL2(R) has three rigid classes over two inner-form classes.

#### D07 — Abelianized rigid cohomology

**definition · missing**. §3.4

For [Z->G] in R, identify rigid cocycles z1,z2 when their relative ordinary cocycle in the inner twist G1 comes from H1(Gamma,G1sc); the quotient is H1_ab(u->W,Z->G). The simply connected group is twisted with z1.

Prerequisites: PAPER-KALETHA-16/D06, PAPER-KALETHA-16/P13.

- API `Kaletha16.D07.construct` (constructor): Form the equivalence relation using the twisted simply connected cover.
- API `Kaletha16.D07.characterise` (characterisation): Test equivalence by a relative ordinary cocycle lifting to G1sc.
- API `Kaletha16.D07.transport` (functoriality): Push classes along reductive-group homomorphisms.

- Use: Theorem4.11 andCorollary5.4 — Correct domain of the finite abelian duality.

- Proposed test `Kaletha16.D07.test1`: For tori the quotient changes nothing.
- Proposed test `Kaletha16.D07.test2`: Over p-adic F it changes nothing by H1 vanishing for every inner twist.
- Proposed test `Kaletha16.D07.test3`: Over R the two compact SL2 rigidifications become one abelianized class.

#### T15 — When rigid H1 equals its abelianization

**theorem · missing**. §3.4 corrected criterion

If H1(F,Gprime_sc)=1 for every inner twist appearing in the rigid fibers, H1rig->H1ab is bijective. In particular this holds for p-adic F and for tori. Vanishing only for the untwisted Gsc is insufficient over R.

Prerequisites: PAPER-KALETHA-16/D07, PAPER-KALETHA-16/P11.

1. Each equivalence fiber is then a singleton. The real SL2/SU2 counterexample in E07 disproves the unrestricted printed criterion.

#### D10 — Torus quotient lattices and finite duality

**definition · missing**. §4.1

For Z->S in T, let Y=X_*(S)⊂Ybar=X_*(S/Z), Xbar=X^*(S/Z)⊂X=X^*(S). The quotient pairing (Ybar/Y)×(X/Xbar)->Q/Z is perfect.

Prerequisites: PAPER-KALETHA-16/L09, PAPER-KALETHA-16/L10, PAPER-KALETHA-16/L16.

- API `Kaletha16.D10.construct` (constructor): Construct the inclusions and finite quotient pairing.
- API `Kaletha16.D10.characterise` (characterisation): Evaluate the pairing by lifting a rational cocharacter and reducing its character value modulo Z.
- API `Kaletha16.D10.transport` (functoriality): Dualize a morphism of central torus pairs contravariantly in characters.

- Use: §4.1 andProposition5.3 — Lattice description of rigid classes and dual components.

- Proposed test `Kaletha16.D10.test1`: For mu_n->Gm the two quotients are cyclic of order n.
- Proposed test `Kaletha16.D10.test2`: Z=1 gives trivial quotients.
- Proposed test `Kaletha16.D10.test3`: The pairing is Q/Z-valued, not canonically integer-valued on the quotient.

#### D11 — Enlarged coinvariant torsion for tori

**definition · missing**. §4.1 Fact4.1

For a finite Galois splitting field E/F, let I be its augmentation ideal and N its norm. Set Ybar_plus=Ybar/IY and take its torsion subgroup; the denominator is IY, not IYbar.

Prerequisites: PAPER-KALETHA-16/D10, PAPER-KALETHA-16/L27.

- API `Kaletha16.D11.construct` (constructor): Form Ybar/IY and its torsion subgroup.
- API `Kaletha16.D11.characterise` (characterisation): Identify its torsion with ker(N:Ybar->Ybar)/IY.
- API `Kaletha16.D11.transport` (functoriality): Enlarging the splitting field gives the canonical same torsion object.

- Use: Theorem4.8 — The source of the enlarged Tate–Nakayama map.

- Proposed test `Kaletha16.D11.test1`: For the real norm-one torus and mu_n, this group is Z/(2n).
- Proposed test `Kaletha16.D11.test2`: For a split torus the torsion group is zero.
- Proposed test `Kaletha16.D11.test3`: Replacing IY with IYbar changes the real mu2 example from Z/4 to Z/2.

#### T20 — Lattice norm exact sequence

**theorem · missing**. Fact4.1

For D10 over a splitting E, there is an exact sequence 0->(Y_Gamma)_tors->(Ybar/IY)_tors->(Ybar/Y)^N->Y^Gamma/N(Y), where the final arrow is the lifted norm class.

Prerequisites: PAPER-KALETHA-16/D11, PAPER-KALETHA-16/L26, PAPER-KALETHA-16/L27.

1. Check lift independence modulo N(Y), then compute each kernel; use the norm-kernel characterization of torsion.

#### D12 — Finite central restriction from cocharacters

**construction · missing**. (4.1)–(4.2)

If n kills Ybar/Y, send lambdabar mod Y to the morphism mu_n->Z induced by n*lambdabar. Via T01 a norm-zero quotient class defines a Gamma-equivariant u->Z map, independent of sufficiently large (E,n).

Prerequisites: PAPER-KALETHA-16/D10, PAPER-KALETHA-16/T01.

- API `Kaletha16.D12.construct` (constructor): Construct the finite central map from n*lambdabar.
- API `Kaletha16.D12.characterise` (characterisation): Its restriction to mu_n lands in Z and only depends on lambdabar mod Y.
- API `Kaletha16.D12.transport` (functoriality): Compare the maps after increasing n and the splitting field.

- Use: Theorem4.8 restriction square — Connects the explicit cocycle to its algebraic central restriction.

- Proposed test `Kaletha16.D12.test1`: For Gm/mu_n, 1/n yields the identity central character.
- Proposed test `Kaletha16.D12.test2`: An integral cocharacter restricts trivially.
- Proposed test `Kaletha16.D12.test3`: A class whose norm is nonzero does not define the required equivariant map without the norm condition.

#### D13 — Reductive enlarged lattice quotient

**definition · missing**. §4.1 afterLemma4.2

For reductive [Z->G], choose a maximal torus S, divide Y and Ybar by the coroot lattice Qvee, and take the colimit over finite splitting E of (Ybar/Qvee)^N / I(Y/Qvee). Transport by P15 makes this independent of S.

Prerequisites: PAPER-KALETHA-16/D11, PAPER-KALETHA-16/P15.

- API `Kaletha16.D13.construct` (constructor): Construct the norm-kernel quotient at each splitting field.
- API `Kaletha16.D13.characterise` (characterisation): Identify conjugate maximal-torus presentations through the coroot quotient.
- API `Kaletha16.D13.transport` (functoriality): Induce maps for reductive homomorphisms using their simply connected lifts.

- Use: Theorem4.11 — Choice-free finite abelian source for reductive rigid duality.

- Proposed test `Kaletha16.D13.test1`: For a torus Qvee=0 and D11 is recovered.
- Proposed test `Kaletha16.D13.test2`: For Z=1 recover the ordinary abelianized lattice input.
- Proposed test `Kaletha16.D13.test3`: One cannot quotient Ybar by IYbar or discard coroots before checking the specified maps.

#### D14 — Unbalanced cochain product

**definition · missing**. §4.3

For a continuous surjection from a compact group Delta to a finite group Theta, a discrete continuous Delta-module A and a Theta-module B, contract a degree-i homogeneous cochain whose last jprime variables factor through Theta against a degree-minus-j Tate cochain of B. For i≥jprime≥j>0 the result has degree i-j and its last jprime-j variables factor through Theta. Finite Delta is included; define the boundary subspaces i=j and j=0 explicitly.

Prerequisites: PAPER-KALETHA-16/L23, PAPER-KALETHA-16/L27.

- API `Kaletha16.D14.construct` (constructor): Construct the finite contraction sum with the reversed variable order and group actions in§4.3.
- API `Kaletha16.D14.characterise` (characterisation): For j=0 recover ordinary cup product; for j=1 expose the inhomogeneous formula used in§4.5.
- API `Kaletha16.D14.transport` (functoriality): Commute with coefficient maps and compatible finite-quotient inflation.

- Use: §§4.4–4.7 — Produces explicit xi, transition corrections and the Tate–Nakayama cocycle.

- Proposed test `Kaletha16.D14.test1`: For trivial Theta the sum has one term.
- Proposed test `Kaletha16.D14.test2`: Zero in either coefficient gives zero.
- Proposed test `Kaletha16.D14.test3`: A cochain not factoring through the required last variables is rejected as an input.

#### T21 — Unbalanced Leibniz identity

**theorem · missing**. §4.3

On the admissible cochain degrees and factorization subspaces of D14, the differential of f unbalanced-cup g is df cup g plus (-1)^deg(f) f cup dg, with the source boundary conventions.

Prerequisites: PAPER-KALETHA-16/D14.

1. Expand finite sums, cancel interior faces and retain the boundary terms. The exact cochain subspaces and all sign cases remain a recursive proof obligation.

#### T22 — Unbalanced finite-level compatibility

**theorem · missing**. §4.3 inhomogeneous formula and coefficient/quotient naturality

The unbalanced product commutes with the coefficient and quotient maps used in§4.4; its inhomogeneous j=1 formula is the sum of f(g1,...,a) tensor g1...a acting on the negative-degree cochain.

Prerequisites: PAPER-KALETHA-16/D14, PAPER-KALETHA-16/T21.

1. Verify each contraction after changing representatives; expose the finite sum rather than treating this operation as ordinary cup product.

#### D15 — Compatible relative Weil sections

**construction · missing**. §4.4;author errata§3

For a cofinal tower E_k/F choose relative Weil sections and representatives of the field-tower cosets compatibly: choose lifts in the Weil group first, then project them to the required coset representatives. Let c_k be the resulting normalized fundamental two-cocycles.

Prerequisites: PAPER-KALETHA-16/P07, PAPER-KALETHA-16/R01, PAPER-KALETHA-16/P06.

- API `Kaletha16.D15.construct` (constructor): Choose the Weil lifts before the coset representatives and sections.
- API `Kaletha16.D15.characterise` (characterisation): Compute each c_k as the section multiplication defect.
- API `Kaletha16.D15.transport` (functoriality): Compare adjacent c_k through the actual quotient map and transfer.

- Use: Lemma4.4 — Supplies the tower identities needed to construct a continuous xi.

- Proposed test `Kaletha16.D15.test1`: A trivial tower uses constant sections.
- Proposed test `Kaletha16.D15.test2`: Identity cosets have the normalized lift1.
- Proposed test `Kaletha16.D15.test3`: Arbitrarily fixing coset representatives first need not admit the prescribed compatible sections.

#### T23 — Relative Weil section product identities

**theorem · missing**. Lemma4.4 first equality

For the corrected sections D15 and sigma,tau in Gal(E_(k+1)/F), c_k(pi(sigma),pi(tau))=product_(v in Gal(E_(k+1)/E_k)) c_(k+1)(v*sigma,zeta_k(pi(tau))).

Prerequisites: PAPER-KALETHA-16/D15.

1. Prove by multiplying the chosen Weil lifts and reindexing cosets; the corrected choice order is required. Split the two identities into separate declarations in the design.

#### D16 — Coherent roots and quotient-torus extensions

**construction · missing**. §4.5,(4.8);author errata§3

Choose positive n_k with every integer eventually dividing n_k and compatible set-theoretic n_k-th root maps l_k on Fbar units. Extend delta_e:Gm->Res_(E_k/F)Gm/Gm and the transition p between these quotient tori, not just their finite u-subgroups.

Prerequisites: PAPER-KALETHA-16/D15, PAPER-KALETHA-16/P09.

- API `Kaletha16.D16.construct` (constructor): Choose compatible root maps and construct the extended quotient-torus homomorphisms.
- API `Kaletha16.D16.characterise` (characterisation): The extensions restrict to the finite-level delta_e and p on torsion.
- API `Kaletha16.D16.transport` (functoriality): Check the norm/power compatibility across adjacent levels.

- Use: Lemma4.5 andLemma4.7 — Types the explicit cochain formulas.

- Proposed test `Kaletha16.D16.test1`: On torsion the extension recovers the map from D01.
- Proposed test `Kaletha16.D16.test2`: At the trivial E=F quotient the map is trivial.
- Proposed test `Kaletha16.D16.test3`: Applying p defined only on u_(k+1) to a non-torsion quotient-torus point is ill typed.

#### D17 — Explicit fundamental cocycles and transitions

**construction · missing**. §4.5,(4.7)–(4.8)

Set xi_k=d(l_k c_k) unbalanced-cup delta_e and alpha_k=(l_k c_k cup delta_e)^(-1) p(l_(k+1)c_(k+1) cup delta_e), using D16 to type both factors. Form W_k from xi_k and its alpha_k-adjusted transition maps.

Prerequisites: PAPER-KALETHA-16/D14, PAPER-KALETHA-16/D16.

- API `Kaletha16.D17.construct` (constructor): Construct xi_k, alpha_k and the adjusted homomorphism W_(k+1)->W_k.
- API `Kaletha16.D17.characterise` (characterisation): Verify alpha_k takes values in u_k and d alpha_k=p(xi_(k+1))/xi_k.
- API `Kaletha16.D17.transport` (functoriality): Compose transitions to form the inverse-limit extension W.

- Use: Theorem4.8 — Provides the concrete representative of the canonical gerbe.

- Proposed test `Kaletha16.D17.test1`: Both factors defining alpha_k have cochain degree1.
- Proposed test `Kaletha16.D17.test2`: A constant compatible level has alpha=1.
- Proposed test `Kaletha16.D17.test3`: The degree-one equality in Lemma4.5 cannot end in a degree-two xi term.

#### T24 — Explicit cocycles represent negative one

**theorem · missing**. Lemma4.5(1)

For D17, alpha_k takes values in u_k and d alpha_k=p(xi_(k+1))*xi_k^-1, so the adjusted W_k transitions are homomorphisms.

Prerequisites: PAPER-KALETHA-16/D17, PAPER-KALETHA-16/T21, PAPER-KALETHA-16/T23, PAPER-KALETHA-16/T03, PAPER-KALETHA-16/T03R, PAPER-KALETHA-16/T23B.

1. Use Leibniz and Weil transfer for the coboundary identity, then evaluate the finite-level local invariant as the negative normalized fraction. The degree error E08 is corrected before differentiation.

#### T25 — Functorial evaluation of xi

**theorem · missing**. Fact4.6

For algebraic phi:u->Z factoring through level k, phi(xi)=d(l_k c_k) unbalanced-cup (phi composed with delta_e), with the finite coefficient maps of Fact4.6.

Prerequisites: PAPER-KALETHA-16/T24, PAPER-KALETHA-16/T22, PAPER-KALETHA-16/T24X.

1. Use coefficient functoriality of the finite contraction; factorization through a finite level is part of the algebraicity input.

#### D18 — Explicit enlarged Tate–Nakayama cocycle

**construction · missing**. §4.6,(4.9)

For a norm-zero lambdabar in Ybar choose k splitting S and killing Ybar/Y. Define z_lambdabar,k(x,sigma)=phi_lambdabar,k(x)*(l_k c_k unbalanced-cup n_k*lambdabar)(sigma). Extend phi to Res_(E_k/F)Gm/Gm by the norm-zero product of conjugate cocharacters when comparing levels.

Prerequisites: PAPER-KALETHA-16/D12, PAPER-KALETHA-16/D17, PAPER-KALETHA-16/T25.

- API `Kaletha16.D18.construct` (constructor): Construct the displayed W_k cocycle.
- API `Kaletha16.D18.characterise` (characterisation): Its u-restriction is D12 and its change under lambdabar+IY is a coboundary.
- API `Kaletha16.D18.transport` (functoriality): Compare adjacent levels using the extended cocharacter map and alpha_k.

- Use: Lemma4.7 andTheorem4.8 — Explicit map from the lattice torsion group to rigid H1.

- Proposed test `Kaletha16.D18.test1`: For Z=1 obtain the ordinary Tate–Nakayama class.
- Proposed test `Kaletha16.D18.test2`: The zero cocharacter gives the neutral class.
- Proposed test `Kaletha16.D18.test3`: Omitting the n_k multiplier or using a finite-only phi on a non-torsion torus point fails the formula.

#### T26 — Cocycle and level independence

**theorem · missing**. Lemma4.7

The cochain D18 is a continuous rigid cocycle and defines a class independent of all sufficiently large k, using the compatible roots, sections and transition maps.

Prerequisites: PAPER-KALETHA-16/D18, PAPER-KALETHA-16/T24, PAPER-KALETHA-16/T24X.

1. Check d z=1 from the xi equation and calculate the adjacent-level ratio. The published penultimate display already uses n_k*lambdabar; retain that fixed version.

#### T27 — Torus enlarged Tate–Nakayama isomorphism

**theorem · missing**. Theorem4.8

For [Z->S] in T over R or finite over Qp, D18 induces a natural isomorphism (Ybar/IY)_tors -> H1(u->W,Z->S), compatible with ordinary Tate–Nakayama at Z=1 and restriction to Hom_Gamma(u,Z).

Prerequisites: PAPER-KALETHA-16/T20, PAPER-KALETHA-16/T26, PAPER-KALETHA-16/P12, PAPER-KALETHA-16/T07.

1. Show IY maps to coboundaries, compare the four-term norm and cohomology exact sequences, and use the outer ordinary Tate–Nakayama identifications and five-lemma argument.

#### T28 — Uniqueness of enlarged Tate–Nakayama

**theorem · missing**. §4.2

There is at most one natural isomorphism from D13 to H1ab on R satisfying ordinary Tate–Nakayama compatibility and the central restriction square specified in§4.2.

Prerequisites: PAPER-KALETHA-16/D13, PAPER-KALETHA-16/D07, PAPER-KALETHA-16/T12, PAPER-KALETHA-16/P12, PAPER-KALETHA-16/T12F.

1. First use anisotropic tori, then their maximal anisotropic subtorus and split quotient, then a fundamental torus surjecting onto the reductive target.

#### T29 — Maximal-torus fibers of abelianized rigid cohomology

**theorem · missing**. Lemma4.9

For every maximal torus S in reductive [Z->G], each nonempty fiber of Ybar_plus,tor(Z->S) -> H1rig(Z->S) -> H1_ab(Z->G) is a torsor under the image of (X_*(Ssc)_Gamma)_tors in Ybar_plus,tor(Z->S).

Prerequisites: PAPER-KALETHA-16/P12, PAPER-KALETHA-16/D07, PAPER-KALETHA-16/T27.

1. Use the Kottwitz central component character comparison and the simply connected torus image; this is not a claim that H1(G) is a group.

#### T30 — Conjugacy independence of reductive classes

**theorem · missing**. Lemma4.10

Cocharacters in two maximal tori identified by geometric conjugation determine the same class in H1ab through the construction D18.

Prerequisites: PAPER-KALETHA-16/P15, PAPER-KALETHA-16/D18, PAPER-KALETHA-16/D07.

1. Lift the conjugation to the appropriate simply connected twist and explicitly compare its two cocycles; their difference belongs to the abelianization equivalence relation.

#### T31 — Reductive enlarged Tate–Nakayama duality

**theorem · missing**. Theorem4.11

For every [Z->G] in R, D13 is naturally isomorphic to H1_ab(u->W,Z->G), compatible with T27 on tori and with ordinary abelianized Tate–Nakayama at Z=1.

Prerequisites: PAPER-KALETHA-16/T27, PAPER-KALETHA-16/T28, PAPER-KALETHA-16/T29, PAPER-KALETHA-16/T30.

1. Reduce through a fundamental torus, identify the coroot quotient using H1(Ssc), and use the relevant Tate H0 vanishing. The target is H1_ab throughout, including the corrected proof diagram.

#### D20 — Rigid inner twists

**definition · missing**. Definition5.1

For connected reductive G/F and finite central Z, a rigid inner twist is (Gprime,psi,z) with psi an inner twist and z in D05 lifting psi^-1 sigma(psi) in Gad.

Prerequisites: PAPER-KALETHA-16/P13, PAPER-KALETHA-16/D05, PAPER-KALETHA-16/T13.

- API `Kaletha16.D20.construct` (constructor): Construct a rigidification from a cocycle lifting the adjoint inner cocycle.
- API `Kaletha16.D20.characterise` (characterisation): Read the underlying inner form and its central restriction.
- API `Kaletha16.D20.transport` (functoriality): Enlarge Z by pushing the same cocycle through the central inclusion.

- Use: §§5.1,5.3 — Fixes transfer-factor and packet normalization.

- Proposed test `Kaletha16.D20.test1`: A pure inner twist has Z=1.
- Proposed test `Kaletha16.D20.test2`: The neutral pair is (G,id,1).
- Proposed test `Kaletha16.D20.test3`: An inner form with no specified lift is not a rigid inner twist.

#### D21 — Rigid inner-twist groupoid

**definition · missing**. §5.1

A morphism (G1,psi1,z1)->(G2,psi2,z2) is (f,g) with f:G1->G2 over F, z2(w)=g z1(w) w(g)^-1 and f psi1=psi2 Ad(g). Compose with the corresponding group elements; all morphisms are invertible.

Prerequisites: PAPER-KALETHA-16/D20.

- API `Kaletha16.D21.construct` (constructor): Construct and compose a morphism from both compatibility equations.
- API `Kaletha16.D21.characterise` (characterisation): Isomorphism classes identify with H1rig(Z->G).
- API `Kaletha16.D21.transport` (functoriality): A morphism transports Gprime(F)-representations by f.

- Use: §5.1 andTheorem5.2 — Makes the compound packet independent of representatives.

- Proposed test `Kaletha16.D21.test1`: An automorphism acts on Gprime(F) by an inner automorphism.
- Proposed test `Kaletha16.D21.test2`: The identity is (id,1).
- Proposed test `Kaletha16.D21.test3`: Equal adjoint cocycles without the rigid cocycle equation do not define a morphism.

#### T40 — Finite fixed-Z classes and enlargement

**theorem · missing**. §5.1 finiteness

For fixed finite central Z, the rigid inner-twist groupoid has finitely many isomorphism classes.

Prerequisites: PAPER-KALETHA-16/D21, PAPER-KALETHA-16/T08.

1. Use the H1 classification for finiteness and the unchanged cocycle morphism equations for full faithfulness.

#### D22 — All rigid twists and K-groups

**definition · missing**. §5.1

Take the filtered union of D21 over finite central Z. Fibers of H1rig->H1ab define the K-groups used here. The all-Z set may be infinite; it need not be infinite, and is not generally functorial under arbitrary reductive homomorphisms.

Prerequisites: PAPER-KALETHA-16/D21, PAPER-KALETHA-16/D07.

- API `Kaletha16.D22.construct` (constructor): Form the central-enlargement colimit groupoid.
- API `Kaletha16.D22.characterise` (characterisation): Recognize K-group membership by equality in H1ab.
- API `Kaletha16.D22.transport` (functoriality): Compare fixed-Z inclusions without asserting arbitrary-G functoriality.

- Use: §§5.2,5.5 — Domain for strong real forms and the relevance condition.

- Proposed test `Kaletha16.D22.test1`: For real SL2 with finite center the union stabilizes and has three classes.
- Proposed test `Kaletha16.D22.test2`: A split torus has a singleton H1rig union.
- Proposed test `Kaletha16.D22.test3`: Distinct K-groups can contain the same underlying inner forms, as for odd unitary groups.

#### D23 — Rigid stable-conjugacy invariant

**construction · missing**. §5.1

For strongly regular delta in G(F), a rigid twist (psi,z), and delta_prime=psi(g delta g^-1) in Gprime(F), inv(delta,delta_prime) is the class of g^-1 z(w) w(g) in H1rig(Z->S), S=Cent_G(delta).

Prerequisites: PAPER-KALETHA-16/D20, PAPER-KALETHA-16/D06.

- API `Kaletha16.D23.construct` (constructor): Construct the S-valued cocycle and its algebraic central restriction.
- API `Kaletha16.D23.characterise` (characterisation): Changing g by S or conjugating delta_prime rationally preserves its class.
- API `Kaletha16.D23.transport` (functoriality): Transport along a rigid groupoid morphism and the canonical stable centralizer identification.

- Use: §5.3 formula(5.1) — Pairs stable-conjugacy data with a refined dual element.

- Proposed test `Kaletha16.D23.test1`: For the neutral twist and delta_prime=delta the class is neutral.
- Proposed test `Kaletha16.D23.test2`: For a torus the centralizer is the whole group.
- Proposed test `Kaletha16.D23.test3`: For a nonneutral twist the target condition is a fiber over [z], not necessarily a neutral kernel.

#### T41 — Stable classes across rigid forms

**theorem · missing**. §5.1 stable-conjugacy discussion

The category of strongly regular representatives stably conjugate to fixed delta across rigid twists, with the morphisms of§5.1, has isomorphism classes H1rig(Z->S). On a fixed rigid twist the rational classes correspond to the fiber of H1rig(S)->H1rig(G) over [z].

Prerequisites: PAPER-KALETHA-16/D23, PAPER-KALETHA-16/D21.

1. Construct a rigid G-cocycle from each S-cocycle and reverse the stable-conjugacy invariant. Track automorphisms before passing to isomorphism classes.

#### D24 — Invariant of admissible torus embeddings

**construction · missing**. §5.1 p594 and§5.6 p615;author errata

For eta:S->G and eta_prime=psi Ad(g) eta, transport g^-1 z(w) w(g) back through eta^-1 to obtain the S-valued embedding invariant. Retain rationality and the admissible geometric conjugacy class.

Prerequisites: PAPER-KALETHA-16/D23, PAPER-KALETHA-16/P14.

- API `Kaletha16.D24.construct` (constructor): Construct the invariant with the explicit eta^-1 transport.
- API `Kaletha16.D24.characterise` (characterisation): It is unchanged by the specified rational conjugacy of embeddings.
- API `Kaletha16.D24.transport` (functoriality): Compare embeddings in successive rigid twists using cocycle multiplication and transport.

- Use: Theorem5.8 anddiagram(5.13) — Labels real representations by torus rigid cohomology.

- Proposed test `Kaletha16.D24.test1`: For eta the literal inclusion the transport is invisible but still typed.
- Proposed test `Kaletha16.D24.test2`: The identity embedding in the neutral twist gives1.
- Proposed test `Kaletha16.D24.test3`: Without eta^-1 the displayed cocycle lives in eta(S), not in S.

#### D25 — Representations of rigid inner twists

**definition · missing**. §5.1

A representation datum is (Gprime,psi,z,pi), with pi irreducible admissible and, for R, taken up to infinitesimal equivalence as in§5.1. Isomorphisms use D21 and representation transport.

Prerequisites: PAPER-KALETHA-16/D21, PAPER-KALETHA-16/P16, PAPER-KALETHA-16/P17.

- API `Kaletha16.D25.construct` (constructor): Attach a representation to a rigid twist.
- API `Kaletha16.D25.characterise` (characterisation): Identify representation data under the rigid groupoid equivalence.
- API `Kaletha16.D25.transport` (functoriality): Transport characters using the induced F-isomorphism.

- Use: §§5.4,5.6 — Constituents of compound packets.

- Proposed test `Kaletha16.D25.test1`: On a fixed rigid twist ordinary representation classes inject into these data.
- Proposed test `Kaletha16.D25.test2`: The trivial representation transports to itself under inner automorphisms.
- Proposed test `Kaletha16.D25.test3`: Isomorphic underlying groups with different rigid cocycles are not silently identified.

#### D26 — Strong real forms

**definition · missing**. §5.2

For real G with chosen conjugation sigma, a strong real form is delta in G(C) semidirect Gamma above sigma with delta squared central of finite order. Its real group is the fixed group of Ad(delta); morphisms are G(C)-conjugations.

Prerequisites: PAPER-KALETHA-16/P13, PAPER-KALETHA-16/D22.

- API `Kaletha16.D26.construct` (constructor): Construct delta and its real fixed group from the finite-order square condition.
- API `Kaletha16.D26.characterise` (characterisation): Conjugate elements define isomorphic strong forms with the specified morphism.
- API `Kaletha16.D26.transport` (functoriality): Map a rigid cocycle to z(1,sigma)*sigma in compatible real gerbe coordinates.

- Use: Theorem5.2 — Comparison with the Adams–Barbasch–Vogan strong-form carrier.

- Proposed test `Kaletha16.D26.test1`: For SL2 the matrices ±J above sigma give compact real forms with distinct rigid labels.
- Proposed test `Kaletha16.D26.test2`: The element sigma gives the original real form.
- Proposed test `Kaletha16.D26.test3`: An element with noncentral square does not define an involution by Ad(delta).

#### T42 — Strong real forms equal all rigid real twists

**theorem · missing**. Theorem5.2

Over R the groupoid of all rigid inner twists, allowing every finite central Z, is equivalent to the strong-real-form groupoid D26.

Prerequisites: PAPER-KALETHA-16/D26, PAPER-KALETHA-16/D22, PAPER-KALETHA-16/D17.

1. Choose the real tower/roots so the transition correction is1, compute the square of z(1,sigma)*sigma, and reconstruct the algebraic u-restriction from that finite-order square. Prove full faithfulness and essential surjectivity, not only a class bijection.

#### D27 — Plus dual central subgroup

**definition · missing**. §5.3

For Gbar=G/Z define Z(Gbar_hat)^+ as the inverse image of Z(G_hat)^Gamma under the dual cover, and take its finite component group. Likewise for a torus use Sbar_hat^+.

Prerequisites: PAPER-KALETHA-16/P14.

- API `Kaletha16.D27.construct` (constructor): Form the inverse image algebraic subgroup and its component group.
- API `Kaletha16.D27.characterise` (characterisation): Identify the exact central-cover maps and their connected kernels.
- API `Kaletha16.D27.transport` (functoriality): Transport along Z-enlargement by the induced dual maps.

- Use: Proposition5.3 — Dual target for abelianized rigid cohomology.

- Proposed test `Kaletha16.D27.test1`: The real norm-one torus with Z=mu2 has a component character group of order4.
- Proposed test `Kaletha16.D27.test2`: Z=1 gives Z(G_hat)^Gamma.
- Proposed test `Kaletha16.D27.test3`: The plus sign is an inverse image, not merely the Gamma-fixed subgroup of the covering group.

#### T43 — Lattice map to dual component characters

**theorem · missing**. Proposition5.3

There is a natural injection D13 -> Hom(pi0 Z(Gbar_hat)^+,Q/Z). It is an isomorphism for p-adic F or for tori; for real reductive G its image is the annihilator of the indicated norm subgroup N_(C/R)Z(Gbar_hat).

Prerequisites: PAPER-KALETHA-16/D27, PAPER-KALETHA-16/D13, PAPER-KALETHA-16/D10.

1. Dualize the character-lattice exact sequence, compute torsion and retain the real norm correction. General real surjectivity is not asserted.

#### T44 — Abelianized rigid dual pairing

**theorem · missing**. Corollary5.4 corrected by author errata

There is a natural pairing H1_ab(u->W,Z->G) × pi0 Z(Gbar_hat)^+ -> Q/Z with trivial left kernel. It is perfect for p-adic F and for tori. Pullback to full rigid H1 is constant on K-groups and need not separate real rigid classes.

Prerequisites: PAPER-KALETHA-16/T31, PAPER-KALETHA-16/T43, PAPER-KALETHA-16/D22.

1. Compose enlarged Tate–Nakayama with the character injection. The source left factor must be H1_ab; the full real SL2 rigid set has a nontrivial fiber.

#### D30 — Ordinary endoscopy and z-pairs

**definition · planned**. §5.3

For a characteristic-zero local reductive G, use ordinary endoscopic data (H,Hext,s,eta), admissible matching of strongly regular classes, and z-pairs (Hz,eta_z) with induced central torus kernel and the required L-embedding.

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Prerequisites: PAPER-KALETHA-16/P14.

- API `Kaletha16.D30.construct` (constructor): Construct an ordinary datum and a compatible z-pair.
- API `Kaletha16.D30.characterise` (characterisation): Test ordinary datum equivalence and the domain of rational matching.
- API `Kaletha16.D30.transport` (functoriality): Transport data through dual isomorphisms, Levi embeddings and central extensions.

- Use: §5.3 — Underlying data for refinement and the transfer factors.

- Proposed test `Kaletha16.D30.test1`: For a torus the identity datum matches itself.
- Proposed test `Kaletha16.D30.test2`: A matching domain may be empty.
- Proposed test `Kaletha16.D30.test3`: A geometric match need not have a rational representative.

#### D31 — Refined endoscopic data

**definition · missing**. §5.3

Relative to finite central Z, refine D30 by a lift dot_s in Z(Hbar_hat)^+ above s. An isomorphism must identify the lifted element in the specified component group, retaining the extra central information discarded by ordinary equivalence.

Prerequisites: PAPER-KALETHA-16/D30, PAPER-KALETHA-16/D27.

- API `Kaletha16.D31.construct` (constructor): Choose the lifted central element and its ordinary image.
- API `Kaletha16.D31.characterise` (characterisation): Test refined isomorphism by equality in pi0 Z(Hbar_hat)^+.
- API `Kaletha16.D31.transport` (functoriality): Forget the lift to ordinary endoscopy or lift further after enlarging Z.

- Use: Formulas(5.1),(5.10) — Argument of the rigid dual character.

- Proposed test `Kaletha16.D31.test1`: For SL2 the two central lifts of a dual element can yield different signs.
- Proposed test `Kaletha16.D31.test2`: The identity refined datum has its distinguished lift.
- Proposed test `Kaletha16.D31.test3`: Ordinary equivalence modulo the dual center alone does not imply refined equivalence.

#### T50 — Finite refinements and enlargement compatibility

**theorem · missing**. §5.3 andFact5.5

Over fixed ordinary endoscopic data there are finitely many isomorphism classes of refinements for fixed Z. Enlargement of Z and a compatible lifted refined datum preserve the cohomological character factor.

Prerequisites: PAPER-KALETHA-16/D31, PAPER-KALETHA-16/T44.

1. Use finiteness of the relevant component groups and functoriality of the perfect torus pairing.

#### D32 — Transfer factors with explicit convention

**definition · planned**. §5.3

Construct the relative factors and absolute normalizations using a-data, chi-data, splittings or Whittaker data, including the four LS/KS convention variants. A ratio identity alone fixes an absolute factor only up to C units; phase-only ambiguity requires a separately fixed modulus.

Planned: EndoscopicTransferAndUnitaryTraceComparison:ET.1.

Prerequisites: PAPER-KALETHA-16/D30, PAPER-KALETHA-16/P12.

- API `Kaletha16.D32.construct` (constructor): Construct each named factor from its auxiliary data and normalization.
- API `Kaletha16.D32.characterise` (characterisation): Recover the relative factor as the ratio of two absolute values on related regular pairs.
- API `Kaletha16.D32.transport` (functoriality): Transport auxiliary data and reciprocity conventions with the stated correction factors.

- Use: Proposition5.6 — Ordinary normalized supplier to the rigid correction.

- Proposed test `Kaletha16.D32.test1`: Multiplying all nonzero absolute values by2 preserves every relative ratio.
- Proposed test `Kaletha16.D32.test2`: A fixed Whittaker datum fixes the prescribed quasi-split normalization.
- Proposed test `Kaletha16.D32.test3`: Mixing Delta and Delta-prime without changing the dual element or pairing sign is rejected.

#### D33 — Rigid normalized absolute transfer factor

**construction · missing**. (5.1)

For a rigid twist (psi,z), refined datum dot_e, z-pair, and related strongly regular gamma_z,delta_prime, choose a stably related delta in the quasi-split G. Define Delta_rig=Delta_base(gamma_z,delta)*exp(2pi i pairing(inv(delta,delta_prime),dot_s))^-1.

Prerequisites: PAPER-KALETHA-16/D23, PAPER-KALETHA-16/T44, PAPER-KALETHA-16/D31, PAPER-KALETHA-16/D32.

- API `Kaletha16.D33.construct` (constructor): Construct the factor using a matching quasi-split representative.
- API `Kaletha16.D33.characterise` (characterisation): Separate the base absolute normalization from the inverse rigid character factor.
- API `Kaletha16.D33.transport` (functoriality): Transport the base normalization coherently under an isomorphism of endoscopic data.

- Use: Proposition5.6 — Fixes the missing normalization on non-quasi-split groups.

- Proposed test `Kaletha16.D33.test1`: For the neutral rigid twist the correction is1.
- Proposed test `Kaletha16.D33.test2`: For a torus central character of order3 the inverse changes the primitive root to its inverse.
- Proposed test `Kaletha16.D33.test3`: Independently rescaling only one transported base factor breaks the claimed invariance.

#### T51 — Independence of the matching quasi-split representative

**theorem · missing**. Proposition5.6 first assertion

The factor D33 is independent of the chosen stably related delta and satisfies the relative transfer-factor identity for Gprime.

Prerequisites: PAPER-KALETHA-16/D33, PAPER-KALETHA-16/P12, PAPER-KALETHA-16/D34.

1. Compare the two stable-conjugacy cocycles through the torus-complex relative factor. Cancellation uses the inverse character convention.

#### T52 — Rigid and refined isomorphism invariance

**theorem · missing**. Proposition5.6 remaining assertions

The factor D33 is invariant under isomorphisms of rigid twists and refined endoscopic data when the base absolute normalization is transported with those data, and compatible with the central enlargement in T50.

Prerequisites: PAPER-KALETHA-16/D33, PAPER-KALETHA-16/T50, PAPER-KALETHA-16/D21.

1. Compute the central coboundary and conjugation changes in the torus pairing and cancel them against the transported base factor.

#### D34 — Relative-transfer comparison tori

**construction · missing**. ProofProposition5.6 pp604–607

For matching pairs with centralizers S1,S2, use U=(S1sc×S2sc)/anti Z(Gsc) and V=(S1×S2)/anti Z(G), their central-pair variants and the dual comparison maps. The two section defects coincide, producing the relative U-cocycle.

Prerequisites: PAPER-KALETHA-16/P12, PAPER-KALETHA-16/P14, PAPER-KALETHA-16/D23.

- API `Kaletha16.D34.construct` (constructor): Construct U,V and the central quotient maps with antidiagonal embeddings.
- API `Kaletha16.D34.characterise` (characterisation): The product of the two relative cochains descends to a cocycle because their differentials agree.
- API `Kaletha16.D34.transport` (functoriality): Compare the dual lifted elements and the rigid/ordinary Tate–Nakayama evaluations through U and V.

- Use: Proposition5.6 andProposition5.10 — Common comparison diagram for geometric and spectral transfer.

- Proposed test `Kaletha16.D34.test1`: For identical matching pairs the relative class is neutral.
- Proposed test `Kaletha16.D34.test2`: For torus G the simply connected terms are trivial.
- Proposed test `Kaletha16.D34.test3`: Using the same symbol g without the index i in each centralizer cochain leaves the expression ill typed.

#### D35 — Tempered parameters and lifted centralizers

**definition · missing**. §5.4

For quasi-split G and tempered phi:W_Fprime->L G, with the real Weil group for R and the Weil–Deligne SL2 factor in the p-adic case, set S_phi=Cent_Ghat(phi) and S_phi^+ its inverse image under Gbar_hat->Ghat. Retain continuity, semisimplicity, bounded Weil image and algebraicity of the SL2 factor.

Prerequisites: PAPER-KALETHA-16/P14, PAPER-KALETHA-16/D27, PAPER-KALETHA-16/R01, PAPER-KALETHA-16/P07, PAPER-KALETHA-16/P17.

- API `Kaletha16.D35.construct` (constructor): Form the parameter and its centralizers.
- API `Kaletha16.D35.characterise` (characterisation): Compute the finite component group pi0 S_phi^+ and its central restriction from pi0 Z(Gbar_hat)^+.
- API `Kaletha16.D35.transport` (functoriality): Transport parameters and centralizers under conjugation and Z-enlargement.

- Use: Diagram(5.7) — Finite group governing the conjectural compound packet.

- Proposed test `Kaletha16.D35.test1`: A projective V4 parameter for p-adic SL2 has lifted centralizer Q8.
- Proposed test `Kaletha16.D35.test2`: For a torus the centralizer is the whole dual torus.
- Proposed test `Kaletha16.D35.test3`: The lifted component group need not be abelian in the p-adic case.

#### C01 — Refined local Langlands conjecture

**construction · missing**. §5.4,diagram(5.7)

Conjectural specification: for each tempered phi, a Whittaker-normalized bijection from the compound packet of D25 across all Z-rigid twists to Irr(pi0 S_phi^+) commutes with the central-character map determined by T44; the trivial character labels the unique generic member on the quasi-split form. This is not asserted proved for general p-adic G.

Prerequisites: PAPER-KALETHA-16/D35, PAPER-KALETHA-16/D25, PAPER-KALETHA-16/T44.

- API `Kaletha16.C01.construct` (constructor): State the conjecture as a proposition with the packet, central-character square and Whittaker normalization explicit.
- API `Kaletha16.C01.characterise` (characterisation): Specialize its fiber over a rigid inner twist and its relevance condition.
- API `Kaletha16.C01.transport` (functoriality): Formulate compatibility under increasing Z.

- Use: §§5.4,5.7 — States the unproved local input separately from the proved real case.

- Proposed test `Kaletha16.C01.test1`: The neutral generic member has trivial label.
- Proposed test `Kaletha16.C01.test2`: An irrelevant inner form has an empty packet fiber.
- Proposed test `Kaletha16.C01.test3`: A conjectural packet bijection cannot be used as an unconditional p-adic theorem.

#### C02 — Stable and endoscopic packet distributions

**construction · missing**. §5.4,(5.8),(5.11)

Conditional on C01, for a fixed rigid twist form the stable candidate e(Gprime) sum_pi dim(rho_pi) Theta_pi and, for dot_s, the weighted distribution e(Gprime) sum_pi tr(rho_pi(dot_s)) Theta_pi. The stability and matching-function character identity are separately conjectured in general.

Prerequisites: PAPER-KALETHA-16/C01, PAPER-KALETHA-16/D32, PAPER-KALETHA-16/P16, PAPER-KALETHA-16/P17.

- API `Kaletha16.C02.construct` (constructor): Construct the finite dimension-weighted and trace-weighted sums.
- API `Kaletha16.C02.characterise` (characterisation): State stability and endoscopic transfer as propositions, with the matching-function domain.
- API `Kaletha16.C02.transport` (functoriality): Transport the distributions across rigid-twist isomorphisms.

- Use: §5.6 — Targets proved using Shelstad for R.

- Proposed test `Kaletha16.C02.test1`: For Q8 the central-negative representation contributes dimension2 to the stable sum.
- Proposed test `Kaletha16.C02.test2`: An empty packet yields zero.
- Proposed test `Kaletha16.C02.test3`: Replacing every character trace by1 fails for the two-dimensional Q8 representation.

#### D36 — Prime-convention rigid transfer

**construction · missing**. (5.10);§5.6

Define Delta_prime_rig=Delta_prime_base times exp(2pi i pairing(inv,dot_s)), with the positive character factor. Compare Delta_prime for e with Delta for the inverted datum e^-1 exactly as in§5.6.

Prerequisites: PAPER-KALETHA-16/D33, PAPER-KALETHA-16/D32.

- API `Kaletha16.D36.construct` (constructor): Construct the positive-pairing prime normalization.
- API `Kaletha16.D36.characterise` (characterisation): Prove the inversion-of-endoscopic-element convention conversion.
- API `Kaletha16.D36.transport` (functoriality): Use the same Whittaker and z-pair data in geometric and spectral comparison.

- Use: Proposition5.10 — Normalization used in the character identity.

- Proposed test `Kaletha16.D36.test1`: At an order3 character the prime correction is the inverse of the unprimed correction.
- Proposed test `Kaletha16.D36.test2`: For trivial rigid invariant both equal their respective base factors.
- Proposed test `Kaletha16.D36.test3`: The real order2 case alone cannot detect the sign convention.

#### T53 — Quaternion component-group example

**theorem · missing**. §5.4 example pp610–611

For the p-adic SL2 parameter of§5.4 with projective centralizer V4, S_phi^+=Q8. Its irreducibles have dimensions1,1,1,1,2; four have positive central character and one negative central character. The example has four split SL2 members and one inner SL1(D) member, with the latter dimension weight2.

Prerequisites: PAPER-KALETHA-16/D35, PAPER-KALETHA-16/C01.

1. Compute the lift in SL2(C) and its character table. The identification of the local packets uses the cited SL2 classification; the finite character computation alone is not a proof of that LLC example.

#### T54 — Relevance and central-character annihilator

**theorem · missing**. Lemma5.7

A character of pi0 Z(Gbar_hat)^+ trivial on the kernel of its map to pi0 S_phi^+ corresponds under T44 to a relevant K-group for phi; over R this is a K-group condition, not a claim that every rigid twist in it is individually relevant.

Prerequisites: PAPER-KALETHA-16/D35, PAPER-KALETHA-16/T44, PAPER-KALETHA-16/D22, PAPER-KALETHA-16/P11.

1. Enlarge Z to contain the derived center, reduce to a minimal Levi for phi and compute the component kernel. Import Arthur1.1 and Kottwitz6.2 with their precise relevance hypotheses.

#### R01 — Real Weil group and real parameters

**definition · missing**. §§2,5.6

The real Weil group is C units union j C units with j z j^-1=conjugate(z) and j squared=-1. A real L-parameter is a continuous admissible homomorphism into the L-group over W_R, with temperedness given by bounded dual-group image.

Prerequisites: PAPER-KALETHA-16/P14.

- API `Kaletha16.R01.construct` (constructor): Construct W_R with its topology and multiplication.
- API `Kaletha16.R01.characterise` (characterisation): Recover the two cosets, conjugation action and square relation.
- API `Kaletha16.R01.transport` (functoriality): Transport a parameter by dual-group conjugation and restriction to C units.

- Use: §5.6 discrete and general cases — Common real parameter carrier; import ordinary archimedean reciprocity rather than constructing a second Artin map.

- Proposed test `Kaletha16.R01.test1`: The square relation forces phi(j)^2=phi(-1).
- Proposed test `Kaletha16.R01.test2`: The trivial dual-group parameter is allowed.
- Proposed test `Kaletha16.R01.test3`: Replacing W_R by Gamma_R loses the j squared=-1 condition.

#### R02 — Discrete real parameter torus and weights

**definition · missing**. §5.6 pp614–615

For a discrete real parameter, choose a dual Borel pair normalized by phi(W_R), write its C-unit restriction using dominant regular mu and the lambda datum with the quotient ambiguity specified in§5.6, and give X its phi(j)-twisted Galois action. This defines the real torus S and the admissible geometric class of S-embeddings.

Prerequisites: PAPER-KALETHA-16/R01, PAPER-KALETHA-16/P14.

- API `Kaletha16.R02.construct` (constructor): Construct the twisted character lattice and corresponding real torus.
- API `Kaletha16.R02.characterise` (characterisation): Identify the allowed lambda changes and the regular dominant mu condition.
- API `Kaletha16.R02.transport` (functoriality): Transport the admissible embedding class through an inner twist.

- Use: Diagram(5.13) — Torus whose rigid cohomology labels discrete series.

- Proposed test `Kaletha16.R02.test1`: An elliptic torus produces the discrete-series parameter torus.
- Proposed test `Kaletha16.R02.test2`: Changing lambda by its stated lattice ambiguity preserves the parameter class.
- Proposed test `Kaletha16.R02.test3`: Singular mu belongs to the later tempered reduction, not this discrete contract.

#### R03 — Discrete series from admissible torus embeddings

**theorem · missing**. §5.6 discrete case

For a discrete real phi and an inner form relevant to it, rational conjugacy classes of admissible S-embeddings label its discrete-series packet by the Langlands–Shelstad character construction Theta(eta(mu),eta(lambda),eta(Psi)); across all rigid twists use the corresponding embedding data.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/R02, PAPER-KALETHA-16/P16, PAPER-KALETHA-16/D24, PAPER-KALETHA-16/P18.

1. Read Langlands and Shelstad for existence, irreducibility and the exact equivalence of embedding classes. This supplier is not closed by the character notation alone.

#### R04 — Whittaker-normalized discrete member

**theorem · missing**. §5.6 p615

For quasi-split real G, a fixed Whittaker datum selects a unique generic member of the discrete packet, hence its embedding eta_w, with the normalization used in§5.6.

Prerequisites: PAPER-KALETHA-16/R03, PAPER-KALETHA-16/P16.

1. Import the Kostant/Vogan genericity result and its compatibility with the chosen positive roots; no generic member is assumed for every inner form.

#### R05 — Discrete compound packet bijection

**theorem · missing**. §5.6 diagram(5.13)

For discrete real phi, pi maps to inv(eta_w,eta_pi) in H1rig(Z->S); through the perfect torus pairing this gives a Whittaker-normalized bijection with Irr(pi0 S_phi^+), commuting with central characters and Z-enlargement.

Prerequisites: PAPER-KALETHA-16/R03, PAPER-KALETHA-16/R04, PAPER-KALETHA-16/D24, PAPER-KALETHA-16/T27, PAPER-KALETHA-16/T44.

1. Apply the all-rigid embedding classification and torus duality; explicitly transport through eta_w^-1 in the invariant.

#### R06 — Minimal cuspidal Levi and R-group roots

**definition · missing**. §5.6 pp615–616

For tempered real phi choose its minimal cuspidal Levi M, where it is discrete. With a maximal torus T_phi in S_phi^0, split the relevant normalizer quotient as W(S_phi^0) semidirect R_phi. Define Delta_phi^vee by vanishing on mu and zero sum over its R_phi orbit, as in§5.6.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/D35, PAPER-KALETHA-16/R02.

- API `Kaletha16.R06.construct` (constructor): Construct M, the centralizer Weyl quotient and R_phi.
- API `Kaletha16.R06.characterise` (characterisation): Select the coroots satisfying both displayed parameter conditions.
- API `Kaletha16.R06.transport` (functoriality): Transport this root subsystem under parameter conjugation.

- Use: Cayley reduction — Identifies the roots that enlarge M to the limit-discrete Levi.

- Proposed test `Kaletha16.R06.test1`: For discrete phi the singular subsystem is empty.
- Proposed test `Kaletha16.R06.test2`: For a rank-one singular parameter it can be A1.
- Proposed test `Kaletha16.R06.test3`: Vanishing on mu alone does not impose the orbit-sum condition.

#### R07 — Orthogonal A1 root subsystem

**theorem · missing**. §5.6 p616;Shelstad1982

The roots selected in R06 form a root system of type A1^r; phi(j) fixes their roots and acts by -1 on the relevant root spaces.

Prerequisites: PAPER-KALETHA-16/R06.

1. Use the parameter centralizer/R-group analysis in Shelstad. Orthogonality makes the positive-root Cayley factors commute; it does not authorize multiplying both signs of each root.

#### R08 — Corrected Cayley transform

**construction · missing**. §5.6 p616, corrected usingShelstad1982 p423

Choose one positive root from every opposite pair in Delta_phi^vee. For compatible root vectors put s_alpha=exp(i pi (X_alpha+X_-alpha)/4) and s=product of those positive-root factors. With theta=Ad(phi(j)), use s_alpha theta(s_alpha)^-1=s_alpha^2 and its reflection image in the Weyl group.

Prerequisites: PAPER-KALETHA-16/R07.

- API `Kaletha16.R08.construct` (constructor): Construct the individual Cayley factors and the positive-root product.
- API `Kaletha16.R08.characterise` (characterisation): Compute theta(s_alpha)=s_alpha^-1 and the twisted-conjugation Weyl reflection.
- API `Kaletha16.R08.transport` (functoriality): Changing compatible choices transports the resulting Levi and parameter through the prescribed conjugacy.

- Use: Theorem5.8 — Corrects the printed construction before it is used in the real proof.

- Proposed test `Kaletha16.R08.test1`: For rank one, A=I+iK gives A theta(A)=2I but A squared=2iK.
- Proposed test `Kaletha16.R08.test2`: For an empty subsystem s=1.
- Proposed test `Kaletha16.R08.test3`: Multiplying over both alpha and -alpha squares the Weyl reflection and destroys the rank-one reduction.

#### R09 — Limit-discrete parameter and coherent continuation

**construction · missing**. §5.6 pp616–617

Conjugate phi by the corrected s to obtain phi1 in the enlarged Levi M1. Choose a sufficiently dominant regular shift nu and coherently continue the discrete character at mu+nu to mu; the output is zero or an irreducible limit of discrete series.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/R08, PAPER-KALETHA-16/R03.

- API `Kaletha16.R09.construct` (constructor): Construct M1 and phi1 with their embedding into G.
- API `Kaletha16.R09.characterise` (characterisation): State coherent continuation with the chosen shift and its zero-or-irreducible alternative.
- API `Kaletha16.R09.transport` (functoriality): Transport the output under admissible torus embeddings and compatible positive systems.

- Use: Theorem5.8 — Produces the tempered packet by induction from M1.

- Proposed test `Kaletha16.R09.test1`: A regular parameter requires no singular continuation.
- Proposed test `Kaletha16.R09.test2`: A compact imaginary obstruction can make the continuation zero.
- Proposed test `Kaletha16.R09.test3`: One cannot declare every coherent continuation nonzero.

#### R10 — Noncompact-root criterion

**theorem · missing**. §5.6 pp617–618 nonvanishing criterion

The coherent continuation in R09 attached to eta is nonzero exactly when every root eta(Delta_phi) is noncompact imaginary.

Prerequisites: PAPER-KALETHA-16/R09, PAPER-KALETHA-16/P16.

1. Use the original limit-discrete-series and irreducibility results, with the special enlarged cuspidal Levi M1, not arbitrary tempered parabolic induction.

#### R11 — Real tempered packet embedding classification

**theorem · missing**. Theorem5.8

For every tempered real phi, the admissible embedding classes satisfying the noncompact-root condition of R10 correspond bijectively to its packet on a fixed inner form; the construction includes an empty set for an irrelevant form.

Prerequisites: PAPER-KALETHA-16/R10, PAPER-KALETHA-16/R03, PAPER-KALETHA-16/R10I.

1. Combine coherent continuation, the irreducible induction theorem and Langlands classification; retain the root condition when passing across rigid twists.

#### R12 — Levi injectivity in rigid cohomology

**theorem · missing**. §5.6 afterTheorem5.8

For the real Levi M1 used above, H1rig(Z->M1)->H1rig(Z->G) is injective in the comparison needed for the packet construction.

Prerequisites: PAPER-KALETHA-16/T06, PAPER-KALETHA-16/R09.

1. Use injectivity of ordinary Levi H1 together with the central restriction sequence. Supply the original ordinary Levi proof as a recursive leaf.

#### R13 — Parity description of the packet image

**theorem · missing**. §5.6 pp618–619

The injection of the real compound packet into H1rig(Z->S), obtained via the regular M1 packet, has image the classes whose image x in the adjoint torus cocharacter coinvariants satisfies <x,alpha> even for every alpha in Delta_phi.

Prerequisites: PAPER-KALETHA-16/R11, PAPER-KALETHA-16/R12, PAPER-KALETHA-16/R05, PAPER-KALETHA-16/T27.

1. Translate the noncompact imaginary-root condition by real Tate–Nakayama. Check that parity is independent of the lattice representative.

#### R14 — Root-sign component subgroup

**definition · missing**. §5.6 p619

Map the reflection generators of Omega(Delta_phi) to the component classes alpha(-1) in pi0(Sbar_hat^+). Their image is the annihilator of the parity subgroup in R13 under the torus pairing.

Prerequisites: PAPER-KALETHA-16/R07, PAPER-KALETHA-16/D27, PAPER-KALETHA-16/R13.

- API `Kaletha16.R14.construct` (constructor): Construct the root-sign homomorphism from the A1^r Weyl group.
- API `Kaletha16.R14.characterise` (characterisation): Identify its character annihilator with the even-pairing classes.
- API `Kaletha16.R14.transport` (functoriality): Transport the map through the Cayley identification and central covers.

- Use: Proposition5.9 — Quotient converting the torus labels into parameter-centralizer labels.

- Proposed test `Kaletha16.R14.test1`: A single A1 contributes the class alpha(-1).
- Proposed test `Kaletha16.R14.test2`: An empty subsystem contributes the trivial subgroup.
- Proposed test `Kaletha16.R14.test3`: The target component group may contain elements of order4, so it is not identified wholesale with a sign vector space.

#### R15 — Exact real component-group sequence

**theorem · missing**. Proposition5.9

For phi1 and S as above, Omega(Delta_phi)->pi0(Sbar_hat^+)->pi0(S_phi1^+)->1 is exact. Consequently the real lifted component group here is abelian, without an assertion that it has exponent2.

Prerequisites: PAPER-KALETHA-16/R14, PAPER-KALETHA-16/T54.

1. Shelstad supplies representatives meeting every component. Show alpha(-1) lies in the identity component using the explicit path alpha(exp(i pi t)); identify the full kernel by the K-group/relevance and packet cardinality argument.

#### R16 — Refined real tempered packet theorem

**theorem · missing**. §5.6 conclusion afterProposition5.9

For every real connected reductive G, fixed finite central Z and Whittaker datum on its quasi-split form, every tempered phi has the compound packet bijection of C01 with Irr(pi0 S_phi^+), including the central-character square, generic normalization and Z-functoriality.

Prerequisites: PAPER-KALETHA-16/R13, PAPER-KALETHA-16/R15, PAPER-KALETHA-16/R04, PAPER-KALETHA-16/T54.

1. Dualize the exact component sequence, identify the parity image, and carry the discrete normalization through the Cayley/induction construction. This is the proved real case, not a proof of C01 for p-adic G.

#### R17 — Stable real packet character

**theorem · missing**. §5.6,invokingShelstad1979/2008

For every fixed rigid real inner twist, e(Gprime) times the sum of the characters in its tempered packet (the real component labels are one-dimensional) is stable.

Prerequisites: PAPER-KALETHA-16/R16, PAPER-KALETHA-16/C02, PAPER-KALETHA-16/P18.

1. Use Shelstad stable-character theorems, first discrete then coherent continuation and Levi induction; stability is a separate theorem from the labeling bijection.

#### R18 — Real spectral transfer factor

**definition · missing**. §5.6 pp621–623

For a refined real endoscopic datum, its z-pair parameter phi_z and a member pi of the Gprime packet, use Shelstad spectral transfer on related parameters and set it to zero outside its related domain. The geometric factor is D36.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/D36, PAPER-KALETHA-16/R16, PAPER-KALETHA-16/D30, PAPER-KALETHA-16/P18.

- API `Kaletha16.R18.construct` (constructor): Construct the related-parameter spectral factor with the geometric normalization specified.
- API `Kaletha16.R18.characterise` (characterisation): Compare it to the product of the compatible factor and geometric factor on regular parameters.
- API `Kaletha16.R18.transport` (functoriality): Extend from regular parameters by coherent continuation and the stated Levi descent.

- Use: Proposition5.10 — Bridge from geometric rigid normalization to packet character labels.

- Proposed test `Kaletha16.R18.test1`: An unrelated parameter gives zero.
- Proposed test `Kaletha16.R18.test2`: The quasi-split generic member has the Whittaker-normalized value.
- Proposed test `Kaletha16.R18.test3`: Changing geometric normalization while keeping the spectral factor fixed violates the compatibility identity.

#### R19 — Spectral factor equals rigid packet character

**theorem · missing**. Proposition5.10

With D36 as geometric normalization, the real spectral factor is e(Gprime)*<dot_s,pi>, where the bracket is the character label from R16 evaluated at dot_s.

Prerequisites: PAPER-KALETHA-16/R18, PAPER-KALETHA-16/D34, PAPER-KALETHA-16/R16.

1. Convert Delta-prime to inverse endoscopic data, descend to M1, use Whittaker descent and e(M1prime)=e(Gprime), then compare the toral III terms via D34. Exact original descent discriminants and signs remain a source-closure gate.

#### R20 — Real endoscopic character identities

**theorem · missing**. §5.6 final conclusion

For every tempered real parameter and related refined endoscopic datum, matching test functions for Delta-prime_rig satisfy the endoscopic character identity (5.11), with the weights tr(rho_pi(dot_s)) and the Kottwitz sign specified in C02.

Prerequisites: PAPER-KALETHA-16/R19, PAPER-KALETHA-16/R17, PAPER-KALETHA-16/C02.

1. Insert R19 into Shelstad spectral transfer and retain the zero convention outside the related domain. No global trace formula or non-tempered ABV comparison is asserted.

#### G01 — Global rigid gerbe and localization interface

**definition · missing**. §5.7 pp624–625

For a number field F and the place/lift choices dot_V of Kal15b, import its profinite multiplicative P_dotV, extension E_xi,dotV, algebraic central-pair cocycles and localization maps to the local rigid cocycles modulo central coboundaries. The detailed global carrier is an external supplier, not constructed by this overview.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/D05, PAPER-KALETHA-16/D06.

- API `Kaletha16.G01.construct` (constructor): Specify the global central-pair cocycle and the exact place-choice data of Kal15b.
- API `Kaletha16.G01.characterise` (characterisation): Localizations have the stated ambiguity B1(Gamma_v,Z), which vanishes in the barred local cocycle quotient.
- API `Kaletha16.G01.transport` (functoriality): Compare choices of lifts and finite central enlargement by the global theorem.

- Use: Global product andpacket pairing — The source construction and all global hypotheses remain an explicit extraction gap.

- Proposed test `Kaletha16.G01.test1`: A neutral global cocycle localizes to neutral classes.
- Proposed test `Kaletha16.G01.test2`: At almost all places the appropriate integral/unramified statement requires its original theorem.
- Proposed test `Kaletha16.G01.test3`: Localization is not asserted canonical on raw local Z1 without quotienting central coboundaries.

#### G02 — Global Tate–Nakayama interface

**theorem · missing**. §5.7 p625

Kal15b Theorems3.44–3.45 give the global enlarged Tate–Nakayama description and its compatibility with all localizations of G01 for the stated central pairs and global lattice conditions.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/G01, PAPER-KALETHA-16/T31.

1. Read and split the original global coefficient and lattice conditions before treating this summary as a closed theorem contract; the local theorem alone does not imply it.

#### G03 — Global rigid lift of an inner twist

**theorem · missing**. §5.7,Kal15b Lemma3.29

For quasi-split number-field G with Gder simply connected as assumed in§5.7, the adjoint cocycle of an inner twist psi lifts through the global gerbe to a cocycle with central pair Z(Gsc)->Gsc; its localizations rigidify each local twist.

Prerequisites: PAPER-KALETHA-16/G01, PAPER-KALETHA-16/P13.

1. Apply the original global lifting theorem and track the induced map Gsc->G. This is the overview hypothesis package, not a claim for arbitrary global G without reduction.

#### G04 — Localized refined endoscopic lifts

**construction · missing**. §5.7 p626

For the global endoscopic datum and z-pair of§5.7, choose s_sc lifting the adjoint dual element and central y_v so s_der*y_v is Gamma_v-invariant. Let dot_s_v=(s_sc,y_v) in the dual cover for the physical central subgroup Z(Gsc).

Prerequisites: PAPER-KALETHA-16/D31, PAPER-KALETHA-16/G03.

- API `Kaletha16.G04.construct` (constructor): Construct each local refined datum from s_sc and y_v.
- API `Kaletha16.G04.characterise` (characterisation): Check that the local obstruction vanishes and dot_s_v belongs to the required plus subgroup.
- API `Kaletha16.G04.transport` (functoriality): Compare local choices of y_v and the global lift through central characters.

- Use: Kal15b Proposition4.1 — Uses the corrected physical/dual group notation.

- Proposed test `Kaletha16.G04.test1`: A globally invariant lift allows the compatible trivial correction where defined.
- Proposed test `Kaletha16.G04.test2`: The central subgroup used to rigidify lies in G, over F.
- Proposed test `Kaletha16.G04.test3`: Z of the complex dual simply connected group is not a central F-subgroup of G.

#### G05 — Adelic product of rigid transfer factors

**theorem · missing**. §5.7 pp626–627

Under§5.7 assumptions, including the existence of one rational related strongly regular pair, the canonical adelic transfer factor equals the product of the local Whittaker-normalized rigid transfer factors formed from G03–G04. The normalized unramified local factors are1 almost everywhere. This is unconditional, via Kal15b Proposition4.1.

Prerequisites: PAPER-KALETHA-16/G04, PAPER-KALETHA-16/D33, PAPER-KALETHA-16/G02.

1. Import the actual global product theorem and its unramified normalization. If no rational related pair exists the adelic factor is identically zero; do not apply the displayed nonzero product argument without its hypothesis.

#### G06 — Conditional adelic packet and global label group

**construction · missing**. §5.7 pp627–628

Assume the local conjecture C01 and the conjectural global Langlands group used in§5.7. For a discrete generic global parameter phi, form its finite adjoint centralizer component group with locally trivial obstruction, and the restricted tensor-product packet whose local labels are trivial at almost every unramified place.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/C01, PAPER-KALETHA-16/G04.

- API `Kaletha16.G06.construct` (constructor): State the global-parameter and local-packet assumptions explicitly.
- API `Kaletha16.G06.characterise` (characterisation): Construct the restricted tensor-product packet and its finite global component group.
- API `Kaletha16.G06.transport` (functoriality): Localize the parameter and centralizer elements with their obstruction condition.

- Use: Kal15b Proposition4.2 — Domain of the conditional adelic pairing.

- Proposed test `Kaletha16.G06.test1`: Trivial labels almost everywhere make each product finite.
- Proposed test `Kaletha16.G06.test2`: An inadmissible local factor prevents membership in the packet.
- Proposed test `Kaletha16.G06.test3`: The conjectural global Langlands group is not claimed as an existing mathematical construction.

#### G07 — Conditional adelic character pairing

**theorem · missing**. §5.7,Kal15b Proposition4.2

Under G06, the product of the local packet character evaluations defines a finite-dimensional character of the global component group, independent of s_sc, the y_v and the global rigidifying cocycle choices in the stated sense.

Prerequisites: PAPER-KALETHA-16/G06, PAPER-KALETHA-16/G02, PAPER-KALETHA-16/T44.

1. Use the global Tate–Nakayama product relation and almost-everywhere triviality; this theorem remains conditional on the packet/global-parameter assumptions.

#### G08 — Conjectural discrete multiplicity formula

**construction · missing**. Conjecture5.11

For the tempered discrete automorphic representation and global parameter setting of§5.7, Conjecture5.11 predicts its multiplicity as the sum over relevant global parameters of the invariant dimension of the G07 character, equivalently the average of that character over the finite global component group.

Prerequisites: PAPER-KALETHA-16/G07, PAPER-KALETHA-16/G06.

- API `Kaletha16.G08.construct` (constructor): State the conjecture with the summation domain and finite character average.
- API `Kaletha16.G08.characterise` (characterisation): Identify invariant dimension with the average over the finite group.
- API `Kaletha16.G08.transport` (functoriality): Check invariance under the auxiliary choices already covered by G07.

- Use: §5.7 — Records the proposed global endpoint without claiming a proof.

- Proposed test `Kaletha16.G08.test1`: The trivial character of a finite group has invariant dimension1.
- Proposed test `Kaletha16.G08.test2`: A nontrivial one-dimensional character has invariant dimension0.
- Proposed test `Kaletha16.G08.test3`: The equality with automorphic multiplicity is not inferred from the finite character identity.

#### G09 — Unconditional mediating functions and globalization

**theorem · missing**. §5.7 pp629–630

The rigid local factors and global product theorem provide the mediating functions with product normalization1 and the globalization input called Arthur Hypothesis9.5.1 in§5.7, through Kal15b Proposition4.1.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/G05.

1. Read the original globalization statement and all place/auxiliary-data restrictions; it is independent of the unproved local packet bijections. The precise statement remains a recursive-source gap.

#### G10 — Conditional spectral mediating formula

**theorem · missing**. §5.7 p630

Assuming the local refined packet conjecture, the spectral mediating factors in§5.7 are expressed by the local packet character evaluations with the global rigidifying data; this additional spectral conclusion is conditional even though G09 is unconditional.

The source endpoint is recorded, but original-source definitions or auxiliary hypotheses still need declaration-sized decomposition. This contract is not a closed blueprint.

Prerequisites: PAPER-KALETHA-16/G09, PAPER-KALETHA-16/C01, PAPER-KALETHA-16/G07.

1. Separate the geometric product proof from the use of local spectral transfer. The paper states a conditional application, not a global multiplicity theorem.

#### P18 — Real distribution characters

**definition · missing**. §§5.1,5.6 prerequisite

For a finite-length admissible representation of a real reductive group in the Harish–Chandra/globalization category, define its trace distribution on compactly supported smooth test functions with fixed Haar measure; prove conjugacy invariance and representability by the regular semisimple character function in the source setting.

Prerequisites: PAPER-KALETHA-16/P16.

- API `Kaletha16.P18.construct` (constructor): Construct the integrated trace distribution with its measure convention.
- API `Kaletha16.P18.characterise` (characterisation): Identify its restriction to regular semisimple elements with the Harish–Chandra character.
- API `Kaletha16.P18.transport` (functoriality): Transport the distribution through a real group isomorphism and infinitesimal equivalence.

- Use: R03,R17,R18 — Generic real analytic foundation imported by the full packet and transfer proofs.

- Proposed test `Kaletha16.P18.test1`: A one-dimensional torus character integrates against the chosen Haar measure.
- Proposed test `Kaletha16.P18.test2`: The zero virtual representation has zero character distribution.
- Proposed test `Kaletha16.P18.test3`: Pointwise traces of an arbitrary infinite-dimensional operator are not substituted for the distribution theorem.

#### T03R — Real second cohomology of u

**theorem · missing**. Theorem3.1(2),real case

For F=R, continuous H2(Gamma,u) is canonically Z/2 with the real Tate-invariant normalization of§3.1.

Prerequisites: PAPER-KALETHA-16/D01, PAPER-KALETHA-16/P03, PAPER-KALETHA-16/P05, PAPER-KALETHA-16/P06, PAPER-KALETHA-16/P23.

1. Dualize finite levels, identify invariant augmentation characters and pass to limits; real invariants use the Tate modification.
2. For degree two, P23 supplies finite H1(Gamma,u_k), including the real case. P03 therefore gives H2(Gamma,u)=lim H2(Gamma,u_k). Finiteness of u_k alone would not justify this for an arbitrary profinite Gamma.

#### T04S — Split finite central obstruction comparison

**theorem · missing**. Proposition3.2,split case

If finite multiplicative Z/F is split (its character action is trivial), the map xi_*:Hom_Gamma(u,Z)->H2(Gamma,Z) is an isomorphism.

Prerequisites: PAPER-KALETHA-16/T01, PAPER-KALETHA-16/D02, PAPER-KALETHA-16/P05, PAPER-KALETHA-16/P06.

1. Use local finite duality and the augmentation character description; split here concerns the character action, not a chosen constant group presentation.

#### T12F — Fundamental torus rigid surjectivity

**theorem · missing**. Corollary3.7(2)

If S is a fundamental maximal torus of reductive G, then H1rig(Z->S)->H1rig(Z->G) is surjective.

Prerequisites: PAPER-KALETHA-16/P11, PAPER-KALETHA-16/T10.

1. Apply ordinary torus cohomology surjectivity to the quotient cocycle and then match the central restriction; retain the source torus hypotheses.

#### T14R — Split real rigid fibers

**theorem · missing**. Corollary3.8(2),real case

If G is split over R and Z=Z(Gder), H1(F,G/Z)->H1(F,Gad) is bijective and H1rig(Z->G)->H1(F,G/Z) has trivial neutral kernel. Nonneutral fibers can contain more than one class.

Prerequisites: PAPER-KALETHA-16/T13, PAPER-KALETHA-16/P11.

1. Use p-adic H1 vanishing for all simply connected inner twists; for R only the specified neutral-kernel argument applies. SL2(R) has three rigid classes over two inner-form classes.

#### T23B — Relative Weil second product identity

**theorem · missing**. Lemma4.4 second equality

For the same data, c_k(pi(sigma),pi(tau))=product_(v in Gal(E_(k+1)/E_k)) c_(k+1)(sigma,v*tau)*c_(k+1)(sigma,v)^-1.

Prerequisites: PAPER-KALETHA-16/D15.

1. Prove by multiplying the chosen Weil lifts and reindexing cosets; the corrected choice order is required. Split the two identities into separate declarations in the design.

#### T24X — Explicit canonical gerbe class

**theorem · missing**. Lemma4.5(2)

The compatible classes of xi_k in lim H2(F,u_k) equal the canonical class xi=-1 under Theorem3.1.

Prerequisites: PAPER-KALETHA-16/D17, PAPER-KALETHA-16/T21, PAPER-KALETHA-16/T23, PAPER-KALETHA-16/T03, PAPER-KALETHA-16/T03R, PAPER-KALETHA-16/T23B.

1. Use Leibniz and Weil transfer for the coboundary identity, then evaluate the finite-level local invariant as the negative normalized fraction. The degree error E08 is corrected before differentiation.

#### T40E — Full faithfulness of central enlargement

**theorem · missing**. §5.1 central enlargement

For Z1⊆Z2 finite central, enlargement RI_Z1(G)->RI_Z2(G) is fully faithful.

Prerequisites: PAPER-KALETHA-16/D21, PAPER-KALETHA-16/T08.

1. Use the H1 classification for finiteness and the unchanged cocycle morphism equations for full faithfulness.

#### R10I — Irreducible induction of the limit-discrete representation

**theorem · missing**. §5.6 pp617–618 induction theorem

When the R09 coherent continuation on the specific enlarged Levi M1prime is nonzero, its normalized parabolic induction to Gprime is irreducible and tempered. This is not a theorem for arbitrary tempered inducing representations.

Prerequisites: PAPER-KALETHA-16/R09, PAPER-KALETHA-16/P16.

1. Use the original limit-discrete-series and irreducibility results, with the special enlarged cuspidal Levi M1, not arbitrary tempered parabolic induction.

#### L29 — Normalized continuous sections of profinite quotients

**theorem · library**. NSW I §1 exercise4 p11; TauCeti/Topology/Algebra/Group/Profinite/Section.lean226–260

For a profinite group E and a closed subgroup H, the quotient E→E/H has a continuous section s with s(H)=1. More generally E/K→E/H has a normalized continuous section for K≤H. The section is a map of spaces, not necessarily a group homomorphism.

Library: tauceti:TauCeti.exists_continuous_section, tauceti:TauCeti.exists_continuous_section_of_le.

#### L30 — Finite towers have Mittag–Leffler stable images

**theorem · library**. NSW II §7 pp138–142; Mathlib/CategoryTheory/CofilteredSystem.lean230–265

A cofiltered set-valued diagram with an eventually finite image at every index is Mittag–Leffler. In particular a tower of finite sets is Mittag–Leffler. Restricting a Mittag–Leffler diagram to its eventual ranges makes the transitions surjective and preserves its compatible sections. This is a set-level result; it does not itself construct lim¹ of abelian groups.

Library: mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range, mathlib:CategoryTheory.Functor.surjective_toEventualRanges, mathlib:CategoryTheory.Functor.toEventualRangesSectionsEquiv.

#### L31 — Existing factor-set group extension

**construction · library**. NSW I §2 pp18–20; TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean155–350

For an abstract group G acting by automorphisms on a commutative multiplicative group A and a normalized factor set c:G×G→A, use TauCeti.FactorSet.Extension with multiplication (a,g)(b,h)=(a·g(b)·c(g,h),gh). Its existing groupExtension has kernel A and quotient G. No topology is supplied by this declaration.

Library: tauceti:TauCeti.FactorSet.Extension, tauceti:TauCeti.FactorSet.groupExtension, tauceti:TauCeti.FactorSet.rescaleEquiv.

- API `Kaletha16.L31.construct` (constructor): Use the existing Extension and groupExtension of a normalized FactorSet; the inverse is (g⁻¹·(a·c(g,g⁻¹))⁻¹,g⁻¹).
- API `Kaletha16.L31.recover` (characterisation): The canonical section g↦(1,g) has factor set c, and conjugation on A is the given G-action.
- API `Kaletha16.L31.rescale` (functoriality): If c(g,h)b(gh)=c′(g,h)g(b(h))b(g), rescaleEquiv sends (a,g) to (a·b(g),g); the inverse divides by b(g).

- Use: PAPER-KALETHA-16/P24 — Adds the product topology to this existing carrier, rather than defining a second algebraic extension.

- Proposed test `Kaletha16.L31.test1`: The nonzero factor set for trivial C2-action on C2 yields C4.
- Proposed test `Kaletha16.L31.test2`: The identity factor set recovers the existing semidirect product.
- Proposed test `Kaletha16.L31.test3`: For a nontrivial action, the kernel need not be central.

#### L32 — Continuous cochains lift through a discrete quotient

**theorem · library**. TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean132–157; NSW II §7 proof2.7.5

For a surjection p:B→C of underlying types, topological B and discrete C, every continuous f:X→C has a continuous lift e:X→B with p∘e=f. A set-theoretic section of p is continuous because its domain C is discrete; no compactness, additive structure or equivariance of the lift is required.

Library: tauceti:TauCeti.ContCohomology.exists_continuous_lift.

#### L33 — Built degree-one inflation–restriction exactness

**theorem · library**. TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean188–248,331–361

For a topological group G, normal subgroup N and continuous topological additive G-module M, with the induced continuous G/N-action on M^N, inflation H1(G/N,M^N)→H1(G,M) is injective and its range is the kernel of restriction to H1(N,M). This is the explicit continuous carrier and does not require the full Hochschild–Serre spectral sequence.

Library: tauceti:TauCeti.ContCohomology.explicitInfl1_injective, tauceti:TauCeti.ContCohomology.explicitInfRes_exact.

#### P19 — The shift-difference presentation of lim and lim¹

**construction · planned**. NSW2.7.4 pp140–141; exact proof read, with ordinary-group Delta description below

For a countable inverse sequence of abelian groups B_n with f_n:B_(n+1)→B_n, define Δ:∏B_n→∏B_n by Δ(x)_n=x_n−f_n(x_(n+1)). Identify lim B_n with ker Δ and lim¹ B_n with coker Δ as ordinary abelian groups. Short exact sequences of towers give the natural six-term kernel/cokernel exact sequence. For this index category these agree with the zeroth and first derived limit functors, and higher derived limits vanish.

Planned: ArithmeticGaloisDuality:R02.1.

1. The kernel equation is exactly compatibility. Products of short exact sequences of abelian groups remain exact, using coordinatewise choices of preimages. Apply the snake lemma to their two product rows and the three Delta maps.
2. To identify the cokernel with the derived limit, use the two-term resolution by finite-prefix product towers in NSW2.7.4. These towers have surjective transitions; recursive lifting makes their higher limit functors vanish. This proves the derived identification and vanishing above degree one.
3. All groups here are ordinary abelian groups. No closed-image quotient or topological derived category is being substituted.

- API `Kaletha16.P19.construct` (constructor): Construct the additive Delta map, its kernel and ordinary cokernel on the existing product and quotient carriers.
- API `Kaletha16.P19.naturality` (functoriality): A morphism of towers commutes with Delta and induces compatible maps on lim and lim¹.
- API `Kaletha16.P19.connecting` (comparison): For 0→A_n→B_n→C_n→0 construct the six-term sequence 0→lim A→lim B→lim C→lim¹ A→lim¹ B→lim¹ C→0.

- Use: PAPER-KALETHA-16/P20 — Makes the exact obstruction to commuting a limit explicit.
- Use: PAPER-KALETHA-16/P21 — The cochain product sequence induces this kernel/cokernel comparison.

- Proposed test `Kaletha16.P19.test1`: For Z←×2 Z, lim=0 and lim¹=Z2/Z, detected by alternating binary digits.
- Proposed test `Kaletha16.P19.test2`: Identity transitions give lim=B_0 and lim¹=0; zero transitions give both zero.
- Proposed test `Kaletha16.P19.test3`: Every finite truncation of Delta is surjective, but this does not imply surjectivity of the infinite operator.

#### P20 — Mittag–Leffler kills the shift-difference cokernel

**theorem · planned**. NSW2.7.3–2.7.4 pp139–141; direct Delta proof

For a countable Mittag–Leffler tower of abelian groups B_n, Delta from P19 is surjective, hence lim¹ B_n=0. If the tower is ML-zero, both lim and lim¹ vanish. Finite groups at every level suffice for Mittag–Leffler, without surjectivity of the original maps.

Planned: ArithmeticGaloisDuality:R02.1.

Prerequisites: PAPER-KALETHA-16/P19, PAPER-KALETHA-16/L30.

1. When all f_n are surjective, choose x_0 arbitrarily and recursively lift x_n−y_n through f_n; this solves Delta x=y.
2. For a general Mittag–Leffler tower let B′_n be its stable image. L30 gives surjective transitions on B′. The quotient B″ is ML-zero: every sufficiently far map to a fixed quotient is zero.
3. For ML-zero B″ the coordinatewise finite sum x_n=Σ_(j≥n) f_(n,j)(y_j) solves Delta x=y. Uniqueness follows by propagating a compatible x from a sufficiently far zero map.
4. Lift a solution modulo B′ to the product of B_n. Its Delta differs from y by a product of B′_n; solve this error recursively in B′. Thus Delta is surjective. This is also the six-term argument of P19.

#### P21 — Milnor sequence for a surjective finite-coefficient tower

**theorem · planned**. NSW2.7.5 pp141–142; surjective case of its proof

Let G be profinite and A_n finite discrete abelian G-modules with continuous actions and surjective equivariant transitions. Give A=lim A_n its inverse-limit topology. For q≥1 there is a natural exact sequence 0→lim¹ H^(q−1)(G,A_n)→H^q_cts(G,A)→lim H^q(G,A_n)→0. In degree zero invariants commute with the limit. H_cts is ordinary cohomology of continuous cochains with the stated coefficient topology.

Planned: ArithmeticGaloisDuality:R02.1.

Prerequisites: PAPER-KALETHA-16/P19, PAPER-KALETHA-16/L23, PAPER-KALETHA-16/L24, PAPER-KALETHA-16/L32.

1. Continuous maps to A are precisely compatible continuous coordinate maps. Thus the ordinary inhomogeneous cochain complex C•(G,A) is the degreewise inverse limit of C•(G,A_n). The differentials commute with coefficient projections.
2. In each degree L32 lifts continuous cochains through A_(n+1)→A_n. Recursive lifting therefore makes Delta on the product of cochain groups surjective. Its kernel is C•(G,A), giving a short exact sequence of complexes.
3. Products commute with ordinary cohomology: cycles are coordinatewise cycles; a tuple of boundaries has a tuple of chosen primitives. Apply the long exact sequence of these ordinary complexes to obtain P19 applied to the tower of cohomology groups.
4. Use the homogeneous/inhomogeneous comparison on the existing canonical continuous cochain complex. The formulas evaluate at (1,g1,g1g2,...) and invert this by g0 acting on consecutive ratios. The result concerns underlying abelian groups; a pointwise quotient-topology isomorphism is not claimed. Typed comparison remains implementation work.

#### P22 — Stable-image reduction for arbitrary finite coefficient towers

**theorem · planned**. NSW2.7.5–2.7.6 pp141–142

The exact sequence in P21 holds for any countable tower of finite discrete continuous G-modules, with no surjectivity assumption on transitions. Consequently H^q_cts(G,lim A_n)→lim H^q(G,A_n) is an isomorphism whenever the tower H^(q−1)(G,A_n) is Mittag–Leffler, in particular whenever those groups are finite. For q=1 no extra finiteness assumption is needed.

Planned: ArithmeticGaloisDuality:R02.1.

Prerequisites: PAPER-KALETHA-16/P20, PAPER-KALETHA-16/P21, PAPER-KALETHA-16/L30, PAPER-KALETHA-16/L32.

1. Take stable images A′_n. The coefficient tower A′ is surjective, has the same inverse limit, and Q_n=A_n/A′_n is ML-zero. Apply P21 to A′.
2. L32 identifies the quotient of ordinary cochain complexes C•(G,A_n)/C•(G,A′_n) with C•(G,Q_n). A sufficiently far transition Q_j→Q_n is zero uniformly in all cochain degrees, so the induced cohomology tower is ML-zero.
3. The cohomology exact sequence shows that the kernel and cokernel of H^q(G,A′_n)→H^q(G,A_n) are ML-zero towers. P19–P20, applied to image, kernel and cokernel sequences, identify both lim and lim¹ for these two cohomology towers. Transport P21.
4. For q=1 the obstruction uses the finite groups A_n^G. The degree-one case already has the direct finite-fibre proof in CHT item154 at the same R02.1 owner; import it, rather than proposing another implementation.

#### P23 — Finite local H¹ for finite coefficients

**theorem · planned**. NSW7.1.8(iii), pp376–377; degree-one proof without local reciprocity; Kaletha Theorem3.1

For F finite over Qp and a finite discrete abelian G_F-module M, H¹(G_F,M) is finite, including residue-characteristic-primary M. For F=R, finite coefficients have finite cohomology in every nonnegative degree because G_F=C2 is finite.

Planned: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Prerequisites: PAPER-KALETHA-16/P01, PAPER-KALETHA-16/L33, PAPER-KALETHA-16/P27.

1. Choose finite Galois K/F splitting the finite action and containing all m-th roots of unity, m=exponent M. Over G_K decompose the finite abelian group M as a finite sum of cyclic groups, each identified with its cyclotomic mu_d after these roots are chosen.
2. P01 and P27 make H¹(K,mu_d)=K×/(K×)^d finite. Thus H¹(K,M) is finite.
3. The built L33 exactness embeds the quotient of H¹(F,M) by the image of H¹(Gal(K/F),M) into H¹(K,M). The former finite-group cochain set is finite, so both the kernel and possible image are finite. No reciprocity theorem, perfect pairing or full Hochschild–Serre spectral sequence is used.
4. For the real case the cochain sets Maps(C2^q,M) are finite directly. In particular all H¹ groups needed in the degree-two comparison are finite.

#### P24 — Profinite topology on the existing factor-set extension

**construction · missing**. NSW2.7.7 p143 and1.2.4 pp18–20; continuity adaptation of the pinned factor-set carrier

Let G be a profinite group and A a profinite abelian group with jointly continuous G-action. For a continuous normalized factor set c:G×G→A, put the product topology on the existing L31 extension E_c. This is a profinite topological group and 1→A→E_c→G→1 is a continuous extension with closed embedded kernel and the quotient topology. The canonical section is continuous.

Prerequisites: PAPER-KALETHA-16/L31.

1. Transport the product topology on A×G to FactorSet.Extension. Its multiplication and inverse are the existing formulas; continuity follows from continuous multiplication, inversion, the action and c.
2. The underlying product is compact, Hausdorff and totally disconnected, so it is profinite. Inclusion a↦(a,1) is a closed embedding and projection is an open surjection; the existing algebraic exactness is unchanged.
3. If c′=c−db in additive notation with continuous normalized b:G→A, use the existing rescaleEquiv formula (a,g)↦(a+b(g),g). Both it and its inverse are continuous. Retain the sign in this formula.

- API `Kaletha16.P24.topologize` (constructor): Equip L31 with the topology transported from A×G and prove profiniteness and continuous group operations.
- API `Kaletha16.P24.extension` (characterisation): The inclusion identifies A with the closed kernel, projection induces the topological quotient G, and g↦(0,g) is a continuous normalized section in additive notation.
- API `Kaletha16.P24.rescale` (functoriality): For c′=c−db and continuous b, upgrade the existing rescaleEquiv (a,g)↦(a+b(g),g) to a topological extension equivalence; zero c recovers the topological semidirect product.

- Use: PAPER-KALETHA-16/P25 — Provides the explicit continuous realization of a cohomology class.
- Use: PAPER-KALETHA-16/D03 — Realizes the fixed rigid class xi on the shared generic extension carrier.

- Proposed test `Kaletha16.P24.test1`: For C2 acting by inversion on Z/4, c(1,1)=0 and2 give the order-eight dihedral and quaternion extensions.
- Proposed test `Kaletha16.P24.test2`: Zero coefficients recover G and zero c recovers A semidirect G.
- Proposed test `Kaletha16.P24.test3`: Forgetting continuity of c does not justify continuity of the multiplication in the product topology.

#### P25 — Continuous H² classifies profinite extensions

**theorem · missing**. NSW2.7.7 p143; full Schreier proof1.2.4 pp17–20

For profinite G and profinite abelian A with prescribed continuous action, H²_cts(G,A) is naturally in pointed bijection with equivalence classes of profinite extensions 1→A→E→G→1 inducing that action. Equivalence means a continuous group isomorphism inducing identity on A and G. A class is zero exactly when the extension has a continuous group-theoretic splitting.

Prerequisites: PAPER-KALETHA-16/L24, PAPER-KALETHA-16/L28, PAPER-KALETHA-16/L29, PAPER-KALETHA-16/P24.

1. Identify A with a closed subgroup of E: a continuous injection from compact A into Hausdorff E is an embedding. The induced continuous bijection E/A→G is a homeomorphism. L29 therefore supplies a normalized continuous section s:G→E.
2. Its factor set s(g)s(h)s(gh)⁻¹ is continuous into A with its subspace topology and satisfies the normalized cocycle equation. Replacing s by b·s changes c to c+db with continuous b; equivalent extensions have the same continuous class.
3. Every continuous two-cocycle can be normalized by subtracting the coboundary of its constant value at (1,1), a continuous cochain. P24 constructs its extension. Multiplication (a,g)↦a·s(g) is a continuous bijection from compact A×G to E, hence a homeomorphism, and identifies the two constructions.
4. Equality in continuous H² supplies a continuous coboundary witness. P24 rescaling gives the equivalence; conversely evaluate an equivalence on the canonical section to recover a continuous witness. Abstract H² equality alone is not used to infer continuity.
5. Zero class gives the continuous semidirect-product splitting. A continuous homomorphic section has zero factor set and therefore gives zero class.

#### P26 — Extension automorphisms and continuous one-cocycles

**theorem · missing**. Kaletha §3.2 p573; direct calculation on the NSW Schreier model

For E_c as in P24, continuous extension automorphisms inducing identity on A and G form a group naturally isomorphic to Z¹_cts(G,A). In additive coordinates b acts by (a,g)↦(a+b(g),g). Conjugation by a0∈A corresponds to b(g)=a0−g·a0. Thus the quotient by these inner automorphisms is H¹_cts(G,A); if H¹=0 every such automorphism is inner, and its conjugating a0 is determined modulo A^G.

Prerequisites: PAPER-KALETHA-16/P24, PAPER-KALETHA-16/L24.

1. Any automorphism fixing A is determined by the images of the section (0,g). Fixing the quotient forces that image to be (b(g),g), and continuity makes b continuous.
2. Comparing multiplication on two section elements gives b(gh)=b(g)+g·b(h). Conversely this equation makes the displayed map an automorphism with inverse obtained by −b. Composition is pointwise addition.
3. Conjugate (a,g) by (a0,1) to obtain (a+a0−g·a0,g). The kernel of this map from A consists precisely of A^G; its image is the one-coboundaries, with the displayed sign convention.

#### P27 — Deep powers and finite power classes over p-adic fields

**theorem · planned**. LocalFieldsRamification Layer1 power subgroup/finite-index targets; elementary complete-DVR contraction proof supplied here

Let K/Qp be finite, pi a uniformizer, v the normalized valuation and n≥1 an integer. Then 1+pi^(2v(n)+1)O_K is contained in (K×)^n. The n-th-power subgroup is open and K×/(K×)^n is finite, including p|n. Only finiteness and this sufficient depth are asserted, not the sharp power-class cardinality formula.

Planned: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group.

1. Write u=1+n²*pi*a with a∈O_K. Define P(Y)=((1+n*pi*Y)^n−u)/(n²*pi) as a polynomial over K. The binomial expansion shows P(Y)=Y−a+pi*Q(Y) with Q∈O_K[Y]: its degree-j coefficient for j≥2 is binomial(n,j)n^(j−2)pi^(j−1). This also covers n=1 with Q=0.
2. An integral polynomial is 1-Lipschitz on O_K: factor each y^j−z^j by y−z and use the nonarchimedean triangle inequality. Starting y_0=0, iterate y_(r+1)=a−pi*Q(y_r). Successive differences gain at least one valuation at every step, so completeness gives a limit y∈O_K. Polynomial continuity implies P(y)=0.
3. The unit x=1+n*pi*y then satisfies x^n=u. The ideal n²*pi*O_K equals pi^(2v(n)+1)O_K. Thus the power subgroup contains an open principal-unit subgroup and is open.
4. The compact unit group has finite quotient by its open n-th-power subgroup. The valuation sequence gives quotient Z/nZ, while a unit which is an n-th power in K has a unit root. Hence the full power-class quotient is finite. This consumes the existing complete-DVR, valuation and compact-unit interfaces of LocalFieldsRamification.
5. Characteristic zero cannot be dropped at n=p: in Fp((t)), p-th powers have Laurent exponents divisible by p, and arbitrarily deep 1+t^m with p not dividing m are omitted. No local reciprocity or logarithm theorem is used in this proof.

### Acquisition and verification

```json
{
  "date": "2026-09-23",
  "priorFullRead": "All 74 published pages were read for PR1968 and retained; this continuation does not claim another full read.",
  "primary": "Fresh published PDF8–17, pp566–575, including all of §§3.1–3.2 and the initial §3.3 proofs.",
  "nsw": {
    "url": "https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf?download=1",
    "sha256": "abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91",
    "accessed": "2026-09-23",
    "pages": 840,
    "version": "Second edition,corrected electronic version2.3,May2020",
    "read": "II §7 through2.7.7, pp136–143; I §1 pp5–11 including exercise4; Schreier1.2.4 pp17–20; local pp375–384 including7.1.8 and7.2.6. The complete book was not read."
  },
  "errata": {
    "url": "https://www.math.uni-bonn.de/people/kaletha/errata.pdf",
    "sha256": "31e5f2d4e9c50d3380c9bc07b3228e9b631d8563b9e823f264b6a8c6397c31b5",
    "accessed": "2026-09-23",
    "pages": 14,
    "read": "section3,PDF6–7"
  },
  "failedAcquisition": "The unqueried NSW PDF URL redirected to its HTML index. The download=1 link delivered the verified PDF; the HTML was not treated as book text."
}
```

The structural check passed for all 156 items, 336 internal edges and one existing external stage, 177 API contracts, 177 tests, exact missing-item routing and preserved source findings. All 517 input hashes and 41 declaration records were verified. The manifest is acquisition provenance, not a claim that every input was freshly read in full. Publication checks current main against those inputs and the three original deliverable blobs.

The new integer certificate passed **365,395 exact checks**. It exhausts the indicated finite extension models and finite Delta systems, checks the scaled polynomial identity, and tests deep power containment including residue-characteristic divisibility. Infinite limit and completeness claims rest on the written proofs. The prior nine diagnostic groups were rerun unchanged and reproduce their earlier output; their complex-number example is not counted in the new exact total. No Lean file was requested or compiled; the 177 proposed Lean tests remain unexecuted.

```json
{
  "status": "PASS",
  "counts": {
    "cyclicH2Order": 17,
    "extensionAssociativity": 169696,
    "extensionInverse": 784,
    "continuousRescalingFiniteModel": 84848,
    "innerAutomorphismQuotient": 60,
    "innerAutomorphismSign": 5608,
    "finiteDeltaRecursion": 96824,
    "finiteDeltaBijective": 224,
    "finiteStableImageSurjective": 209,
    "lim1ObstructionCongruences": 80,
    "deepUnitPowerContainment": 1269,
    "scaledPolynomialIdentity": 5776
  },
  "total": 365395,
  "scope": "Finite arithmetic checks only; infinite limits, continuity and local-field completeness use the written proofs."
}
```

#### Reproducible new certificate

```python
"""Exact finite checks for the limit and profinite-extension interfaces.

These checks do not prove the infinite Mittag–Leffler or continuity assertions.
"""
from collections import Counter
from itertools import product
from math import gcd, comb
import json

checks = Counter()

def check(name, assertion):
    assert assertion, name
    checks[name] += 1

# All normalized factor sets for C2 acting on Z/n by an involutory unit r.
# The only possibly nonzero entry is c(1,1)=t, with (r-1)t=0.
for n in range(2, 10):
    for r in range(n):
        if gcd(r, n) != 1 or r*r % n != 1:
            continue
        inv = [t for t in range(n) if (r-1)*t % n == 0]
        norms = {(1+r)*b % n for b in range(n)}
        check('cyclicH2Order', len(inv) % len(norms) == 0)
        for t in inv:
            elements = list(product(range(n), range(2)))
            def mul(x, y, t=t):
                a,g=x; b,h=y
                return ((a + pow(r,g,n)*b + t*g*h) % n, (g+h)%2)
            for x,y,z in product(elements, repeat=3):
                check('extensionAssociativity', mul(mul(x,y),z)==mul(x,mul(y,z)))
            for a,g in elements:
                inverse = ((-pow(r,g,n)*(a+t*g))%n,g)
                check('extensionInverse', mul((a,g),inverse)==mul(inverse,(a,g))==(0,0))
            for b in range(n):
                target_t=(t-(1+r)*b)%n
                def rescale(x):
                    a,g=x
                    return ((a+b*g)%n,g)
                for x,y in product(elements,repeat=2):
                    a,g=rescale(x); d,h=rescale(y)
                    rhs=((a+pow(r,g,n)*d+target_t*g*h)%n,(g+h)%2)
                    check('continuousRescalingFiniteModel',rescale(mul(x,y))==rhs)
            cocycles={b for b in range(n) if (1+r)*b%n==0}
            inners={(1-r)*a%n for a in range(n)}
            check('innerAutomorphismQuotient', inners <= cocycles and len(cocycles)%len(inners)==0)
            for a,g in elements:
                for a0 in range(n):
                    lhs=mul(mul((a0,0),(a,g)),((-a0)%n,0))
                    check('innerAutomorphismSign',lhs==((a+(1-pow(r,g,n))*a0)%n,g))

# Finite truncations of Delta. Last coordinate is x_N (tail map zero).
# This triangular operator is bijective even when transition maps are not.
for modulus in range(2,6):
    length=4
    for maps in product(range(modulus), repeat=length-1):
        images=set()
        for x in product(range(modulus),repeat=length):
            y=tuple((x[i]-maps[i]*x[i+1])%modulus for i in range(length-1))+(x[-1],)
            images.add(y)
            recovered=[0]*length; recovered[-1]=y[-1]
            for i in range(length-2,-1,-1):
                recovered[i]=(y[i]+maps[i]*recovered[i+1])%modulus
            check('finiteDeltaRecursion',tuple(recovered)==x)
        check('finiteDeltaBijective',len(images)==modulus**length)

# Stable images for a stationary finite cyclic tower: multiplication by a.
for modulus in range(2,21):
    for a in range(modulus):
        image=set(range(modulus))
        for _ in range(modulus):
            next_image={a*x%modulus for x in image}
            if next_image==image:
                break
            image=next_image
        check('finiteStableImageSurjective',{a*x%modulus for x in image}==image)

# The alternating obstruction in lim^1(Z <-2 Z) has binary sum -1/3.
# Verify its finite congruences; the infinite nonzero-class proof is written.
for depth in range(1,81):
    partial=sum(2**i for i in range(depth) if i%2==0)
    if depth%2==0:
        check('lim1ObstructionCongruences',(3*partial+1)%2**depth==0)
    else:
        check('lim1ObstructionCongruences',(3*partial+1)%2**depth==0)

# Deep unit nth powers, including p | n. Exhaust all qualifying residue
# classes at these precisions and verify the scaled integral polynomial.
for p in [2,3,5]:
    for n in range(1,9):
        valuation=0; m=n
        while m%p==0:
            valuation+=1; m//=p
        threshold=2*valuation+1
        precision=min(threshold+3,7)
        modulus=p**precision
        powers={pow(x,n,modulus) for x in range(modulus) if x%p}
        for u in range(1,modulus,p**threshold):
            check('deepUnitPowerContainment',u in powers)
        for a in range(p**2):
            u=1+n*n*p*a
            for y in range(p**2):
                scaled=((1+n*p*y)**n-u)//(n*n*p)
                q=sum(comb(n,j)*n**(j-2)*p**(j-2)*y**j for j in range(2,n+1))
                check('scaledPolynomialIdentity',scaled==y-a+p*q)

result={'status':'PASS','counts':dict(checks),'total':sum(checks.values()),
        'scope':'Finite arithmetic checks only; infinite limits, continuity and local-field completeness use the written proofs.'}
print(json.dumps(result,indent=2))
```

### Original-source queue

- Neukirch–Schmidt–Wingberg, Cohomology of Number Fields, second edition: https://doi.org/10.1007/978-3-540-37889-1. Compact inverse-limit cohomology2.7.6–2.7.7, finite Tate cup conventions and local duality; exact original statements remain open. The exact limit and profinite-extension sections are now read; the remaining arithmetic and global supplier chapters are not thereby closed.
- Tate, The cohomology groups of tori in finite Galois extensions of number fields (1966): https://projecteuclid.org/euclid.nmj/1118801784. Ordinary Tate–Nakayama and norm conventions; reuse the existing ordinary owner.
- Kneser, Galois-Kohomologie halbeinfacher algebraischer Gruppen uber p-adischen Korpern I: https://doi.org/10.1007/BF01112691. Simply connected local H1 vanishing, including every inner twist.
- Kottwitz, Stable trace formula: Elliptic singular terms (1986): https://doi.org/10.1007/BF01458611. Dual component pairing, fundamental tori, abelianization and relevance reductions.
- Kottwitz, Rational conjugacy classes in reductive groups (1982): https://doi.org/10.1215/S0012-7094-82-04939-0. Quasi-split rational representatives of relevant stable classes.
- Langlands–Shelstad, On the definition of transfer factors (1987): https://doi.org/10.1007/BF01458070. Relative/absolute factors, endoscopic data and adelic rational matching condition.
- Kottwitz–Shelstad, Foundations of twisted endoscopy (1999): https://www.numdam.org/item/AST_1999__255__R1_0/. Two-term torus complexes, z-pairs and normalized global products; recursive supplier extraction remains open.
- Kottwitz–Shelstad, On splitting invariants and sign conventions in endoscopic transfer: https://arxiv.org/abs/1201.5658. The four convention variants and the Delta/Delta-prime inversion comparison.
- Langlands, On the classification of irreducible representations of real algebraic groups: https://doi.org/10.1090/surv/031/03. Real parameter classification and its exact induction/infinitesimal-equivalence hypotheses.
- Kostant, On Whittaker vectors and representation theory: https://doi.org/10.1007/BF01390249. Generic discrete member and Whittaker normalization.
- Shelstad, L-indistinguishability for real groups (1982): https://doi.org/10.1007/BF01456950. R-group/Cayley/limit-discrete classification; only original printed415–423 read here, through GDZ scans.
- Shelstad, Characters and inner forms of a quasi-split group over R (1979): https://www.numdam.org/item/CM_1979__39_1_11_0/. Stable characters and transfer across real inner forms.
- Shelstad, Tempered endoscopy for real groups I: Geometric transfer with canonical factors: https://doi.org/10.1090/conm/472/09241. Whittaker normalization and Levi descent of geometric factors.
- Shelstad, Tempered endoscopy for real groups III: Inversion of transfer and L-packet structure: https://doi.org/10.1090/S1088-4165-08-00337-3. Packet cardinality, generic normalization and the component comparison.
- Kaletha, Global rigid inner forms and multiplicities of discrete automorphic representations: https://arxiv.org/abs/1501.01667. Full global gerbe/localization, global Tate–Nakayama, Proposition4.1 and conditional Proposition4.2, with its own errata.
- Kottwitz, Sign changes in harmonic analysis on reductive groups: https://doi.org/10.2307/1999316. The local e(G) sign and its Levi compatibility used in Proposition5.10.
