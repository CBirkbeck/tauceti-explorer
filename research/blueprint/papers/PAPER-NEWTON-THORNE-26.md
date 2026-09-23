# PAPER-NEWTON-THORNE-26: Hilbert symmetric powers, extraction and routing

Issue [#1053](https://github.com/CBirkbeck/tauceti-explorer/issues/1053). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged partial checkpoint of ChatGPT Pro, session `cp-2109-planets01-f7c2` (#1386), whose material follows below.
- **The paper.** James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, Annals of Mathematics 203 (2026), 283–347. The version read is arXiv 2212.03595v2 (19 February 2025): PDF SHA-256 `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`, TeX source SHA-256 `86e98ac0032bbf65888448fea5f9a4da04731ccea146bb91cf762e008add80fb`.
- **Items.** The result has **130 items: 3 library, 9 planned and 118 missing**.
  - The checkpoint's 57 items are kept.
  - 73 items are new: every numbered statement the checkpoint had not extracted, and the results of other papers that the proofs cite.
  - Every missing item is routed exactly once, across 14 source routes. No new roadmap is proposed.
- **Mistakes.** Two are recorded under `sourceIssues`:
  - **E1:** Proposition 5.4 concludes p^a > M, but its argument gives only p^a ≥ M. The same slip appears in the proof of Lemma 5.7, and the applications need only the weaker bound.
  - **E2:** two misprinted checks in the proof of Lemma 5.8.

## This continuation (cc-442dc5)

**What was read.**
- arXiv v2 was read in full, §§1–6 with every proof.
- The TeX source was used to enumerate the numbered statements. There are 50: Lemmas 2.1–2.6, the §3 statements 3.1–3.14, the §4 statements 4.1–4.9, Theorem 5.1 through 5.9, and 6.1–6.5.
- The checkpoint lacked Lemmas 3.3–3.8, Propositions 3.9–3.14, Lemma 4.2, Corollary 4.3, Propositions 4.4, 4.6, 4.8, 4.9, Lemmas 4.5, 4.7 and 5.6. It also lacked Definition 2.5(1) and the deformation-theoretic constructions of §§3–4.

**What was added.**
- **The paper's own statements.** Each numbered statement is an item with its hypotheses. The Section 3 strategy has four deformation problems, S_{F₁}, S′_{F₁}, S′_{F₂} and S_{F₃}. They are linked by the reduced-special-fibre comparison (Lemma 3.6), connectedness of the generic-prime graph (Proposition 3.10), and the generic R_p = T_p theorem with scalar local restriction (Proposition 3.13). The §4 patching is recorded in both of its branches:
  - p > 2: Proposition 4.8;
  - p = 2: Proposition 4.9, with the Ĝ_m^γ-action.
- **Cited inputs.** Every result from another paper that the proofs use is an item, stated as it is used. The list includes Tho15, ANT20, Tho24, NT21b, NT23, BLGGT14 and BLGG12, together with Kisin, Snowden, Shotton, Dotto, Bushnell–Henniart, Wake–Wang-Erickson, Maire, Dimitrov, Fontaine–Laffaille, Patrikis, Hida theory, Borel and Dieudonné. Each is routed to the existing owner of its kind:

  | Kind of input | Owner stages |
  | --- | --- |
  | Local lifting rings | LocalGaloisDeformationRings R08.2–R08.5 |
  | G_n deformation problems and Taylor–Wiles primes | GlobalGaloisDeformations G7, R04.3, R04.5 |
  | Residually reducible lifting | PotentialAutomorphyInfrastructure PA.3 |
  | Group determinants | IntegralHeckeAndGaloisDeterminants IHG.0 |
  | Fontaine–Laffaille | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 |
  | Local Jacquet–Langlands | EndoscopicTransferAndUnitaryTraceComparison ET.6 |
  | Khare–Wintenberger points | PotentialModularityAndCompatibleSystems R24.2 |
  | Hida theory | OrdinaryAutomorphicFormsAndModularityLifting R21.2 |
  | Connectedness and patched components | DeformationAndDerivedPatchingAlgebra R03.6 |
- **Library and planned.**
  - Bertrand's postulate (`Nat.exists_prime_lt_and_le_two_mul`) and Goursat's lemma (`Subgroup.goursat`) are library items.
  - Chebotarev density is planned in AnalyticNumberTheory AN.4. Tau Ceti has its Frobenius prime sets but not the density theorem.

**Why the status is now complete.**
- Every numbered statement of the paper, and every theorem its proofs cite, is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- What remains is the proofs of cited suppliers, which belong to the owning routes, and a comparison with the published Annals text, which was not available.

## Source and version

James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular
forms*, Annals of Mathematics **203** (2026), no. 1, 283–347,
DOI **10.4007/annals.2026.203.1.4**.

The mathematical text inspected was [arXiv 2212.03595v2](https://arxiv.org/html/2212.03595v2),
19 February 2025, the 52-page author version. The [journal metadata](https://annals.math.princeton.edu/2026/203-1/p04)
identify the published paper. The journal's 65-page version was not compared
line by line with the author version. Parsed PDF text was used alongside HTML;
several page screenshots failed, and PDF bytes were not obtained in the execution
filesystem. Therefore the packet deliberately supplies no SHA-256 and makes no
claim of complete diagram verification. The paper's date is not a claim that
it first appeared on the day of this worker run.

Repository snapshot: `5354d3adfa696e54a69f68abc658970cab16b82b`.
The claim was confirmed by the bot in comment 5764400888 in response to this
session's comment 5764397094. No prior result file was present when preparing
this submission.

## Saved extraction and routes (checkpoint counts)

The accompanying paper-v1 packet contains **57 records**: **34 theorems,
14 constructions and nine definitions**. One algebraic carrier is cited from
pinned Mathlib, eight records import already-planned stages, and 48 exact
source-specific records are assigned once each to seven existing proposed
roadmap owners. The `usesItems` links are the saved part of the dependency graph,
not a claim that every proof prerequisite has been extracted.

| Existing owner | Missing records routed | Exact destination stages |
|---|---:|---|
| ModularityAndLanglandsExtensions | 19 | ML.0, ML.3, ML.5 |
| ArithmeticGaloisRepresentations | 16 | R01.1, R01.4, G7 |
| AutomorphicGaloisRepresentationsPartII | 6 | AG2.0, AG2.6 |
| GL2AutomorphicRepresentationsAndTransfer | 3 | R16.3, R16.4 |
| ArithmeticGaloisDuality | 2 | R02.3 |
| LocalGaloisDeformationRings | 1 | L7 |
| PotentialAutomorphyInfrastructure | 1 | PA.2 |

These are all **source additions to existing directions**. No new roadmap or
Part II roadmap is proposed, and no owner document is edited by this PR.
The seven owner descriptions were read at the snapshot before assigning the
routes. The main symmetric-power endpoint is explicitly already planned in
[ML.3](../../../content/campaign/ModularityAndLanglandsExtensions/README.md).
It would be duplication to create a parallel Newton–Thorne endpoint roadmap.

The additional records give that endpoint its particular companions, residual
witnesses, coefficient-conjugation steps, auxiliary places and lifting hypotheses.
The exact tensor functoriality-lifting statement goes to ML.5; the comparison
of reciprocity and weight conventions goes to ML.0. A source-specific result
can be missing at declaration granularity even when its broad target is planned.
Here “missing” does not assert an exhaustive negative search of every pinned
library and every existing source packet: that audit remains explicit work.

## What must not disappear in a coarse plan (checkpoint)

### Residual witnesses are not unrestricted tensor functoriality

Theorem 5.5 constructs an ordinary RAESDC representation whose **residual**
representation is the coefficient-Frobenius twist of the first rank-two factor
tensored with a small symmetric power. Theorem 5.9 provides the corresponding
witness under local hypotheses, retaining the extra Steinberg place used by
Section 6. Neither theorem says that the same characteristic-zero tensor with
the original form in both factors is automorphic.

The intermediate characteristic-zero automorphy statement instead uses the
companion of Lemma 3.1, with labelled Hodge–Tate weights zero and two. This is
what supplies regularity. The two residual-witness records and the separate
characteristic-zero companion record are kept distinct in the packet. The
paper expressly does not prove arbitrary GL2 × GLr tensor functoriality.

### Theorem 4.1 needs its nine hypotheses, including the dyadic branch

The recorded statement retains weight zero and non-CM, the rank-two congruence,
the residual SL2 bound, simultaneous local ordinarity and potential crystallinity,
the Steinberg-twist equivalence away from p, a perfect residual subgroup with a
regular semisimple element, the specific weights of the fixed factor, strong
irreducibility of the first tensor and irreducibility of the second. At p=2,
both rank-two representations must be potentially crystalline.

The proof patches a rank-two factor while using information about the
higher-rank tensor pseudodeformation ring at its automorphic point. This is
not a black-box invocation of a rank-two ordinary modularity theorem. The
rank-two ordinary roadmap and the general-rank PA.2/AG2/L7 inputs are therefore
not interchangeable. The complete internal Section 4 decomposition remains
unfinished; in particular, Proposition 4.9 is the dyadic patching construction,
with its formal-torus two-torsion action, rather than a generic tangent-map lemma.

### The Section 3 Steinberg obstruction is real

The untwisted tensor in Theorem 3.2 cannot simply be passed to the standard
Steinberg automorphy-lifting theorem. The paper constructs the necessary
comparison between local deformation conditions and propagates support through
generic primes. Proposition 3.13 weakens the relevant local condition from
trivial to scalar, using a twisting argument; its dimension-one characteristic-p
prime and genericity hypotheses must remain visible. Proposition 3.14 is the
subsequent propagation step. Those internal declarations are the first items
in the continuation handoff, not assumptions concealed by the endpoint node.

### Auxiliary primes and coefficient actions have different roles

Proposition 5.4 uses two tamely dihedral places. Their residue characteristics,
the two dihedral orders, the exclusions at 2 and 3, and reciprocal splitting
conditions rule out different residual-image failures. One auxiliary place
cannot simply replace the pair.

The final local context uses the ordered conditions that the first place splits
in the modulus-eight ray field composed with F(S), and the second splits in the
corresponding compositum after adjoining the first place to S. Lemma 5.3 supplies
the reciprocity needed to reach Proposition 5.4's symmetric form.

Lemma 5.7 changes the companion by a congruence at a **new coefficient prime t**.
It does not promise a congruence at the original p. Lemma 5.8 then changes only
the first tensor factor, one coefficient-inertia element at a time, keeping the
second fixed. Coefficient inertia preserves residual semisimplification;
arithmetic coefficient Frobenius is a different operation. The packet keeps
both constructions and the inverses in the transformed-embedding formulas.

### Reuse class field theory without hiding the Kummer application

The modulus-eight-and-all-real-places ray class field, splitting in abelian
composita, and the quadratic Hilbert product formula import the existing
upstream ClassFieldTheory Layers 12–14. They are already-planned records, not a
new class field correspondence.

The restricted-ramification exponent-two field F(S) and its one-new-prime Kummer
calculation are routed to ArithmeticGaloisDuality R02.3. Positivity and the dyadic
square condition of the prime generator must be checked. F(S) is permitted to
ramify at real places; making it totally real would change the construction.
The two-place application remains a source-specific part of ML.3.

### Normalize the theorem rather than silently changing characters

The paper uses geometric reciprocity and assigns the cyclotomic character
Hodge–Tate weight −1. ArithmeticGaloisRepresentations uses an arithmetic-Frobenius
normalization and weight +1. The packet adds an explicit comparison obligation.
Changing the sign convention does not by itself invert an actual determinant
character. The determinant, multiplier, Tate twists and local Langlands
normalization must commute with the same comparison.

The final Hilbert theorem includes non-paritious regular weights through a
separate reduction; no ordinary associated Galois representation is assumed for
such a form. The CM-field conclusion retains RAECSDC and non-induction from a
quadratic extension. Neither is promoted to arbitrary GL2 representations over
arbitrary CM fields.

## Baseline and prior-paper audit boundaries

The reviewed audit `data/library-coverage.json`, blob
`5e708cfc74a51b10e62149113872fe4e00eb5846`, was inspected. It marks
ArithmeticGaloisRepresentations:G7 not built (AUDIT-31); no direct ML.3 entry was
found. That absence is not evidence of either implementation or nonimplementation.

At Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`,
`Mathlib/RepresentationTheory/Basic.lean` was read and the algebraic
`Representation` carrier confirmed (blob `ace88b2889c74b7accc6a65f19ed3f83a37612ff`).
This is the packet's sole library claim. It provides no continuity, admissibility
or automorphy theorem. At Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, the modular-form Basic file was read
(blob `01755f6f9d93b7a858a62f0785ab2f50e37e2387`); its classical slash-action and
cusp-form APIs are not the required Hilbert/higher-rank theory.

Default-branch searches for RAESDC and adequate yielded no Tau Ceti hits; an
automorphy search returned classical automorphy-factor lemmas. Mathlib RAESDC
also yielded no hits. These are candidate-search observations, **not an
exhaustive negative pinned-library audit**. Continuation must search all relevant
source packets and declarations before treating every classification as final.

Nineteen prior-paper entries are saved with the locations for which they are
needed. The priority inputs include Tho24's level raising, NT23's adjoint-Selmer
result, ANT20/Tho15's residually reducible lifting, NT21b's patching model,
BLGGT14's local and weight-change comparisons, and Clozel's coefficient-field
theorem. Their theorem-specific coverage was marked unresolved by the checkpoint; cc-442dc5 states each result used as an item: identifying a
topic owner is not verification of an imported theorem's complete hypotheses.
Further local-deformation, Sen-operator, anti-unit and finite-group inputs are
named in the remaining list. No claim is made that these papers lack existing
atlas coverage, or that the bibliography has been fully extracted.

## Items added by cc-442dc5

- **ι-ordinary automorphic representation** (definition; Definition 2.5(1)). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Ordinary automorphic representations give ordinary Galois representations** (theorem; §2 after Definition 2.5, citing [Tho15, Corollary 2.6]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Galois representations attached to RAESDC and RAECSDC representations** (theorem; §1.2, citing [Car14] and [BLGGT14, Theorem 2.1.1(1)]). Route: AutomorphicGaloisRepresentationsPartII (AG2.0, AG2.6, AG2.2).
- **Goursat's lemma** (theorem; Lemma 2.2 proof). Route: library: mathlib:Subgroup.goursat, mathlib:Subgroup.goursat_surjective.
- **Zariski closures of images and derived groups** (theorem; Lemma 2.2 proof and Lemma 4.7 proof, citing [Bor91, Ch. I §2.1(f), §2.4; Ch. II §7.1]). Route: ArithmeticGaloisRepresentations (G7, R01.1, R01.4).
- **Adequacy versus absolute irreducibility** (theorem; §2 before Lemma 2.3, citing [Tho12, Definition 2.3, Lemma 2.4]). Route: ArithmeticGaloisRepresentations (G7, R01.1, R01.4).
- **Standing hypotheses of §3** (definition; §3, opening paragraph). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **An auxiliary place with no ramified deformations** (theorem; Lemma 3.3). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Auxiliary soluble totally real extensions F₂/F₁/F** (theorem; Lemma 3.4). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Lower bound for anti-unit ranks** (theorem; Lemma 3.4 proof, citing [Mai02, Proposition 19]). Route: ArithmeticGaloisDuality (R02.3).
- **Type A₀ characters with prescribed restrictions** (theorem; Lemma 3.4 proof, citing [BLGGT14, Lemma A.2.5]). Route: AutomorphicGaloisRepresentationsPartII (AG2.0, AG2.6, AG2.2).
- **The representation s and its residual decomposition** (theorem; Lemma 3.5). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Ordinarity of isobaric sums** (theorem; Lemma 3.5 proof, citing [CT14, Lemma 2.6]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **The global deformation problems S_{F₁}, S′_{F₁}, S′_{F₂}, S_{F₃}** (construction; §3 after Lemma 3.7 and before Proposition 3.13). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Two inertial types with the same reduced special fibre** (theorem; Lemma 3.6). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Breuil–Mézard cycles for central division algebras** (theorem; Lemma 3.6 proof, citing [Dot18, Theorem 6.1, Definition 5.2, Example 3.8]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Explicit Langlands and Jacquet–Langlands for level-zero representations** (theorem; Lemma 3.6 proof, citing [BH11]). Route: EndoscopicTransferAndUnitaryTraceComparison (ET.6).
- **Fixed-type lifting rings away from p** (theorem; Lemmas 3.6, 3.8 proofs, citing [Sho18, Theorem 2.5, Definition 3.5]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Technical conditions after X₀-split base change** (theorem; Lemma 3.7). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Comparison of the deformation rings** (theorem; Lemma 3.8). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Thorne's G_n deformation problems: representability and presentation** (theorem; Lemmas 3.8, Proposition 3.11 proofs, citing [Tho15, Propositions 3.8, 3.9, 3.29(2), Corollary 3.12]). Route: GlobalGaloisDeformations (R04.3, G7, R04.5).
- **The Steinberg lifting ring is a domain** (theorem; Lemma 3.8 proof, citing [Tho15, §3.3.4, Proposition 3.17]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Finiteness of R_{S′_{F₂}} and a Steinberg automorphic lift** (theorem; Proposition 3.9). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Level raising to an ordinary locally Steinberg lift** (theorem; Proposition 3.9 proof, citing [Tho24, Theorem 6.11]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Finiteness of ordinary locally Steinberg deformation rings** (theorem; Proposition 3.9 proof, citing [ANT20, Theorem 6.2] and [Tho24, Theorem 7.5]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Characteristic-zero points from finiteness** (theorem; Lemma 3.1 and Proposition 3.9 proofs, citing [BG19, Proposition 4.2.6], [Tho12, Theorems 9.1, 10.2]). Route: PotentialModularityAndCompatibleSystems (R24.2).
- **Generic primes of an ordinary deformation ring** (definition; Proposition 3.10, citing [ANT20, Definition 3.7]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Large ideals contain generic primes** (theorem; Proposition 3.10 proof, citing [ANT20, Lemma 3.9]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Connectedness dimension of the special fibre** (theorem; Proposition 3.10 proof, citing [Tho15, Definition 1.7, Lemma 3.21 and its proof]). Route: DeformationAndDerivedPatchingAlgebra (R03.6).
- **The generic-prime graph is connected** (theorem; Proposition 3.10). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Finiteness of R_{S_{F₁}} and generic primes on each component** (theorem; Proposition 3.11). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Generic primes pull back to generic primes** (theorem; §3 before Proposition 3.12, citing [Tho15, Proposition 5.3]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **An extension F₃ making the generic points scalar at v₀** (theorem; Proposition 3.12). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **The big ordinary Hecke algebras T_{F₂}, T_{F₃}** (construction; §3 between Propositions 3.12 and 3.13). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Descent to definite unitary groups** (theorem; §3 before Proposition 3.13 and end of §3, citing [CHT08, Proposition 3.3.2], [Lab11, Théorème 5.4, Corollaire 5.3], [Tho15, Proposition 4.18], [NT21a, Lemma 6.7]). Route: AutomorphicGaloisRepresentationsPartII (AG2.0, AG2.6, AG2.2).
- **A generic R_p = T_p theorem with scalar local restriction** (theorem; Proposition 3.13). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Automorphy of all components through a generic prime** (theorem; Proposition 3.13 proof, citing [ANT20, Theorem 4.1] and [Tho15, Lemma 3.40]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Every component of the Steinberg problem is automorphic after restriction** (theorem; Proposition 3.14). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **A Hecke-algebra point is automorphic** (theorem; End of §3, citing [Ger19, Lemma 2.25] and [Lab11, Corollaire 5.3]). Route: PotentialAutomorphyInfrastructure (PA.2, PA.3).
- **Components of local lifting rings and global lifts** (theorem; Lemma 3.1 proof, citing [BG19, §4.2, Theorem 3.3.8, Proposition 4.2.6], [All16, Proposition 1.2.2], [Ger19, Lemma 3.10], [Gee11, Proposition 3.1.7]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Hida families for Hilbert modular forms** (theorem; Lemma 3.1 proof, citing [Wil88]). Route: OrdinaryAutomorphicFormsAndModularityLifting (R21.2).
- **Preliminary reductions for Theorem 4.1** (theorem; Theorem 4.1 proof, conditions (10)–(16)). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Local lifting quotients R̄_v for Theorem 4.1** (construction; §4 after Theorem 4.1). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Kisin's and Snowden's local deformation rings** (theorem; §4, citing [Kis09a, Corollary 2.3.13, Propositions 2.4.6, 2.5.2, 2.5.6] and [Sno18, Proposition 4.3.1]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **The rings R_Q, R_Q^□, R′_Q and R_loc** (construction; §4 before Lemma 4.2). Route: GlobalGaloisDeformations (R04.3, G7, R04.5).
- **The pseudodeformation ring P** (construction; §4 before Lemma 4.2 and after Corollary 4.3, citing [NT23, §§2.4, 2.19], [WWE19], [Che14]). Route: IntegralHeckeAndGaloisDeterminants (IHG.0).
- **Artinian points are torsion semistable** (theorem; Lemma 4.2). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Torsion semistable conditions are stable** (theorem; Lemma 4.2 proof, citing [WWE19, Theorem 2.3.4, §5.2]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **The tensor map P → R** (theorem; Corollary 4.3). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Taylor–Wiles datum of level N (tensor version)** (definition; §4 after Corollary 4.3). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Quaternionic automorphic forms at Taylor–Wiles level** (theorem; Proposition 4.4). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Quadratic twisting characters for the unitary group (p = 2)** (theorem; Lemma 4.5). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Unitary automorphic forms at Taylor–Wiles level** (theorem; Proposition 4.6). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **The tensor image is enormous** (theorem; Lemma 4.7). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **A criterion for enormous image** (theorem; Lemma 4.7 proof, citing [NT23, Definition 2.23, Lemma 2.28]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **The Sen operator lies in the Lie algebra of the image** (theorem; Lemma 4.7 proof, citing [Pat19, Lemmas 2.2.5, 2.2.7]). Route: ArithmeticGaloisRepresentations (G7, R01.1, R01.4).
- **Patching for Theorem 4.1, p > 2** (theorem; Proposition 4.8). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Patching for Theorem 4.1, p = 2** (theorem; Proposition 4.9). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **The functoriality lifting template of Newton–Thorne 2021** (theorem; §4 throughout, citing [NT21b]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Taylor–Wiles data at p = 2 (Khare–Wintenberger)** (theorem; Proposition 4.9 proof, citing [KW09, Lemma 5.10, §7.2] and [NT21b, Lemma 2.9]). Route: GlobalGaloisDeformations (R04.3, G7, R04.5).
- **Vanishing of the adjoint Bloch–Kato Selmer group** (theorem; Theorem 4.1 proof, citing [NT23, Theorem 4.32]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Irreducibility of the patched local ring** (theorem; Theorem 4.1 proof, citing [Kis09b] and [KW09]). Route: DeformationAndDerivedPatchingAlgebra (R03.6).
- **A companion σ with automorphic tensor product** (theorem; Lemma 5.6). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Large image for almost all primes** (theorem; Lemma 5.7 and Proposition 6.1 proofs, citing [Dim05, Proposition 3.8]). Route: ArithmeticGaloisRepresentations (G7, R01.1, R01.4).
- **Automorphisms of PSL₂ and PGL₂ over finite fields** (theorem; Lemma 5.7 proof, citing [Die63, Ch. IV §6]). Route: ArithmeticGaloisRepresentations (G7, R01.1, R01.4).
- **Fontaine–Laffaille theory for small weights** (theorem; Lemma 5.7 and Proposition 5.4 proofs, citing [FL82]). Route: FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.3).
- **Automorphy lifting for potentially diagonalisable representations** (theorem; Lemma 5.7 and Proposition 6.1 proofs, citing [BLGGT14, Theorem 4.2.1, Lemma 1.4.1], [GK14, Lemma 4.4.1]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Ordinary lifts of Hilbert modular forms with a Steinberg place** (theorem; Proposition 6.1 proof, citing [BLGG12, Theorem 6.1.9]). Route: OrdinaryAutomorphicFormsAndModularityLifting (R21.2).
- **Congruence of unipotent and tamely ramified lifting rings** (theorem; Theorem 5.9 proof, citing [Tay08, §3], [Sho18], [SW01]). Route: LocalGaloisDeformationRings (L7, R08.2, R08.3, R08.4, R08.5).
- **Automorphy lifting and residual automorphy for symmetric powers** (theorem; Lemma 2.3, Propositions 6.1, 6.3, Theorems 6.4, 6.5, citing [Tho24]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Clozel–Thorne reductions** (theorem; Proposition 6.1 and Theorem 6.5 proofs, citing [CT14], [CT17]). Route: ModularityAndLanglandsExtensions (ML.0, ML.3, ML.5, ML.2).
- **Bertrand's postulate** (theorem; Theorem 6.4 proof). Route: library: mathlib:Nat.exists_prime_lt_and_le_two_mul.
- **Chebotarev density theorem** (theorem; Lemmas 3.3, 5.7 and Proposition 6.1 proofs). Route: planned: AnalyticNumberTheory:AN.4.

## Mistakes found (`sourceIssues`)

- **E1** (gap; affects a stated result), Proposition 5.4 and its proof, arXiv v2 pp. 39–40; the same step in the proof of Lemma 5.7, p. 42. *Printed:* PSL₂(F_{p^a}) contains an element of order t₁ (and t₁ ≠ p), and therefore that t₁ divides p^a − 1 or p^a + 1. In particular, we must have p^a > M. … this projective image either contains SL₂(F_{l^a}) for some l^a > t or is dihedral. *Correction:* From t₁ | p^a ± 1 and t₁ > M one gets only p^a ≥ t₁ − 1 ≥ M (and in Lemma 5.7 only l^a ≥ t − 1). Either conclude p^a ≥ M, or assume t_i > M + 1. Every use needs only the weaker bound: Theorem 5.9 uses l^b ≥ M > p^{a₀(p)} > max(4r, 5), and Lemma 5.7 uses l^a ≥ t − 1 > 4r + 1. *Reason:* Equality p^a = t₁ − 1 = M is possible: for p = 2, M = 16 and t₁ = 17 (a Fermat prime), 2⁴ ≡ −1 mod 17, so PSL₂(F₁₆) contains elements of order 17, and nothing in the argument forces a larger field. The strict inequality is not proved in that case.
- **E2** (misprint; affects nothing), Proof of Lemma 5.8, checks (3) and (8), arXiv v2 p. 43. *Printed:* (3) r̄_{π,ι_l}(G_F) contains a conjugate of SL₂(F_{l^a}) for some l^a > 5 by hypothesis. … (8) The tensor product r_{γπ,ι} ⊗ Sym^{r−1} r_{σ′,ι} is automorphic, by assumption *Correction:* (3) should concern r̄_{γπ,ι_l} (the representation fed to Theorem 4.1), and (8) should read ι_l for ι. *Reason:* Theorem 4.1 is applied to γπ and δγπ with respect to ι_l. The hypothesis of Theorem 5.5(4) covers every prime l and every ι_l, hence r̄_{γπ,ι_l} = r̄_{π,γ^{−1}ι_l}, so the check holds as intended.

## Checkpoint validation (ChatGPT Pro)

The packet and `handoff/PAPER-NEWTON-THORNE-26.md` specify the exact restart:
Section 3's internal declarations, both branches of Section 4's patching,
Section 1.2/automorphic-ordinary conventions, the remaining Section 5–6 proof
steps, independent prior-paper coverage, and the complete pinned/library and
PDF provenance checks. Correct saved item IDs should be retained.

Local checks passed for JSON, 57 unique IDs, kind/status counts, existing
item/context references and exactly one route for each of 48 missing items.
Full `scripts/check_paper.py` validation must run through the hosted Swarm
submission check. It was not run locally against a full atlas checkout.
No Lean file was changed or compiled, and no formalization or complete
blueprint claim is made. This submission preserves work and exposes the
remaining proof obligations; it does not mark the paper job complete.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **Coverage.** The numbered statements were enumerated from the TeX source and each was matched to an item.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E1. The edge case is p = 2, M = 16, t₁ = 17.
- Check the statements of Propositions 3.10, 3.13 and 4.9.
- Check the owners chosen for the cited inputs.
