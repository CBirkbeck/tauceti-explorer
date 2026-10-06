# Classical Serre modularity — part R27.3: the Khare–Wintenberger endpoint and the Dieulefait–Pacetti route — blueprint

**Fix revision, 30 September 2026 — Codex codex-5ebb6f, Refs #5142.** Independent REV-FIX is pending. The earlier acceptance is preserved in the packet’s reviewHistory; it is not acceptance of these edits. All existing implementation statuses remain unchecked. The current packet has 33 nodes, 16 open requests and five gaps. The missing early component and weight-one descent input are stated below; the atlas stage graph has not been edited.

**Red-team fix, 6 October 2026 — Claude claude-eZ1A2V, FIX-RT-BP-ClassicalSerreModularity--R27.3, Refs #5715.**
Three confirmed findings are applied; REV-FIX-RT-BP-ClassicalSerreModularity--R27.3 checks them. The residual of
the dihedral type is now tied to its standard lattice. Lemma 2.3 chooses a stable lattice according to the residual
case at 2. Theorem 3.4 carries the dyadic conductor as a chain of bounds. The suggested file's library note is
narrowed. The packet now has 33 nodes, 17 open requests and five gaps. See "Stable lattices at 2 and the dyadic
conductor bound" below.

This part covers stages R27.3–R27.6 and R33.1–R33.4 of ClassicalSerreModularity. Current coverage follows the packet:

| Stage | Coverage |
|---|---|
| R27.3 | `source_decomposed`: killing ramification, (W₁) and the (L_r) induction |
| R27.4 | `source_decomposed`: raising levels, weight and level, Theorem 1.2 |
| R27.5 | `source_decomposed`: Theorem 9.1 with Kisin's (H) |
| R27.6 | `partial`: the strong form and its exports; early Artin descent/lattice input remains a gap |
| R33.1 | `source_decomposed`: target, modularity transfer, Paso 1 |
| R33.2 | `source_decomposed`: the good-dihedral prime N, Lemma 2.1, Paso 3 |
| R33.3 | `source_decomposed`: Lemma 2.3, Remark 6, Pasos 4–5 |
| R33.4 | `source_decomposed`: Paso 6 and the assembly |

The accepted restructuring RS-06 narrows each stage:
- **R27.3** keeps Theorem 3.1, the (W₁) initial case and the two-stage induction. KW I Theorem 1.2 is derived in R27.4,
  and the induction does not depend on it.
- **R27.4** owns (D_r), Theorem 3.4 and Theorem 1.2 with their exact ranges, including the scalar local dyadic case.
  The good-dihedral package is R27.1's, and the Buzzard/Wiese branches come from SerreWeightAndLevelOptimisation R20.5.
- **R27.5** applies Kisin's 2-adic theorem, which GL2ModularityLifting R22.6/hypothesis-h already plans, and owns the
  proof of Theorem 9.1.
- **R27.6** owns the single strong statement and its exports. The definitions and the optimiser are
  AlgebraicModularFormsAndSerreWeights R15.4–R15.6 and SerreWeightAndLevelOptimisation R20.6.
- **R33.1–R33.4** own Dieulefait–Pacetti's route.
  - The lifting theorems are GL2ModularityLifting R32.5–R32.6 and the prescribed lifts and compatible systems
    PotentialModularityAndCompatibleSystems R24.3–R24.6.
  - The base cases are SmallRamificationAndAbelianVarietyBaseCases R25.2–R25.5.
  - From this roadmap the route imports only R27.1's early package, never R27.2–R27.6.

Two nodes belong to R27.1: KW I Lemma 8.2 (DP Lemma 1.15) and the insertion of a good dihedral prime. R27.1's coverage
record, in part R26.1, lists them as remaining. They sit in R27.1 so that both strands can import them without the modern
route importing the classical induction.

**Sources:**
- **Khare–Wintenberger**, *Serre's modularity conjecture (I)*, the authors' preprint of Invent. Math. 178 (2009). Read
  §§1–3, 6, 8–10 and the statements of §§4–5.
- **Khare–Wintenberger**, Ann. of Math. 169 (2009), §6.2.
- **Dieulefait–Pacetti**, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2. Read the whole paper.
- **Serre**, Duke Math. J. 54 (1987): §§2.4, 2.6 and 2.8.

Ten nodes are carried from the reviewed decomposition with their excerpts re-selected from these copies. 22 are new.

## Purpose

