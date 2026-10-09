# Red team RT-BP-LocalGaloisDeformationRings~2

Target: the accepted round-2 blueprint of **Local Galois deformation rings and their components**
(`BP-LocalGaloisDeformationRings~2`, reviewed by `REV-LocalGaloisDeformationRings~2`). That covers the packet
`research/blueprint/packets/LocalGaloisDeformationRings.json` (157 nodes), the reader document, the suggested Lean file
and the round-2 handoff.

Red team: Claude Code, session `cc-a49874`, 9 October 2026. This session did not write or review any round of the
blueprint. Repository state: commit `1a52067c`. Libraries: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Result

Seven findings: two high, four medium, one low. Five concern the suggested Lean file or the closure of individual
nodes. One is a false statement in the packet itself, and one is a duplication with another roadmap. The rest of the plan
held up against its sources: Kisin's potentially semistable and finite-flat theorems, the ACC+ §6.2.6 comparison in L8,
Thorne's flag ring, Gee's Fontaine–Laffaille and Taylor–Wiles rings, and the local inputs of Caraiani–Newton other than
their Lemma 5.3.4. Every baseline declaration checked out. The suggested file compiles.

| # | Severity | Kind | Where | In one line |
|---|---|---|---|---|
| 1 | medium | missing | R08.4/bt-ring-unique-generalisation, R08.5/rank-two-connected-components | Gee 2006 Prop. 2.3 is used twice but planned nowhere; Caraiani–Newton's Lemma 5.3.4 rests on it |
| 2 | high | error | R08.2/ihara-avoidance-components; Lean `iharaAvoidance_distinct_isPrime` | the characters must be characters of G_{F_v} (finite order), not of I_K; otherwise part (1) is false |
| 3 | medium | error | Lean `FullFlag`/`IsDetOrdinary.of_flag`, `IsMinimallyRamified`/`minimal_baseChange` | `finrank` over non-local rings: two API statements are false |
| 4 | high | error | Lean carrier `LiftingRing` and the R08.1 theorems | 𝔽 is not tied to the residue field of 𝒪; two of the file's statements contradict each other |
| 5 | medium | duplicate | R08.2/rigid-residual-conditions | the global rigidity predicate is planned by PotentialAutomorphyInfrastructurePartII PL.9 too, and the two copies already differ |
| 6 | medium | error | Lean `SteinbergLifts`, `IsInPol`, `steinbergRing_isPrime` | Taylor's Pol_n is a reduced scheme-theoretic image, not "there exists α"; the theorem is vacuous for n = p |
| 7 | low | other | suggested file | 29 "unit tests" and four "theorems" are arithmetic on numbers that no definition can fail |

## The findings

### 1. Gee's connectedness theorem is used but not planned (medium)

Caraiani–Newton's Lemma 5.3.4 is an input to the main patching argument in their proof of Proposition 5.6.1 (p. 85).
It says that for p odd, trivial ρ̄, residue field k_v ≠ F_p and R ≠ 0, the fixed-determinant Barsotti–Tate ring has
exactly two irreducible components. Their proof cites Kisin's Corollary 2.5.16 together with Gee's 2006 Proposition 2.3.

The packet states the lemma in R08.4/bt-ring-unique-generalisation and repeats the two citations, but its prerequisites
cannot carry the argument. The condition k_v ≠ F_p means K_0 ≠ Q_p. In that case Kisin's corollary says nothing about
non-ordinary points beyond a necessary condition, as the packet's own rank-two-bt-components records. The same input
reappears in R08.5/rank-two-connected-components: Kisin's 2-adic Theorem 2.3.11(2) is proved there "by Gee's argument",
and Kisin's paper says the same ("those of [Ge] apply to prove (2)").

Yet R08.4/rank-two-nonordinary-connected explicitly declines Gee's result ("not a source of this node"), and Gee 2006
appears in neither the sources, the requests nor the gaps.

**Fix.** Add Gee 2006 as a source and add an R08.4 node for his Proposition 2.3. Its hypotheses are trivial V_F,
k ⊂ F, k ≠ F_p and K_0 arbitrary; the proof uses chains of rational curves (Lemma 2.4, with the erratum). Make the new
node a prerequisite of both consumers, and correct the sentences that say only K_0 = Q_p is available.

