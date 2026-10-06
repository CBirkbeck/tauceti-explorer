# Classical Serre modularity — part R27.3: the Khare–Wintenberger endpoint and the Dieulefait–Pacetti route — blueprint

**Area fix, round 3, 6 October 2026 — Claude claude-c9TlsS, FIX-RT-AREA-langlands-2~3, Refs #5870.** REV-FIX-RT-AREA-langlands-2~3
checks this round. The packet now has 37 nodes, 19 open requests and four gaps. Four changes:
- **Weight one (finding /8).** KW I Corollary 10.2(ii) is planned in full in R27.6, in four new declarations: the
  reductions of an Artin representation, the weight-one Katz form of an unramified residual representation, lifting of
  weight-one forms for almost all ℓ, and Khare's descent. Nothing is imported from ModularityAndLanglandsExtensions;
  ML.1 consumes R27.6. See "Weight one: Corollary 10.2(ii) in R27.6" below.
- **Good-dihedral sub-layers (finding /1).** The packet's restructure entry proposes R27.1a (Definition 2.1, Lemma 6.3,
  Lemma 8.2) and R27.1b (the insertion of KW I §8.4 and the KW I §6 lemmas), as part R26.1 does. The nodes of
  R33.1–R33.4 now cite from R27.1 only the three declarations of R27.1a, and take Dickson's classification and
  Lemma 6.2(ii) from their owners in R01.4 and R15.4. The stage edge R26.6 → R27.1 can only be removed by the maintainer;
  the earlier gap on this is replaced by the restructure entry, since no mathematical input is missing.
  See "Early good-dihedral boundary and the Paso 2 application" below.
- **KW I Theorem 4.1 (finding /12).** Its four consumers cite the two declarations of GL2ModularityLifting, R22.5
  (odd p) and R22.6 (p = 2), instead of the stage PotentialModularityAndCompatibleSystems R24.4.
- **Theorem 1.4.** `dp-modularity-lifting-inputs` cites the theorem and its application contract in GL2ModularityLifting
  R32.2; that contract no longer cites a node of R33.

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
  - The Chebotarev input is Tau Ceti's Chebotarev roadmap, Layer 10 (a prerequisite, with its request), and Dickson's
    classification is R01.4's node `dickson-classification-and-the-dyadic-refinement`.
  - Proposed sub-layer: R27.1a, with Definition 2.1 and Lemma 6.3 of part R26.1.
- **`good-dihedral-prime-insertion`.** Theorem 5.1(4) with a level-2 character of p′-power order at q makes q a good
  dihedral prime for every residual member in characteristic below p′. Proposed sub-layer: R27.1b; only the classical
  route (Theorem 3.4) uses it.

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
  systems: its regular-system conclusion is here. The general irregular-system statement is ML.1's, and its proof after
  Serre's conjecture is planned here and imported by ML.1; ML.1 adds the Sen–Fontaine unramifiedness and the
  irreducibility of almost all reductions, and uses the weight-one step in its form without a hypothesis on Frobenius.
- **`artin-reductions-of-serre-type`**, **`unramified-residual-representations-arise-in-weight-one`**,
  **`weight-one-reduction-is-onto-for-almost-all-primes`**, **`weight-one-descent-from-infinitely-many-primes`** (planet
  "Khare's weight-one descent") and **`odd-artin-weight-one-modularity`** (planet "Odd Artin representations and
  weight-one modularity"): the proof of Corollary 10.2(ii), stated in full in "Weight one: Corollary 10.2(ii) in R27.6".

## Layer R33.1: qualitative target and first weight change (`…/DieulefaitPacetti`)

- **`dp-target-and-the-weight-at-least-two-convention`** (carried; planet "Serre's conjecture, weak form
  (Dieulefait–Pacetti)"). The weak target with k ≥ 2 (Deligne–Serre §6.9). Solvable image in odd characteristic is
  Langlands–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.5). Dickson's classification is cited from R01.4.
- **`dp-modularity-lifting-inputs`** (carried id). Theorems 1.4–1.7 in the form §2 uses them: congruent lifts are
  simultaneously modular. The attributions are recorded. Theorem 1.4 is GL2ModularityLifting
  R32.2/odd-prime-statement-over-q, and what each application must verify is R32.2/application-requirements; the
  verification is made in the Paso nodes, which cite this node.
- **`fontaine-laffaille-member-not-bad-dihedral`.** p > 2k excludes both p = 2k − 1 and p = 2k − 3 of Lemma 1.14, which
  is cited from its owners (R15.4/bad-dihedral-normalized-weight-application and
  R01.4/bad-dihedral-representations-and-the-oddness-criterion).
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
- **Supplier statements:** the imported lifting and lift-existence theorems were taken from DP's summaries. KW II §10.2
  was read for Theorem 4.1, which is now cited from its declarations in GL2ModularityLifting R22.5 and R22.6; KW II
  §10.3, which proves Theorem 5.1, was not read and is requested from PotentialModularityAndCompatibleSystems.
- **R27.1's coverage record** (part R26.1) still lists the Chebotarev insertion as remaining. This part's two R27.1
  nodes discharge it. The stage split of R27.1 into R27.1a and R27.1b awaits the maintainer (the restructure entry).
- **Weight one:** Khare's note, which KW I cite for the descent, was not read; the descent node is proved from its
  listed prerequisites (a gap names the comparison still to make).

## Sources

- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987), 179–230.

