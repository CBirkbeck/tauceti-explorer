# Modularity, automorphy and Langlands endpoint extensions — blueprint

This roadmap owns the endpoint theorems beyond the lifting infrastructure: potential automorphy, symmetric powers and Sato–Tate, weight-one modularity,
classical-group classification inputs and the register of known transfers. This first checkpoint plans **ML.2 (potential automorphy assembly)** from
Barnet-Lamb–Gee–Geraghty–Taylor, *Potential automorphy and change of weight* (BLGGT; arXiv:1010.2561v4, Ann. of Math. 179 (2014)), and gives **ML.0** its
normalisation and version registers.

| Stage | Coverage |
|---|---|
| ML.0 | `partial`: BLGGT normalisation register, v1 → v4 version register |
| ML.1 | `not_read` |
| ML.2 | `partial`: BLGGT §§1.4, 2.1–2.4, 3, 4, 5.4–5.5 (30 nodes) |
| ML.3 | `not_read` |
| ML.4 | `not_read` |
| ML.5 | `not_read` |

**Built on.**
- PotentialModularityAndCompatibleSystems R24.5:operations supplies:
  - compatible systems, their predicates and L-functions;
  - the Grothendieck ring;
  - residual irreducibility for density-one l;
  - the constituents lemma.
- LocalGaloisDeformationRings R08.3 supplies Kisin's potentially semistable lifting rings.
- GlobalGaloisDeformations G7 supplies the polarized (CHT) deformation problems.
- FiniteFlatGroups R07.3 supplies Fontaine–Laffaille theory.
- PM R23.1 supplies Moret-Bailly.

**Requested.**
- AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.2: polarized automorphic representations and r_{l,ı}(π), BLGGT Theorem 2.1.1.
- EndoscopicTransfer ET.7a: Arthur–Clozel base change and automorphic induction.
- AutomorphicLFunctionsAndLocalFactors AL.2 and AL.3: Godement–Jacquet and Rankin–Selberg.

## Conventions (ML.0)

**`blggt-normalization-register`** (comparison).
- A *polarized* automorphic representation (π, χ) has χ_v(−1) independent of v | ∞ and π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det). For F imaginary, also χ_v(−1) = (−1)^n.
- (r, µ) is *automorphic* if (r, µ) ≅ (r_{l,ı}(π), r_{l,ı}(χ)ε_l^{1−n}).
- HT_τ(r_{l,ı}(π)) = {a_{ıτ,i} + n − i}, and ıWD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}).
- HT(ε_l) = {−1}, and Art sends uniformisers to geometric Frobenius.

**`blggt-version-register`** (comparison). v4 renames RAECSDC/RAESDC to "polarized" and renumbers:
- v1 §2.2/§2.3 → v4 §2.3/§2.4;
- v1 §5.2 → v4 §5.3;
- v1 Theorem 5.3.1 → v4 Theorem 5.4.1;
- v1 Theorems 5.4.1–5.4.3 → v4 §5.5.

v4 adds §2.2 (lemmas on automorphy) and §5.2 (rational compatible systems). PM R24.3 cites v1; this roadmap cites v4.

## Layer ML.2: potential automorphy assembly (`TauCeti/NumberTheory/PotentialAutomorphy/…`)

**Definitions.**
- **`polarized-galois-representation`**. (r, µ) with a pairing ⟨r(σ)x, r(c_vσc_v)y⟩_v = µ(σ)⟨x, y⟩_v; totally odd, algebraic and regular algebraic variants. It is equivalent to a G_n-valued extension (F imaginary) or to GSp_n/GO_n (F totally real).
  - *API:* `IsPolarized`, `IsTotallyOdd`, `toGn`, `gsp_or_go`, `IsRegularAlgebraic`, `restrict`.
  - *Tests:* powers of ε_l; H¹ of an elliptic curve; rank 0; the non-polarizable 1 ⊕ ε_l^{−1} ⊕ ε_l^{−5}.
- **`adequate-subgroup`**. H¹(H, F̄_l) = H¹(H, sl_n) = H⁰(H, sl_n) = 0, and the prime-to-l elements span M_n. It implies irreducibility and l ∤ n.
  - *API:* `IsAdequate`, `irreducible`, `not_dvd`, `of_irreducible`.
  - *Tests:* the trivial group; SL₂(F_l); scalars in sl_n when l | n; a reducible non-example.
- **`ghtt-adequacy-criterion`** (theorem). Irreducible and l ≥ 2(d + 1) implies adequate (GHTT Theorem 9; cited).
- **`iota-ordinary`**. The rescaled U^{(j)}_{ı*a,ϖ_v} on Iwahori invariants have an ordinary part. The notion is independent of ϖ_v and stable under twists. Weight 0 with Steinberg at l implies ı-ordinary.
  - *Tests:* ordinary and supersingular newforms; the Dwork forms; independence of the uniformiser.
- **`connects-relation`**. ρ₁ ∼ ρ₂: same reduction and Hodge–Tate numbers, on the same component of Spec R^□_{K′-cris} ⊗ Q̄_l. Remarks (1)–(7) are the API.
  - *Tests:* reflexivity; unramified twists; different types; different Hodge–Tate numbers.
- **`potentially-diagonalizable`**. Crystalline and ∼ a sum of characters after a finite extension. Lemma 1.4.1 makes it conjugation-invariant.
  - *Tests:* sums of characters; ordinary; rank one; a semistable non-crystalline non-example.