### 2. Ihara-avoidance characters (high)

R08.2/ihara-avoidance-components fixes "characters χ_i : I_K → 1 + λ trivial mod λ". Taylor (Publ. IHÉS 108, p. 196)
takes continuous characters of G_{F_v}, "Thus χ|_{I}^{#k(v)−1} = 1"; ACC+ §6.2.15 and Thorne §3.3.3 take characters of
O_{F_v}^×, "necessarily of finite order".

With characters of inertia only, part (1) fails. The tame relation forces the eigenvalues of ρ(t) to be stable under
x ↦ x^q, so there may be no characteristic-zero points at all. Take n = 1, O = Z_p, χ(t) = 1 + p and p^m ∥ q − 1.
Then R^□/I^{(χ)} = Z_p[[x]]/((1+p)^{q−1} − 1) = (Z/p^{1+m})[[x]]. This ring has dimension 1 rather than n² + 1, and its
generic point has characteristic p.

The suggested theorem `iharaAvoidance_distinct_isPrime` takes arbitrary ζ_i ≡ 1 mod ϖ, so it is false for the same
example: the flat closure is the unit ideal, which is not prime.

**Fix.** State the hypothesis as the sources do, and add ζ_i^{q−1} = 1 to the Lean statement.

### 3. Ranks over non-local rings in the suggested file (medium)

`FullFlag` asks that Fil i be a direct summand with `Module.finrank` equal to i. `IsMinimallyRamified` asks that the
kernels be free of the residual `finrank`. Both are stated over arbitrary commutative rings. Two API lemmas built on
them are false:

- **`IsDetOrdinary.of_flag`.** Over Q × Q, the summand A·e₁ ⊕ (Q × 0)·e₂ has finrank 1, since any two of its elements
  are dependent. With ρ = 1 and graded characters 1 and (2, 1) on this flag, the flag is ordinary. The characteristic
  polynomial (X − 1)² is not (X − 1)(X − (2,1)), so the lift is not determinant-ordinary.
- **`minimal_baseChange`.** Take σ = (1 t; 0 1) over F[t], which is minimally ramified, and the map F[t] → F × F with
  t ↦ (1, 0). The base change has kernel B × (0 × F), which is not free.

The packet states both facts over domains or over coefficient rings in C_O, where they are true.

**Fix.** Add locality hypotheses or freeness of the flag pieces.

### 4. The carrier `LiftingRing` (high)