## Weight one: Corollary 10.2(ii) in R27.6

Finding /8 asks that R27.6 export KW I Corollary 10.2(ii), and that ModularityAndLanglandsExtensions ML.1 import it
rather than construct it. The corollary is now planned in full in this layer. KW I give one sentence for the
weight-one step (p. 20), citing Khare's note, Gross, Coleman–Voloch and Edixhoven. The plan below follows that sentence:
reduce the Artin representation modulo infinitely many primes; apply the strong form of Serre's conjecture, which gives
weight ℓ; descend to weight one modulo ℓ by Edixhoven's theorem; lift to characteristic zero for almost all ℓ; and
conclude by a pigeonhole argument. The suppliers are layers that precede R27.6: ArithmeticGaloisRepresentations
R01.1, R01.3, R01.5; AlgebraicModularFormsAndSerreWeights R15.1, R15.2, R15.4, R15.5, R15.6; SerreWeightAndLevelOptimisation
R20.3; AutomorphicGaloisRepresentations R19.1; and Tau Ceti's Chebotarev (Layer 10) and ModularForms (Layer 4) roadmaps.
ML.1 is not among them.

Only primes ℓ at which the Frobenius of the Artin representation is conjugate to complex conjugation are used. At
these primes the two Frobenius eigenvalues are 1 and −1, so the weight-one step is the non-exceptional case of
Edixhoven's theorem.

### Reductions of an odd irreducible Artin representation: Serre type, conductor and weight
`ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type` (lemma).

Let ρ : G_ℚ → GL₂(ℂ) be continuous for the usual topology (so of finite image G = ρ(G_ℚ) = Gal(M/ℚ)), irreducible and odd, with Artin conductor N and determinant ε, a Dirichlet character modulo N with ε(−1) = −1. (a) There are a number field E ⊂ ℂ and ρ_E : G → GL₂(E) with ρ_E ⊗_E ℂ ≅ ρ. For every finite place λ of E, with ring of integers 𝒪_λ of the completion and residue field k_λ of characteristic ℓ, ρ_E stabilises an 𝒪_λ-lattice Λ, and ρ̄_λ := Λ/λΛ : G_ℚ → GL₂(k_λ) satisfies tr ρ̄_λ(Frob_r) = tr ρ(Frob_r) mod λ and det ρ̄_λ(Frob_r) = ε(r) mod λ for every prime r ∤ Nℓ. (b) If ℓ ∤ |G| (so ℓ is odd, because ρ(c) has order 2), then ρ̄_λ is absolutely irreducible and odd, it is faithful on G (it cuts out the same field M), it does not depend on Λ up to isomorphism, and dim (ρ̄_λ)^H = dim ρ^H for every subgroup H ≤ G. (c) If moreover ℓ ∤ N, then ρ̄_λ is unramified at ℓ, its prime-to-ℓ Artin conductor is N(ρ̄_λ) = N, its character is ε(ρ̄_λ) = ε mod λ, Serre's weight is k(ρ̄_λ) = ℓ, and Edixhoven's weight is 1. (d) The set P_c of primes ℓ ∤ N|G| for which ρ(Frob_ℓ) is conjugate in G to ρ(c), c a complex conjugation, has Dirichlet density |C|/|G| > 0, C the conjugacy class of ρ(c). For ℓ ∈ P_c and λ | ℓ, ρ̄_λ(Frob_ℓ) has the two distinct eigenvalues 1 and −1, so ρ̄_λ|_{D_ℓ} ≅ 1 ⊕ η with η ≠ 1 unramified; in particular it is not an extension of an unramified character by itself.

**Hypotheses and conventions.**
- Continuity for the usual topology of GL₂(ℂ) forces a finite image, since GL₂(ℂ) has no small subgroups; this is the Artin setting of KW I §10.2.
- ℓ ∤ |G| is what makes reduction exact on invariants: |H| is invertible in 𝒪_λ, the averaging element e_H = |H|⁻¹ Σ_{h∈H} h acts on Λ, Λ^H = e_HΛ is a direct summand, and (Λ/λΛ)^H = e_H(Λ/λΛ) = Λ^H/λΛ^H.
- E need not be the field of traces. Any number field over which ρ is realisable serves; no statement about Schur indices is used.
- ℓ odd, which follows from ℓ ∤ |G|, is needed for oddness (det ρ̄_λ(c) = −1 ≠ 1) and for (d) (the eigenvalues 1 and −1 are distinct).
- Serre's weight in the unramified case is ℓ by his convention, not 1 (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases); the weight-one form comes from Edixhoven's refinement, in R27.6/unramified-residual-representations-arise-in-weight-one.