These layers finish the classical proof of Serre's conjecture: every odd absolutely irreducible ρ̄ : G_ℚ → GL₂(F̄_p) arises
from a newform of weight k(ρ̄), level N(ρ̄) and character lifting ε(ρ̄). They also record Dieulefait–Pacetti's shorter
qualitative proof for odd p, which avoids weight reduction. EllipticCurveModularity R29 consumes the strong form and its
finite-flat weight-two export.

## Layer R27.1 (completing part R26.1, `…/GoodDihedral`)

- **`lemma-8-2-chebotarev-choice-of-auxiliary-primes`** (planet "Lemma 8.2: Chebotarev choice of auxiliary primes").
  - For p ≡ 1 mod 4 and ρ̄ with values in GL₂(𝔽_p) and non-solvable image, it gives primes q of positive density with:
    - Frob_q projectively conjugate to complex conjugation;
    - q ≡ 1 mod 8 and mod every prime ≤ p − 1;
    - q ≡ −1 mod p.
  - The coefficients are 𝔽_p, not 𝔽̄_p (KW I's own correction, after Dieulefait and Wiese).
  - The Chebotarev input is requested from Tau Ceti's Chebotarev roadmap.
- **`good-dihedral-prime-insertion`.** Theorem 5.1(4) with a level-2 character of p′-power order at q makes q a good
  dihedral prime for every residual member in characteristic below p′.

## Layer R27.3: removing ramification and the initial case (`…/KhareWintenberger`)

- **`theorem-3-1-killing-ramification`** (carried; planet "Killing ramification (KW Theorem 3.1)"). (L_r) ⇒ (W_{r+1}):
  a minimal crystalline lift and its member at s drop s from the conductor and keep q.
- **`theorem-3-3-initial-case`** (planet "Theorem 3.3: the initial case (W₁)"). A ρ̄ in (W₁) has N(ρ̄) = q², tame at q
  of odd prime-power order t > 5. Corollary 8.1(ii) (R26.6) applies.
- **`double-induction-assembly`** (carried; planet "The (L_r)/(W_r) double induction"). (W₁) → (L₁) → (W₂) → …, using
  Theorems 3.3, 3.2 and 3.1. The conductor does not decrease at every congruence; the second parameter, p, is inside
  Theorem 3.2.
- **`d0-from-all-lr`.** All (L_r) give (D₀).

## Layer R27.4: removing the good-dihedral condition

- **`auxiliary-characteristic-choice`.** For p′ outside the ramification, ρ̄_{p′} has weight 2 and its inertia has
  projective order ≥ 6, so a solvable image is dihedral and already modular. Otherwise p′ ≡ 1 mod 4 splits completely in E
  and ρ̄_{p′} has non-solvable image.
- **`theorem-3-4-raising-levels-and-the-chebotarev-choice`** (carried id; planet "Raising levels (KW Theorem 3.4)").
  (D_r) implies modularity for 2^{r+1} ∤ N(ρ̄), with k(ρ̄) = 2 when p = 2 and r = 0. The weight condition is needed
  because the weight-4 lift of Theorem 5.1(2) is Steinberg at 2.
  - The bound 2^{r+1} ∤ N(ρ̄′_s) comes from a chain of inequalities, not an equality with N(ρ̄). Let A be the
    dyadic exponent of the first system. Then v₂(N(ρ̄′_s)) ≤ (exponent of the second system) =
    v₂(N(ρ̄_{p′})) ≤ A ≤ r.
  - A = v₂(N(ρ̄)) for odd p. A = 0 for p = 2 and k(ρ̄) = 2. A = 1 for p = 2 and k(ρ̄) = 4, where r ≥ 1.
  - The inputs are R24.6/residual-members (iii) for the reductions, minimality at 2 of the Theorem 5.1(4) lift,
    and the Weil–Deligne conductor of ArithmeticGaloisRepresentations R01.3, which is requested.
- **`strong-form-by-minimal-lifts`** (planet "Weight and level from minimal lifts"). A modular ρ̄ with p odd, or with p = 2
  and k(ρ̄) = 2, arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))):
  - Dihedral images, including ρ̄ induced from ℚ(i), go through Lemma 6.2(i) (Wiese at p = 2).
  - Other images get a minimal crystalline lift (Theorem 5.1(1)), and Theorem 4.1 applies to it.
  - At p = 2 this covers ρ̄|_{D₂} scalar, the case Buzzard's multiplicity-one argument cannot reach.
  - KW I do not write this passage out.