The carrier takes any field 𝔽 with any 𝒪-algebra structure. Take p odd, 𝒪 = Z_p, 𝔽 = Q_p (Mathlib's `Algebra ℤ_[p] ℚ_[p]`),
K = Q_p and the trivial character. Two of the file's statements then contradict each other:

- `rankOne_isPowerSeries` gives R ≅ Z_p[[y₁, y₂]].
- `liftingRing_represents`, applied to the dual numbers Q_p[ε] with the discrete topology, requires the maps
  R → Q_p[ε] lifting the residue map to be in bijection with the lifts. Every continuous lift has finite image in the
  torsion-free group 1 + εQ_p, so there is only one lift. But Z_p[[y₁, y₂]] has at least two such maps (one twisted by
  ∂/∂y₁).

The packet node has the right hypothesis (𝔽 is the residue field of 𝒪); the file does not carry it. The same omission
in the supplier's file was confirmed in RT-BP-GlobalGaloisDeformations/1.

**Fix.** Put the carrier on the coefficient category of DeformationAndDerivedPatchingAlgebra R03.1, with 𝔽 the finite
residue field.

### 5. Rigidity is planned twice (medium)

R08.2/rigid-residual-conditions defines when a global r̄ : Γ_{F⁺} → 𝒢_N(k) is rigid for (Σ_min, Σ_lr) in the sense of
LTXZZ Definition 3.6.1, including unramifiedness at every other place. That is the object of PotentialAutomorphyInfrastructurePartII
stage PL.9 and of its node PL.9/rigid-residual-representation.

The packet's node admits as much ("the global object r̄ ... belong[s] to the polarized automorphy lifting Part II"), but
its API `IsRigidFor` is the global predicate. The copies have drifted: the R08.2 version drops LTXZZ's condition
Σ⁺_min ⊇ Σ⁺_bad and fixes μ. No other packet cites the R08.2 node.

**Fix.** Remove the node from R08.2, which is a local layer, and keep only the local conditions that PL.9 imports.

### 6. Taylor's Pol_n in the suggested file (medium)

Taylor defines Pol_n(σ, q) as "the reduced subscheme of the scheme theoretic image" of a linear space. The file instead
writes "∃ α, charpoly = ∏ (X − q^i α)". That condition is not closed, so the ideal assumed in `steinbergRing_isPrime`
cannot exist when n = p (with q ≡ 1 mod p).

The witness is B = F[t, w]/(t, w)^{p+2}, with Φ = 1 + tP_{1+w} and σ = 1. The characteristic polynomial is
X^p − 1 − t^p(1 + w), which has no α in B but acquires one in B′ = F[t, v]/((t, v^p)^{p+2}), into which B injects. So
the theorem is vacuous in part of the very range (p ≤ n) for which the packet invokes Thorne.

**Fix.** Encode Pol_n by its ideal.

### 7. Arithmetic standing in for tests (low)

Of the 104 examples before the inventory, 46 mention no declaration of the file, and 29 of these are identities between
specific numbers. Examples are `Nat.choose 3 2 = 3` for `siegelOrdinary_u_dim`, `(2 : ZMod 5)^4 = 1` for `gsp4Type_H`
and `17 − 1 = 2^4` for `twBlock_p2_delta`. Four "theorems" are ring or omega identities. Finally, `rhoNM0Weights` is a
list function unrelated to `rhoNM0`. The handoff counts these as elaborated tests.

## What was checked

The full list is in the result file's `checked` field; in summary:

- **Packet.** Every node's statement, hypotheses, sources and prerequisites. Proof steps, acceptance and tests in depth
  for about 45 nodes, covering R08.1, the R08.2 Ihara/Steinberg/Taylor–Wiles/level-raising/rigidity nodes, R08.3, R08.4,
  the R08.6 exports, the L7 ordinary/flag/Fontaine–Laffaille/Snowden/Calegari–Geraghty nodes and all of L8. Also all
  162 unit tests of definitions, the gaps, requests, source issues E1–E10, and the reader sections behind the findings.
- **History.** The earlier red-team findings that touch this roadmap (RT-AREA-langlands-2/14, /16, /17, /18, /22 and
  three paper red teams), and how the round-2 handoff treated them, so that nothing is resubmitted.
- **Sources read at the cited statements.** For each source, the version read and its SHA-256 are recorded in
  `sourceVersions`.
  - Kisin's pst paper (author DVI).
  - Kisin's Annals finite-flat paper and his 2-adic paper (author DVIs).
  - Caraiani–Newton v3.
  - ACC+ v2.
  - Thorne 2015.
  - Taylor II.
  - Gee's notes.
  - Böckle–Iyengar–Paškūnas.
  - Bellovin–Gee.
  - LTXZZ (rigid).
  - Gee 2006.
- **Calculations redone by hand.** I recomputed source issue E9, LTXZZ's odd-μ relation, and found it correct. I also
  rederived the sign dictionary of L7/ordinary-of-weight-lambda from Caraiani–Newton's Definition 3.3.1, and re-checked
  many dimension counts and explicit presentations.
- **Library claims.** All nine baseline declarations were read at the pinned commits. Binary-safe absence searches,
  with a positive control, found no deformation theory, Kisin modules or local Tate duality in either library.
- **Cross-roadmap links.** All 52 cross-packet prerequisite ids resolve. A duplication screen over all packets found one
  duplicate (finding 5); the other hits are global consumers.
- **Lean.** The suggested file compiles in the shared Tau Ceti build at the pinned commits:

  ```
  lake env lean research/blueprint/suggested/LocalGaloisDeformationRings.lean
  ```

  This was run under the workers' compile lock with a 1200 s timeout. It exits 0 with 129 warnings, all of them
  "declaration uses sorry". I read the whole elaborated part (lines 1–1945).