**Proof outline.**
- A model. The image is finite, so ρ is a representation of the finite group G; a complex representation of a finite group is realisable over the algebraic closure of ℚ in ℂ (ℚ̄[G] is split semisimple), hence over a number field E. For a place λ the lattice Λ = Σ_{g∈G} ρ_E(g)𝒪_λ² is stable (ArithmeticGaloisRepresentations R01.1/continuity-descent-and-lattice-independence). The Frobenius identities hold in 𝒪_E before reduction.
- Absolute irreducibility for ℓ ∤ |G|. By exactness of G-invariants, End_{k_λ[G]}(Λ/λΛ) = End_{𝒪_λ[G]}(Λ) ⊗ k_λ, and End_{𝒪_λ[G]}(Λ) is a direct summand of End(Λ) of rank dim End_{E_λ[G]}(ρ_E ⊗ E_λ) = 1; the same holds after any finite extension of 𝒪_λ. By Maschke's theorem (mathlib MonoidAlgebra.Submodule.exists_isCompl, as ℓ ∤ |G|) the reduction is semisimple over every finite extension of k_λ, and a semisimple module whose endomorphism ring is the field of scalars is simple.
- Faithfulness and oddness. The kernel of GL₂(𝒪_λ) → GL₂(k_λ) is a pro-ℓ group and |G| is prime to ℓ, so ρ̄_λ is injective on G. det ρ̄_λ(c) = −1 ≠ 1 because ℓ is odd. Independence of Λ: the reduction is irreducible, so all stable lattices are homothetic.
- Conductor. In the formula n(q, ·) = Σ_{i≥0} [G₀ : G_i]⁻¹ dim V/V^{G_i} of ArithmeticGaloisRepresentations R01.3/artin-conductor-with-its-wild-part, the ramification groups G_i at a prime q are the same subgroups of G for ρ and for ρ̄_λ (same field M), and by (b) the dimensions agree; so n(q, ρ̄_λ) = n(q, ρ) for every q ≠ ℓ. If ℓ ∤ N the inertia group at ℓ is trivial in G.
- Weight and character. ρ̄_λ|_{I_ℓ} is trivial, so (a, b) = (0, 0) in Serre's tame recipe and k(ρ̄_λ) = ℓ, while Edixhoven's weight is 1 (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases and R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k). From det ρ̄_λ = ε(ρ̄_λ)χ̄_ℓ^{k−1} and χ̄_ℓ^{ℓ−1} = 1, ε(ρ̄_λ) = det ρ̄_λ = ε mod λ.
- (d). The Chebotarev density theorem (Tau Ceti Chebotarev, Layer 10) for M/ℚ and the class C; removing the finitely many ℓ | N|G| does not change the density. ρ(c) has order 2 and determinant −1, so its eigenvalues are 1 and −1, and so are those of the conjugate ρ(Frob_ℓ); they stay distinct modulo λ.

**Checks.**
- G ≅ S₃ in its reflection representation (the Artin representation of conductor 23 attached to the splitting field of x³ − x − 1): at ℓ = 3 the reduction is reducible, because the sum-zero plane of 𝔽₃³ contains (1, 1, 1); so ℓ ∤ |G| cannot be dropped from (b).
- For the same ρ and ℓ ∤ 6·23: the inertia group at 23 has order 2 and acts by a reflection, n(23, ρ) = 1 = n(23, ρ̄_λ), and N(ρ̄_λ) = 23.
- For the same ρ, c is a transposition and P_c is the set of ℓ ∤ 138 whose Frobenius is a transposition, of density 3/6 = 1/2 (the primes inert in ℚ(√−23)).
- An even ρ (det ρ(c) = 1) gives reductions that are not of S-type for odd ℓ; a reducible ρ gives reducible reductions.