- **`theorem-1-2`** (planet "Khare–Wintenberger Theorem 1.2"). (1) Odd p with N(ρ̄) odd; (2) p = 2 with k(ρ̄) = 2. The
  strong form in Edixhoven's sense at p = 2 is not claimed.

## Layer R27.5: weight four in characteristic two and even conductor

- **`dyadic-weight-two-claim`.**
  - A très ramifiée ρ̄ is finite flat over no extension of odd ramification index. The criterion is requested from R15.4.
  - The new 2-adic member is crystalline with Hodge–Tate weights {0, 1} over ℚ₄(χ′), where e = 3. Hence k(ρ̄′₂) = 2.
- **`d1-by-the-prime-three`.** Congruence at 3 with the order-3 level-2 type at 2, then (H) at 2. This is Theorem 3.2's
  mod-3 step with 2 and 3 exchanged.
- **`dr-for-r-at-least-two`.** Reduce to ρ̄(I₂) not unipotent up to twist, then apply (H) to ρ₂.
- **`hypothesis-H-and-theorem-9-1`** (carried id; planet "Theorem 9.1 (reduction to Hypothesis (H))"). (D_r) for all r,
  then Theorem 3.4. (H) is used only at 2 and is imported from GL2ModularityLifting R22.6/hypothesis-h, including its Breuil–Kisin comparison. This layer does not reconstruct (H).

## Layer R27.6: the full classical statement

- **`full-classical-serre-theorem`** (planet "Serre's modularity conjecture (strong form)"). There are four branches:
  - p odd with N(ρ̄) odd;
  - p odd with N(ρ̄) even;
  - p = 2 with k(ρ̄) = 2;
  - p = 2 with k(ρ̄) = 4, the only branch that needs the imported optimiser (R20.5, R20.6).

  The determinant identity det ρ̄ = ε̄ χ̄_p^{k(ρ̄)−1} and coefficient-field invariance come from R15.6.
- **`finite-flat-weight-two-export`.** For p ≥ 5, ρ̄ finite at p with det ρ̄ = χ̄_p arises from a newform of weight 2,
  level N(ρ̄) and trivial character. The steps are Serre's Proposition 4, the strong form, and Carayol's change of
  nebentypus (R20.4). This is what EllipticCurveModularity R29.2 consumes.
- **`scope-of-the-final-statement-and-the-compatible-system-export`** (carried application). Theorem 10.1 on compatible
  systems: its regular-system conclusion remains here; the general irregular-system theorem is ML.1. The narrower Artin consequence Corollary 10.2(ii) is the explicit `odd-artin-weight-one-modularity` export below.

## Layer R33.1: qualitative target and first weight change (`…/DieulefaitPacetti`)

- **`dp-target-and-the-weight-at-least-two-convention`** (carried; planet "Serre's conjecture, weak form
  (Dieulefait–Pacetti)"). The weak target with k ≥ 2 (Deligne–Serre §6.9). Solvable image in odd characteristic is
  Langlands–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.5).
- **`dp-modularity-lifting-inputs`** (carried id). Theorems 1.4–1.7 in the form §2 uses them: congruent lifts are
  simultaneously modular. The attributions are recorded.
- **`fontaine-laffaille-member-not-bad-dihedral`.** p > 2k excludes both p = 2k − 1 and p = 2k − 3 of Lemma 1.14.
- **`solvable-residual-termination`.** The argument DP call crucial.
- **`paso-1-weight-two-system`** (planet "Paso 1: change to a weight-two system").

## Layer R33.2: good-dihedral auxiliary ramification

- **`dihedral-local-type-at-n`** (construction). κ of order q on G_{ℚ_{N²}}, of niveau 2, and τ_N = Ind κ.
  - The standard lattice is L_std = Ind 𝒪(κ), with basis e₁ = 1 ⊗ 1 and e₂ = s ⊗ 1. On it σ acts by
    diag(κ(σ), κ(σ)^N) and the Frobenius lift s by (0 1; 1 0), because κ(s²) = κ(Art(N)) = 1.
  - Its reduction is 1 ⊕ η. That statement is about L_std only: other stable lattices have the same
    semisimplification but can reduce to a non-split extension.
  - *API:* `levelTwoCharacter`, `levelTwoCharacter_orderOf`, `levelTwoCharacter_artin`, `dihedralType`,
    `dihedralType_irreducible`, `dihedralType.standardLattice`, `dihedralType_standardLattice_residual`,
    `dihedralType_residual_semisimplification`.
  - *Tests:*
    - |𝔽₂₅^×| = 24 ≠ 25 (source issue E4);
    - q = 7, N = 13 has level 2;
    - q = 3, N = 7 is a non-example;
    - the residual trace at Frob_N is 0 on L_std;
    - `residual_depends_on_lattice`: at (q, N) = (3, 2) the lattice L₁ reduces to a non-split module.