- **`potential-diagonalizability-criteria`** (Lemma 1.4.3). Ordinary representations, and Fontaine–Laffaille representations (weights in [a, a + l − 2], K/Q_l unramified), are potentially diagonalizable.
- **`automorphic-galois-representation`**. Automorphic; of level prime, or potentially prime, to l; ordinarily automorphic; potentially diagonalizably automorphic. Independent of ı.
  - *API:* `IsAutomorphic` with `levelPrime`, `ordinarily`, `pdAutomorphic`, `isAutomorphic_indep_iota`, `twist`.

**Lemmas on automorphy.**
- `automorphy-twist-and-soluble-base-change` (Lemmas 2.2.1–2.2.2).
- `automorphy-descends-from-induction` (Lemmas 2.2.3–2.2.4).

**Lifting theorems.**
- `minimal-automorphy-lifting` (Theorem 2.3.1, Thorne 7.1) and `ordinary-automorphy-lifting` (Theorem 2.4.1, Thorne 9.1). Both are cited; see the gap.
- `preliminary-pd-automorphy-lifting` (Proposition 4.1.1). R = r ⊗ Ind θ and R′ = r_{l,ı}(π) ⊗ Ind θ′ for a cyclic CM M/F. At l both connect to (⊕ψ_i) ⊗ (⊕φ_j), which is regular by the n² condition.
- **`pd-automorphy-lifting`** (Theorem 4.2.1, planet). Potentially diagonalizable at l, r̄|_{G_{F(ζ_l)}} irreducible, l ≥ 2(d + 1), ζ_l ∉ F, and r̄ ordinarily or potentially diagonalizably automorphic ⇒ (r, µ) is potentially diagonalizably automorphic. The proof builds two ordinary intermediate lifts r₁ and r₂.

**Potential ordinary automorphy.**
- `moret-bailly-galois-control` (Proposition 3.1.1).
- `dwork-potential-ordinary-automorphy` (Theorem 3.1.2; the BLGHT11 Dwork family is cited).
- `ordinary-lifts-with-local-conditions` (Proposition 3.2.1). Symplectic induction I_ψ(r̄), then Khare–Wintenberger.
- `potential-ordinary-automorphy` (Proposition 3.3.1).

**Main theorems.**
- `pd-lifts-with-local-conditions` (Theorem 4.3.1).
- **`change-of-weight-and-level`** (Theorem 4.4.1, planet).
- **`potential-automorphy-theorem`** (Theorem 4.5.1, planet "Potential automorphy theorem (BLGGT)").
- `potential-automorphy-totally-real` (Corollary 4.5.2).
- `potential-automorphy-mod-l` (Corollary 4.5.3).

**Compatible systems.**
- **`compatible-systems-potentially-automorphic`** (Theorem 5.4.1 and Corollary 5.4.2, planet).
- **`compatible-system-l-function-continuation`** (Corollary 5.4.3, planet). Meromorphic continuation, Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s), and strict purity. This is the functional equation that PM R24.5/system-l-functions could not claim.
- `multiple-product-l-functions` (Corollary 5.4.4). Includes the Goursat argument.
- `constituents-potentially-automorphic` (Proposition 5.4.6).
- **`part-of-compatible-system`** (Theorem 5.5.1, planet). Built by Brauer induction in the Grothendieck ring.
- `irreducibility-density-one` (Theorem 5.5.2). Uses the Rankin–Selberg pole at s = 1.
- `decomposition-into-irreducible-systems` (Theorem 5.5.3).

## Mistakes found in the source (BLGGT arXiv v4)

- **E1 (p. 32).** The polarized-automorphic parity condition is written with µ ("µ_v(−1) = (−1)^n … replacing µ by µδ_{F/F⁺}") where the pair's character is χ.
- **E2 (§4.5, pp. 59–61).** Index and reference slips:
  - "primes of F⁺" should be primes of F in Theorem 4.5.1(1);
  - "Lemma 1.4.2" should be Lemma 1.4.3(2);
  - "above l" should be "above l_i";
  - in Corollary 4.5.3(g) and (7), "ρ_{v,i}", "n" and "ρ_v" should be ρ_{i,v}, n_i and ρ_{i,v}.
- **E3 (Theorem 4.4.1, p. 59).** ρ_v is a "lift of r̄_{l,ı}(π)|_{G_{F_ṽ}}", but no π is given yet in v4. It should be a lift of r̄|_{G_{F_ṽ}}.

All three are misprints that change no stated result. The Annals version could not be collated.

## Remaining work

- **ML.0:** registers for Newton–Thorne, Arthur/Mok/KMSW.
- **ML.1:** Deligne–Serre and weight one.
- **ML.2:**
  - the ACC+ route through PotentialAutomorphyInfrastructure;
  - BLGGT Appendix A;
  - v4 §5.2 (rational compatible systems), which belongs to PM R24.5;
  - the cited Thorne, GHTT and BLGHT11 proofs.
- **ML.3–ML.5:** not read.
- The unreviewed EXT-12 draft is a lead for ML.1, ML.3 and ML.4.

## Sources

- T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of weight*, arXiv:1010.2561v4 (9 December 2013), sha256 c953df6…; Ann. of Math. (2) 179 (2014), 501–609. arXiv v1 (sha 697e2d3…) was compared for the version register.