**Imports.** `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`, `ArithmeticGaloisRepresentations:R01.3/artin-conductor-with-its-wild-part`, `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`, `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `mathlib:MonoidAlgebra.Submodule.exists_isCompl`.

**Sources.** kw-serre-modularity-I, §10.2, p. 21 of the preprint; kw-serre-modularity-I, Proof of Theorem 10.1, p. 20 of the preprint.

### An odd irreducible mod ℓ representation unramified at ℓ arises from a Katz eigenform of weight one
`ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one` (theorem).

Let ℓ be an odd prime and ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ) continuous, irreducible and odd, unramified at ℓ, with conductor N = N(ρ̄) and character ε = ε(ρ̄) = det ρ̄, and suppose that ρ̄(Frob_ℓ) has two distinct eigenvalues. Then there is a Katz cuspidal eigenform h of type (N, 1, ε) over 𝔽̄_ℓ (in Katz's sense, as in SerreWeightAndLevelOptimisation R20.3: a section of ω ⊗ 𝒪(−cusps) on the Γ₁(N) moduli stack over 𝔽̄_ℓ, which for N ≥ 5 is the scheme X₁(N), on which the diamond operators act through ε, and an eigenvector of T_r for every prime r ∤ Nℓ) with T_r h = tr ρ̄(Frob_r)·h for every prime r ∤ Nℓ. Without the hypothesis on ρ̄(Frob_ℓ) the same conclusion holds, by the form of Edixhoven's theorem for ℓ > 2 that has no exceptional case (Coleman–Voloch, as SerreWeightAndLevelOptimisation R20.3/edixhoven-weight-theorem records it from the note in Edixhoven's paper). The Artin case of this layer uses only the form with the hypothesis, whose proof is given below; a general irregular compatible system needs the form without it.

**Hypotheses and conventions.**
- ℓ is odd. At ℓ = 2 Edixhoven's theorem keeps its exceptional case, and KW I's sketch concerns almost all λ only.
- The form is a Katz form over 𝔽̄_ℓ. It need not be the reduction of a characteristic-zero form of weight one for the given ℓ; that holds for all but finitely many ℓ (R27.6/weight-one-reduction-is-onto-for-almost-all-primes).
- Serre's weight of ρ̄ is ℓ, so the strong form produces a newform of weight ℓ and level N. The descent to weight one is the minimal-weight part of Edixhoven's theorem; for weight ℓ it is Gross's companion-form theorem, with Coleman–Voloch for the parts of Gross's argument that rest on unchecked compatibilities.
- With distinct eigenvalues α ≠ β of ρ̄(Frob_ℓ), ρ̄|_{D_ℓ} ≅ λ(α) ⊕ λ(β) is not an extension of an unramified character by itself, so ρ̄ is not exceptional in Edixhoven's sense and the minimal-weight statement applies without the note.
- The supplier statement is for every level N ≥ 1 prime to ℓ. KW II §10.2 remarks that Gross's own hypothesis N > 4 is harmless when the optimal level is not required.
- The form without the hypothesis on Frobenius rests on Coleman–Voloch through the supplier node; neither their paper nor Edixhoven's note was read here (see the gap on primary sources). It is not used by any node of this packet.

**Proof outline.**
- Serre's weight is k(ρ̄) = ℓ (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases with trivial inertia action). The strong form (R27.6/full-classical-serre-theorem) gives a newform f of weight ℓ, level N and a character reducing to ε, and a prime λ′ | ℓ of its coefficient field with ρ̄_{f,λ′} ≅ ρ̄.
- The reduction of f modulo λ′ is a Katz cuspidal eigenform g of type (N, ℓ, ε) over 𝔽̄_ℓ with ρ_g ≅ ρ̄ (AlgebraicModularFormsAndSerreWeights R15.2/integral-lattice-and-reduction-image and R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field: the reduction-image space lies in the Katz space, Hecke-compatibly).
- g is ordinary: if a_ℓ(g) = 0, ρ_g|_{I_ℓ} would be ψ^{ℓ−1} ⊕ ψ′^{ℓ−1} with ψ of level 2 (SerreWeightAndLevelOptimisation R20.3/local-form-of-supersingular-eigenforms), which is ramified. So ρ_g|_{D_ℓ} ≅ (λ(ε(ℓ)/a_ℓ) ∗; 0 λ(a_ℓ)) (R20.3/local-form-of-ordinary-eigenforms, with χ̄^{ℓ−1} = 1), its Frobenius eigenvalues ε(ℓ)/a_ℓ and a_ℓ are α and β, and α ≠ β gives a_ℓ² ≠ ε(ℓ).
- Edixhoven's theorem (R20.3/edixhoven-weight-theorem), minimal-weight part: ρ̄ is not exceptional and Edixhoven's weight is 1 (R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k), so there is a cuspidal eigenform h of type (N, 1, ε) with the eigenvalues of g for T_r, r ≠ ℓ, and ρ_h ≅ ρ̄. Concretely, ρ_g|_{D_ℓ} is unramified, hence tamely ramified, and a_ℓ² ≠ ε(ℓ), so Gross's theorem (R20.3/companion-forms, k = ℓ, k′ = ℓ + 1 − ℓ = 1) gives the companion h with r·a_r(h) = r·a_r(g), that is a_r(h) = a_r(g), for r ≠ ℓ.
- So T_r h = a_r(g)h = tr ρ̄(Frob_r)h for r ∤ Nℓ, and the diamond operators act on h through ε.
- Without the hypothesis on ρ̄(Frob_ℓ): steps 1 and 2 are unchanged, and the minimal-weight part of R20.3/edixhoven-weight-theorem is applied to g in its form for ℓ > 2, in which 'not exceptional' is not required.

**Checks.**
- ρ̄ = ρ̄_λ for an odd irreducible Artin representation and ℓ ∈ P_c (R27.6/artin-reductions-of-serre-type (d)): the eigenvalues are 1 and −1, a_ℓ(g) = ±1 and ε(ℓ) = −1, so a_ℓ(g)² = 1 ≠ −1.
- Consistency with the converse (R20.3/weight-one-forms-unramified-at-p): a weight-one Katz eigenform h with T_ℓ-eigenvalue a and character ε gives the two weight-ℓ forms Ah and Vh, on whose span U has characteristic polynomial X² − aX + ε(ℓ); here a = α + β.
- If ρ̄ is ramified at ℓ, Edixhoven's weight is at least 2 and no weight-one eigenform of level prime to ℓ has representation ρ̄ (the minimality in Edixhoven's theorem).

**Imports.** `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem`, `SerreWeightAndLevelOptimisation:R20.3/companion-forms`, `SerreWeightAndLevelOptimisation:R20.3/local-form-of-ordinary-eigenforms`, `SerreWeightAndLevelOptimisation:R20.3/local-form-of-supersingular-eigenforms`, `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field`.

**Sources.** kw-serre-modularity-I, Proof of Theorem 10.1, p. 20 of the preprint.

### Katz cusp forms of weight one and level N are reductions of characteristic-zero forms for all but finitely many ℓ
`ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes` (lemma).

Let N ≥ 5, X = X₁(N) the compactified fine moduli scheme over ℤ[1/N] (proper and smooth of relative dimension one), ω its Hodge bundle and C the cuspidal divisor, and put S₁(N; A) = H⁰(X_A, ω ⊗ 𝒪(−C)) for a ℤ[1/N]-algebra A. There is a finite set B(N) of primes such that for every prime ℓ ∤ N outside B(N) and every discrete valuation ring 𝒪 flat over ℤ_(ℓ) with residue field k, the base-change map S₁(N; 𝒪) ⊗_𝒪 k → S₁(N; k) is an isomorphism, compatible with the operators T_r (r ∤ Nℓ) and the diamond operators. B(N) can be taken to be the set of primes ℓ for which H¹(X, ω ⊗ 𝒪(−C)) has nonzero ℓ-torsion.

**Hypotheses and conventions.**
- N ≥ 5 makes the Γ₁(N) moduli problem representable; smaller levels are handled in R27.6/weight-one-descent-from-infinitely-many-primes by passing to a multiple of N.
- The statement is specific to weight one. For k ≥ 3 the group H¹(X, ω^k ⊗ 𝒪(−C)) vanishes by degree; for k = 2, ω² ⊗ 𝒪(−C) ≅ Ω¹ by Kodaira–Spencer and H¹(X, Ω¹) is locally free by duality, so it has no torsion. In weight ≥ 2 the exceptional set is therefore empty. (AlgebraicModularFormsAndSerreWeights R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary treats ω^k without the cusp twist.)
- B(N) is allowed to be nonempty: the lemma does not say that every Katz form of weight one lifts. Katz leaves base change in weight one open for full level n ≥ 12 (the same R15.2 node).
- The Hecke action on H⁰ and H¹ with arbitrary coefficients and its compatibility with coefficient maps are R15.2/torsion-cohomology-hecke-action, stated there for ℓ odd and N ≥ 5 prime to ℓ.

**Proof outline.**
- Multiplication by ℓ on the invertible sheaf ℒ = ω ⊗ 𝒪(−C) of the flat ℤ[1/N]-scheme X is injective with cokernel ℒ/ℓ, and the long exact sequence gives 0 → H⁰(X, ℒ)/ℓ → H⁰(X_{𝔽_ℓ}, ℒ) → H¹(X, ℒ)[ℓ] → 0.
- H¹(X, ℒ) is a finitely generated ℤ[1/N]-module, because X is proper over the noetherian ring ℤ[1/N] (the H¹ form of AlgebraicModularFormsAndSerreWeights R15.2/finite-generation-of-geometric-sections, requested). ℤ[1/N] is a principal ideal domain, so the torsion submodule of a finitely generated module is finite, and its ℓ-torsion vanishes for all but finitely many ℓ.
- For ℓ outside this finite set the first map is an isomorphism; this is the surjectivity criterion of R15.2/integral-lattice-and-reduction-image (no λ-torsion in the H¹ of the cusp sheaf). Flat base change from ℤ_(ℓ) to 𝒪 gives the general form.
- The maps of the exact sequence commute with T_r and the diamond operators (R15.2/torsion-cohomology-hecke-action).

**Checks.**
- Weight 3 at any level N ≥ 5: H¹(X, ω³ ⊗ 𝒪(−C)) = 0 by degree, and the corresponding set is empty. Weight 2: the group is H¹(X, Ω¹), free of rank one over the ring of constants and not zero, but torsion-free, and the set is again empty.
- If H¹(X, ℒ) has an element of order 7, then 7 ∈ B(N), and the lemma says nothing about Katz forms of weight one modulo 7.
- The lemma gives no bound on B(N); only its finiteness is used, in the pigeonhole argument of the descent.

**Imports.** `AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`, `AlgebraicModularFormsAndSerreWeights:R15.2/torsion-cohomology-hecke-action`, `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`, `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