- **`dp-lift-existence-and-good-dihedral-insertion`** (carried id, construction; planet "Paso 2: the good-dihedral
  prime N"). q splits in K, so Lemma 1.15 applies over 𝔽_q.
  - *API:* `GoodDihedralInsertion` with `system`, `type_at_N`, `congruences`, `modular_iff`.
  - *Tests:*
    - N = 406561 for q = 13;
    - level 2 at that N;
    - q inert in K is a non-example;
    - q = 5 is excluded.
- **`lemma-2-1-large-image`.** N is a KW I good dihedral prime (t = q) for every member in S₁ ∪ {2, 3}, so KW I Lemma
  6.3(i) (R27.1) gives non-solvable images.
- **`paso-3-killing-the-odd-level`** (planet "Paso 3: killing the odd part of the level"). The lifts must be minimal in
  KW I's sense so that the type at N survives (source issue E7).

## Layer R33.3: the prime two and the auxiliary prime

- **`dp-dyadic-transition-and-the-order-three-type`** (carried id, construction; planet "Lemma 2.3: the order-three type
  at 2").
  - The lattice in ρ̃₂ = Ind χ′ is chosen by the residual case at 2. If ρ̄₃ is unramified at 2, use the standard
    lattice L₀. If it is ramified, use L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂. Then ρ̃₂|_{I₂} is compatible with ρ̄₃ in DP's sense.
  - The lift exists by Theorem 1.9(4). It also exists by KW I Theorem 5.1(4) at (p, q) = (3, 2), whose hypotheses
    the node checks.
  - *API:* `orderThreeCharacter`, `orderThreeType`, `orderThreeType.standardLattice`,
    `orderThreeType.adaptedLattice`, `orderThreeType_standardLattice_reduction`,
    `orderThreeType_adaptedLattice_reduction`, `orderThreeType_exists_lattice_reduction_iso`,
    `orderThreeType_isCompatible`, `typeChangeAtTwo`.
  - *Tests:*
    - 𝔽₄^× has order 3 and 𝔽₂^× order 1;
    - e = 3 is odd;
    - the Steinberg type is a non-example;
    - the lemma needs the system unramified at 3;
    - `standard_lattice_relations`, `adapted_lattice_change_of_basis` and `adapted_lattice_nonsplit`: the
      lattice identities, checked exactly over ℤ[ζ] and modulo π;
    - `standard_lattice_nonexample`: L₀ fails when ρ̄₃ is ramified at 2;
    - `split_case_standard_lattice`: L₀ serves when ρ̄₃ is unramified at 2.
- **`remark-6-weight-two-after-type-change`.** KW I's odd-ramification-index argument. DP's own sentence gives no
  contradiction (source issue E6).
- **`paso-4-removing-two`** (planet "Paso 4: removing 2 from the level"). Steinberg lift, type change at 3, then a
  crystalline weight-2 lift.
- **`paso-5-killing-the-good-dihedral-prime`** (planet "Paso 5: killing the good-dihedral prime").
  - In the reducible branch at N, Pan's theorem needs only the de Rham property. Almost strict compatibility gives no
    Weil–Deligne information there.
  - The bad-dihedral branch is empty because N ≡ 1 mod 8 (Remark 5, imported from R25.5).

## Layer R33.4: terminal characteristic five

- **`dp-terminal-characteristic-five-and-the-schoof-base-case`** (carried; planet "Paso 6: terminal characteristic
  five"). This node is the case analysis at 5, with the weight-2/4 and weight-6 branches from
  SmallRamificationAndAbelianVarietyBaseCases R25.5/paso-six-terminal-cases:
  - the weight-2/4 branch goes through Tate–Serre, Berger–Li–Zhu and Theorem 1.7;
  - the weight-6 branch goes through Snowden and Schoof, after checking the reduction and dimension of A.
- **`dp-odd-characteristic-assembly`** (planet "Serre's conjecture for odd p (Dieulefait–Pacetti §2)"). Pasos 1–6 in
  order. This is the odd-characteristic input of R33.5.

## Mistakes found in the sources

**E3 (misprint, reaches nothing): KW I, proof of Theorem 9.1, p. 19.** The system from Theorem 5.1(4) is said to lift
ρ̄; it lifts ρ̄₃. The finite flatness over the cubic-ramified K is said to come from Theorem 5.1(2); it comes from
Theorem 5.1(4) with almost strict compatibility at 2.

**E4 (misprint, reaches nothing): DP Paso 2, p. 11.** "its residue field has order (N − 1)(N + 1)": that is the order of
the residue field's unit group, N² − 1.

**E5 (misprint, reaches nothing): DP Paso 2, p. 11.** κ's "restriction to the inertia group at q" should be at N.

**E6 (gap, reaches the proof): DP Remark 6, p. 13.** "flat over an extension with even ramification index" gives no
contradiction with flatness over a cubic extension. The operative fact is KW I's: a très ramifiée representation is flat
over no extension of odd ramification index.

**E7 (gap, reaches the proof): DP's "minimal lift" (p. 6) against Lemma 2.1 and Pasos 3–4.**
- Lemma 2.1 assumes the type at N is that of Ind κ. Paso 3 checks only the ramification set.
- A lift that is merely unramified wherever ρ̄ is can change the type at N by a p_i-power (at 2, even-order) character.
- Minimal lifts in KW I's sense, which the cited source of Theorem 1.9 provides, preserve the type.

E3 is in the authors' preprint; the Inventiones version was not obtained. E4–E7 are in arXiv v2, and arXiv records no
journal reference.

## Remaining work

- **Theorem 1.7's second hypothesis** ("ρ|_{D₃} ≠ identity") could not be matched to Skinner–Wiles, which was not
  read. Read residually, it holds automatically (a gap).
- **Supplier statements:** the imported lifting and lift-existence theorems were taken from DP's summaries, and
  KW II §10 was not read. All are requested from their owners.
- **R27.1's coverage record** (part R26.1) still lists the Chebotarev insertion as remaining. This part's two R27.1
  nodes discharge it.

## Sources

- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987), 179–230.

## The weight-one Artin export for ML.1
Finding /8 requires an explicit ℚ Artin export. It is a separate node, while the general irregular-compatible-system endpoint remains with ML.1. The source’s weight-one descent is an exact gap. A whole ML.1 import back into R27.6 would cycle with the requested R27.6 → ML.1 direction and is not added.

### Weight-one modularity of odd two-dimensional Artin representations
`ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity` (theorem).
KW I Corollary 10.2(ii): a continuous, odd, irreducible representation ρ : G_ℚ → GL₂(ℂ), with the usual topology and finite image (the Artin setting), is isomorphic to the Deligne–Serre representation of a normalized cuspidal newform of weight one. This is the ℚ export registered by ModularityAndLanglandsExtensions ML.1; the general irregular compatible-system theorem remains at ML.1.

**Hypotheses.**
- Oddness is det ρ(c) = −1, and irreducibility is over ℂ.
- The Artin representation has finite image and hence finite ramification; its reductions at good coefficient primes satisfy the strong Serre theorem. The weight-one descent criterion is an exact open early supplier contract, not an import of the full later ML.1 endpoint.

**Proof outline.**
- Choose a number-field model and stable lattice of the finite-image Artin representation; for infinitely many coefficient primes use irreducible reductions with fixed conductor and the strong Serre theorem.
- Apply the source-scoped Gross/Coleman–Voloch and Khare weight-one descent input cited in KW I Theorem 10.1(ii); the early proof contract and its fine owner are recorded as a gap. Do not deduce weight one merely from existence of a cohomological form.
- Recover the characteristic-zero Artin representation using the fixed finite-image character and Deligne–Serre attachment from AutomorphicGaloisRepresentations R19.1.

**Checks.**
- Even Artin representations do not meet the oddness hypothesis.
- Reducible sums of characters do not meet the cuspidal irreducibility hypothesis.
- The weight-one conclusion requires the descent criterion, not the weight-at-least-two DP endpoint.

**Imports.** `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `AutomorphicGaloisRepresentations:R19.1`, `ArithmeticGaloisRepresentations:R01.3`.

**Sources.** kw-serre-modularity-I, Corollary 10.2(ii) and discussion after Theorem 10.1, author PDF p. 21.

## Early good-dihedral boundary and the Paso 2 application

Lemma 8.2 now uses R01.3’s continuous, absolutely irreducible, odd residual representation and R01.4’s prime-field finite-subgroup classification. It does not use Serre weights, R15.6, or R27.1/dickson-and-the-dyadic-solvable-refinement. Keep the prime-field hypothesis 𝔽_p and p ≡ 1 modulo 4: coefficients merely in 𝔽̄_p do not give the source’s corrected rationality condition. The Chebotarev argument keeps the abelian intersection and complex-conjugation class explicit.

The proposed R27.1:good-dihedral component is not a live stage. The node’s stable ID and current parent are retained. Its gap records the remaining maintainer work: move Definition 2.1 and Lemma 6.3 from the other CSM part; remove R26.6 → R27.1 and repoint the RS-06 prefix consumers. This packet cannot claim removal of the stage-level level-one ancestor. Good-dihedral-prime-insertion is the later application of the R24.3 prescribed lift; it remains separate from the early finite-image/Chebotarev package. The level-one input R26.6 → R27.3 for W₁ is retained.

The stable dp-lift-existence-and-good-dihedral-insertion node is only Paso 2. R24.3 already appears among its prerequisites and remains the sole owner of the general lift-existence theorem. The new explicit Paso 1 prerequisite supplies the weight-two system. At a split coefficient prime q outside its ramification set, Fontaine–Laffaille gives residual weight 2; this selects the crystalline clause in DP Theorem 1.9(4). Residual weight q + 1 would select a Steinberg clause instead. Keep Lemma 1.15’s prime-field rationality, the N-congruences, the local inertial type and the correction that the decomposition-group image is infinite but projectively dihedral. No general cases (1)–(4) are reproved in this node.

## Stable lattices at 2 and the dyadic conductor bound

This section records the red-team fix FIX-RT-BP-ClassicalSerreModularity--R27.3. It changes no theorem statement.
It makes two arguments precise: the choice of an integral lattice in Lemma 2.3, and the propagation of the dyadic
conductor in Theorem 3.4.

### The reduction of an induced type depends on the lattice

`R33.2/dihedral-local-type-at-n` builds τ_N = Ind κ. Its standard lattice is L_std = Ind 𝒪(κ), with basis
e₁ = 1 ⊗ 1 and e₂ = s ⊗ 1 for a Frobenius lift s.

- A tame generator σ acts by diag(κ(σ), κ(σ)^N).
- s acts by (0 1; 1 0). Here κ(s²) = κ(Art(N)) for every Frobenius lift: the transfer sends s to s² = Art(Nu)
  with u ∈ ℤ_N^×, and κ is trivial on ℤ_N^× because q ∤ N − 1. So the normalisation κ(Art(N)) = 1 gives κ(s²) = 1.
- The reduction of L_std is 1 ⊕ η, unramified with trace 0 at Frobenius (API
  `dihedralType_standardLattice_residual`).

Every stable lattice has semisimplified reduction 1 ⊕ η (`dihedralType_residual_semisimplification`). The
reduction itself is not determined, and Paso 2 needs only the split one: ρ̄ is unramified at N there, so L_std
realises ρ̄|_{I_N}.

### Lemma 2.3: which lattice realises ρ̄₃ at 2

Put 𝒪 = ℤ₃[ζ] with ζ² + ζ + 1 = 0, and π = ζ − 1. Let ρ̃₂ = Ind χ′, where χ′ has order 3 and niveau 2 and is
normalised by χ′(Art(2)) = 1. DP's Theorem 1.9(4) prescribes an inertial type τ at 2 only when τ is *compatible*
with ρ̄₃ (DP p. 6). Compatible means some 𝒪-lattice stable under τ reduces to ρ̄₃|_{I₂}.

**The residual cases.** The system is Steinberg at 2 up to an unramified twist γ̃. So ρ̄₃(Frob₂) has eigenvalues
γ(Frob₂)·{−1, 1}, since χ̄₃(Frob₂) = 2 = −1, and ρ̄₃(I₂) is unipotent. Inertia then acts through its unique quotient
of order 3. There are two cases.

- *Split:* ρ̄₃ is unramified at 2, and ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1).
- *Non-split:* ρ̄₃(σ) = (1 b; 0 1) with b ≠ 0. The tame relation Frob σ Frob⁻¹ = σ² forces the Frobenius
  eigenvalues to be −β and β, with −β on the inertia-invariant line. After conjugation,
  ρ̄₃|_{D₂} ≅ β ⊗ (Frob₂ ↦ diag(−1, 1), σ ↦ (1 1; 0 1)).

**Two lattices.**

| Lattice | σ | Frob₂ | Reduction mod π |
|---|---|---|---|
| L₀ = 𝒪e₁ ⊕ 𝒪e₂ | D₀ = diag(ζ, ζ²) | F₀ = (0 1; 1 0) | σ ↦ 1; Frob with eigenvalues ±1: split |
| L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂ | D₁ = (ζ 0; ζ ζ²) | F₁ = (1 π; 0 −1) | σ ↦ (1 0; 1 1), Frob ↦ diag(1, −1): non-split |

The change of basis P = (1 0; 1 π) satisfies D₀P = PD₁ and F₀P = PF₁. Both pairs satisfy D³ = F² = 1 and
FDF⁻¹ = D². The suggested file checks all of this exactly over ℤ[ζ]. In the basis (f₂, f₁), the reduction of L₁
is the non-split module above. So, after twisting by an unramified lift of γ:

- L₀ realises the split case;
- L₁ realises the non-split case;
- L₀ cannot realise the non-split case, because its reduction has two-dimensional inertia invariants
  (`standard_lattice_nonexample`).

This is `orderThreeType_exists_lattice_reduction_iso`, and the compatibility is `orderThreeType_isCompatible`. DP's
sentence that the two representations "have the same reduction" on I₂ holds for this choice of lattice. No source
erratum is asserted.

**The lift.** Theorem 1.9(4) then applies, through R24.3/modern-prescribed-type-lifts. So does KW I Theorem 5.1(4)
at (p, q) = (3, 2), through R24.3/theorem-5-1-part-4-level-two-type-at-q. Its hypotheses hold:

- ρ̄₃ is of S-type with k(ρ̄₃) = 2;
- ρ̄₃|_{ℚ(µ₃)} is absolutely irreducible, because the image of ρ̄₃ is non-solvable;
- ρ̄₃|_{D₂} is (χ̄₃ ∗; 0 1) up to unramified twist;
- 3 | 2 + 1, and χ′|_{I₂} = ω_{2,2} has level 2 and order 3;
- there is no parity condition, because p is odd.

Its local input at 2 is the level-two condition of LocalGaloisDeformationRings R08.6/export-away-from-p (b). The
matrices of L₀ and L₁ are explicit lifts of that condition: they satisfy ρ(F)ρ(σ)ρ(F)⁻¹ = ρ(σ)².

### Theorem 3.4: the dyadic conductor is bounded, not preserved

Let A be the dyadic conductor exponent of the first system (ρ_λ) of Theorem 5.1(2). It is the exponent of the
Weil–Deligne parameter r₂ that all members at λ ∤ 2 share.

| Case | A | Why A ≤ r |
|---|---|---|
| p odd | v₂(N(ρ̄)) | ρ_p is minimal at 2, and 2^{r+1} ∤ N(ρ̄) |
| p = 2, k(ρ̄) = 2 | 0 | inertial parameter (1 ⊕ 1, 0) |
| p = 2, k(ρ̄) = 4 | 1 | parameter (id, N ≠ 0): 2 − dim ker N = 1; the theorem excludes r = 0 |

The chain is v₂(N(ρ̄′_s)) ≤ a₂(ρ′_λ) = v₂(N(ρ̄_{p′})) ≤ A ≤ r.

- The two inequalities say that reduction at a coefficient prime other than 2 cannot increase the conductor
  (R24.6/residual-members (iii), from R01.3).
- The equality is minimality at 2 of the Theorem 5.1(4) lift of ρ̄_{p′}. That lift is minimal at every prime other
  than p′ and q, and q ≡ 1 mod 8.

Minimality refers to the intermediate ρ̄_{p′}, not to ρ̄, and either reduction may lower the exponent. Lowering
happens: ρ̄_{E,5} of the curve 11a1 is unramified at 11, although E has multiplicative reduction there. So no
equality with v₂(N(ρ̄)) is claimed.

In the boundary case p = 2, k(ρ̄) = 4, r = 1, the original exponent is 0, A = 1, and the chain gives exactly the
bound ≤ 1 that (D₁) needs. The monodromy term of the conductor is requested from ArithmeticGaloisRepresentations
R01.3.