**Sources.** kw-serre-modularity-I, Proof of Theorem 10.1, p. 20 of the preprint.

### Khare's descent: weight-one eigenvalues modulo infinitely many primes come from a weight-one newform
`ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (theorem; planet "Khare's weight-one descent").

Let N ≥ 1, ε a Dirichlet character modulo N, E ⊂ ℂ a number field containing the values of ε, and (t_r) a family of elements of 𝒪_E indexed by the primes r ∤ N. Put N′ = N if N ≥ 5 and N′ = 5N otherwise. Suppose that for infinitely many primes ℓ there are a place λ | ℓ of E, an embedding of its residue field k_λ in 𝔽̄_ℓ and a Katz cuspidal eigenform h_ℓ of type (N, 1, ε mod λ) over 𝔽̄_ℓ with T_r h_ℓ = (t_r mod λ)·h_ℓ for every prime r ∤ Nℓ. Then there is a normalised newform f of weight one, of level dividing N′, whose character agrees with ε on the integers prime to N′, such that a_r(f) = t_r for every prime r ∤ N′. In particular, if ρ : G_ℚ → GL₂(ℂ) is continuous, semisimple and unramified outside N with tr ρ(Frob_r) = t_r and det ρ(Frob_r) = ε(r) for r ∤ N, then ρ ≅ ρ_f, the Deligne–Serre representation of f.

**Hypotheses and conventions.**
- Infinitely many ℓ are needed, and finitely many may be discarded at each step (ℓ | N′, ℓ = 2, ℓ ∈ B(N′)).
- h_ℓ is only an eigenvector of T_r for r ∤ Nℓ and of the diamond operators. Nothing is assumed about T_ℓ or about the operators at primes dividing N.
- The family (t_r) is fixed in characteristic zero; this is what turns congruences modulo infinitely many primes into equalities.
- The conclusion gives a level dividing N′, not the exact level. That the level of f is the Artin conductor of ρ_f is Deligne–Serre's Théorème 4.6, which is not used.
- KW I attribute the argument to Khare's note [21] (Internat. Math. Res. Notices 1997, with a corrigendum in 1999), which was not read; the proof below is complete from the listed prerequisites.

**Proof outline.**
- Level. A Katz form of level N pulls back to level N′ along X₁(N′) → X₁(N), remaining an eigenvector of T_r for r ∤ N′ℓ with the same eigenvalues and with character ε viewed modulo N′. Discard the ℓ dividing 2N′ and those in B(N′).
- Lifting. Let M = S₁(N′; ℤ[1/N′]), a finite free module with the commuting operators T_r (r ∤ N′) and ⟨d⟩ (AlgebraicModularFormsAndSerreWeights R15.2/finite-generation-of-geometric-sections). For the remaining ℓ, h_ℓ lies in M ⊗ 𝔽̄_ℓ (R27.6/weight-one-reduction-is-onto-for-almost-all-primes). Take for 𝒪 the ring of integers of a finite unramified extension of the completion E_λ whose residue field contains a field of definition of h_ℓ, and apply the Deligne–Serre lifting lemma (R15.5/deligne-serre-eigenvalue-lifting-lemma) to M ⊗ 𝒪 and the family {T_r : r ∤ N′ℓ} ∪ {⟨d⟩}: there are a discrete valuation ring V dominating 𝒪 and an eigenvector in M ⊗ V whose eigenvalues b_r ∈ V satisfy b_r ≡ t_r modulo the maximal ideal of V, and whose diamond character reduces to ε mod λ.
- Finitely many systems. The eigenvalue systems of {T_r : r ∤ N′} ∪ {⟨d⟩} on M ⊗ ℚ̄ form a finite set, stable under Gal(ℚ̄/ℚ) because M is defined over ℤ[1/N′]; their values are integral over ℤ[1/N′]. Let E′ ⊃ E be a finite Galois extension of ℚ containing all these values. Every eigenvalue system of the smaller family {T_r : r ∤ N′ℓ} ∪ {⟨d⟩} is the restriction of one of them. Fix an embedding τ of E′ in an algebraic closure of Frac V extending E ⊂ Frac V, and a valuation ring W of that algebraic closure dominating V, with maximal ideal 𝔪_W. Then (b_r)_{r ∤ N′ℓ} = (τΘ(T_r))_r for one of the systems Θ, and λ′ = τ⁻¹(𝔪_W) ∩ 𝒪_{E′} is a prime of E′ above λ with Θ(T_r) ≡ t_r mod λ′ for r ∤ N′ℓ and Θ(⟨d⟩) ≡ ε(d) mod λ′.
- Pigeonhole. There are infinitely many ℓ and finitely many systems, so one system Θ occurs for infinitely many ℓ. For a fixed prime r ∤ N′, the element Θ(T_r) − t_r of 𝒪_{E′}[1/N′] lies in primes above infinitely many rational primes, hence is zero; likewise Θ(⟨d⟩) = ε(d).
- Newform. Θ is the eigensystem of a nonzero f₀ ∈ S₁(Γ₁(N′), ε; ℂ) (R15.1/all-weight-analytic-comparison). By the theory of newforms (Tau Ceti ModularForms, Layer 4) there is a unique normalised newform f of level dividing N′, with character agreeing with ε on the integers prime to N′, such that a_r(f) = Θ(T_r) = t_r for r ∤ N′.
- Galois representations. ρ_f (AutomorphicGaloisRepresentations R19.1/weight-one-artin-representation) and ρ are semisimple, of finite image, with the same trace and determinant at Frob_r for all r ∤ N′; every element of a finite Galois group is such a Frobenius (Chebotarev), so their characters agree and ρ ≅ ρ_f (ArithmeticGaloisRepresentations R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent).

**Checks.**
- The pigeonhole step uses primes above infinitely many different ℓ: a nonzero element of 𝒪_{E′}[1/N′] has only finitely many prime divisors.
- The theorem does not need ρ. It produces f from the family (t_r), so it also serves KW I Theorem 10.1(ii) for a general irregular compatible system (ModularityAndLanglandsExtensions ML.1), where finiteness of the image is a consequence; there the Katz forms h_ℓ come from the weight-one step without the hypothesis on Frobenius.
- With weight k ≥ 2 in place of 1 the same argument, without the lifting step, is the proof of Theorem 10.1(i) (R27.6/scope-of-the-final-statement-and-the-compatible-system-export).
- If the hypothesis holds for finitely many ℓ only, there is no conclusion: a Katz eigenform of weight one modulo ℓ need not lift.

**Imports.** `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections`, `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** kw-serre-modularity-I, Proof of Theorem 10.1, p. 20 of the preprint.

### Weight-one modularity of odd two-dimensional Artin representations
`ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity` (theorem; planet "Odd Artin representations and weight-one modularity").

KW I Corollary 10.2(ii): a continuous, odd, irreducible representation ρ : G_ℚ → GL₂(ℂ), for the usual topology and so of finite image (the Artin setting), arises from a newform of weight one. Precisely: if N is the Artin conductor of ρ and N′ = N for N ≥ 5, N′ = 5N otherwise, there is a normalised cuspidal newform f of weight one, of level dividing N′ and with character det ρ (on the integers prime to N′), such that ρ is isomorphic to the Deligne–Serre representation ρ_f. ModularityAndLanglandsExtensions ML.1 registers this export over ℚ beside Langlands–Tunnell; the statement for a general irregular compatible system (KW I Theorem 10.1(ii)) is ML.1's, and it imports the weight-one step and the descent from this layer.

**Hypotheses and conventions.**
- Oddness is det ρ(c) = −1, and irreducibility is over ℂ.
- The proof uses Serre's conjecture in infinitely many residue characteristics: the strong form of this layer at every prime ℓ of the positive-density set P_c.
- Only primes ℓ ∈ P_c are used, at which ρ̄_λ(Frob_ℓ) has distinct eigenvalues; so the weight-one step is the non-exceptional case of Edixhoven's theorem and does not rest on the removal of the exceptional case.
- Nothing is imported from ModularityAndLanglandsExtensions: the dependency runs from this node to ML.1.

**Proof outline.**
- Reductions (R27.6/artin-reductions-of-serre-type): fix a number-field model over E; for ℓ ∈ P_c and λ | ℓ, ρ̄_λ is absolutely irreducible, odd, unramified at ℓ, of conductor N and character det ρ mod λ, with tr ρ̄_λ(Frob_r) = tr ρ(Frob_r) mod λ, and ρ̄_λ(Frob_ℓ) has the eigenvalues 1 and −1.
- Weight one modulo ℓ (R27.6/unramified-residual-representations-arise-in-weight-one, which applies the strong form R27.6/full-classical-serre-theorem and Edixhoven's theorem): there is a Katz cuspidal eigenform h_ℓ of type (N, 1, det ρ mod λ) over 𝔽̄_ℓ with T_r h_ℓ = (tr ρ(Frob_r) mod λ)·h_ℓ for r ∤ Nℓ.
- Descent (R27.6/weight-one-descent-from-infinitely-many-primes) with t_r = tr ρ(Frob_r) ∈ 𝒪_E and ε = det ρ, P_c being infinite: a newform f of weight one with a_r(f) = tr ρ(Frob_r) for r ∤ N′, and ρ ≅ ρ_f.

**Checks.**
- Even Artin representations do not meet the oddness hypothesis.
- Reducible sums of characters do not meet the irreducibility hypothesis; the corresponding forms are Eisenstein series.
- For the S₃ representation of conductor 23 the theorem returns the weight-one form η(z)η(23z) of level 23, known classically (Hecke); the new cases are those of projective image A₅.
- The weight-one conclusion needs the descent node, not only the existence of a form of weight ℓ congruent to ρ modulo λ for each ℓ.

**Imports.** `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`, `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`, `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`.

**Sources.** kw-serre-modularity-I, Corollary 10.2(ii) and discussion after Theorem 10.1, author PDF p. 21; kw-serre-modularity-I, §10.2, p. 21 of the preprint.
**What ML.1 imports.** For KW I Theorem 10.1(ii), ML.1 takes the family t_r of Frobenius traces of an irregular
compatible system, proves that almost all ρ̄_λ are irreducible and unramified at the residue characteristic
(Sen–Fontaine), and then applies `unramified-residual-representations-arise-in-weight-one` and
`weight-one-descent-from-infinitely-many-primes`. The finite image of the system is a consequence. For a general
system the Frobenius eigenvalues at ℓ cannot be chosen distinct before the image is known to be finite, so ML.1 needs
the weight-one step in its form without that hypothesis. That form rests on Coleman–Voloch through
SerreWeightAndLevelOptimisation R20.3; no node of this packet uses it.

**Requests added.** R15.2 (finite generation of H¹), R20.3 (the exact case of Edixhoven's theorem), Tau Ceti ModularForms
Layer 4 (newforms in weight one), and the Chebotarev request extended to the Galois group of an Artin representation.
The finite-group facts about reductions are proved in `artin-reductions-of-serre-type` itself, from Maschke's theorem
and the exactness of invariants, with R01.1 and R01.3 cited for the lattice and the conductor formula.

## Early good-dihedral boundary and the Paso 2 application

Lemma 8.2 now uses R01.3’s continuous, absolutely irreducible, odd residual representation and R01.4’s prime-field finite-subgroup classification. It does not use Serre weights, R15.6, or R27.1/dickson-and-the-dyadic-solvable-refinement. Keep the prime-field hypothesis 𝔽_p and p ≡ 1 modulo 4: coefficients merely in 𝔽̄_p do not give the source’s corrected rationality condition. The Chebotarev argument keeps the abelian intersection and complex-conjugation class explicit.

**Sub-layers of R27.1 (round 3).** The packet's restructure entry proposes two sub-layers, with the names part R26.1 uses.
- R27.1a, "Good-dihedral primes: definition, image and the Chebotarev choice": Definition 2.1 and Lemma 6.3 (part R26.1)
  and Lemma 8.2 (this part). It requires R01.3, R01.4, R01.5, R15.4, PotentialModularityAndCompatibleSystems R24.6 (for
  Lemma 6.3(ii)) and Tau Ceti Chebotarev Layer 10.
- R27.1b, "Inserting a good-dihedral prime; the KW I §6 image and weight lemmas": `good-dihedral-prime-insertion` (this
  part) and the mixed KW I §6 node of part R26.1. It requires R27.1a, R24.3, R24.6, R17.5, R17.6, R20.5 and R15.4.

No declaration of R27.1 uses R26, and in the other direction R26.6's Corollary 8.1(ii) node cites Definition 2.1. The
stage edits are the maintainer's: delete R26.6 from the requires of R27.1; keep RS-06's link R26.6 → R27.3 for (W₁);
re-point RS-06's links R27.1 → R33.2, R33.3, R33.6 to R27.1a. A packet cannot make them, because promotion only adds
links. On the current atlas with the accepted restructuring links and link maps, R33.2–R33.5 have R26.1–R26.6 among
their ancestors; after deleting the single edge R26.6 → R27.1 they have none, and R33.6 keeps them through R27.4 and
R27.6, as the finding allows. Part R33.5 has two nodes (R33.5/dp-characteristic-two-closure and
R33.6/strong-form-by-the-modern-route) that still cite the mixed KW I §6 node; the restructure entry says how they are
to be treated.

At declaration level the property already holds. No node of R33.1–R33.4 has, among its prerequisites followed
through every packet, a node of R26, of R27.1b or of R27.2–R27.6. To obtain this the two R33.1 nodes that cited the
mixed KW I §6 node now cite its component owners: Dickson's classification from
R01.4/dickson-classification-and-the-dyadic-refinement, and Lemma 1.14 (KW I Lemma 6.2(ii)) from
R15.4/bad-dihedral-normalized-weight-application with R01.4/bad-dihedral-representations-and-the-oddness-criterion.
The level-one input R26.6 → R27.3 for (W₁) is retained.

**KW I Theorem 4.1 (round 3).** `theorem-3-1-killing-ramification`, `theorem-3-4-raising-levels-and-the-chebotarev-choice`,
`strong-form-by-minimal-lifts` and `d1-by-the-prime-three` cite GL2ModularityLifting
R22.5/kw-i-theorem-4-1-odd-prime and R22.6/kw-i-theorem-4-1-dyadic. KW II §10.2 derives the theorem from Theorem 9.7 and
the weight part of Serre's conjecture, without potential modularity or finiteness of deformation rings, so its
consumers need not wait for PotentialModularityAndCompatibleSystems R23 and R24.1–R24.3. The request to R24.4 is
withdrawn.

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
