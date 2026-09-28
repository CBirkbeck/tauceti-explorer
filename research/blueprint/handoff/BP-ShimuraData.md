# BP-ShimuraData — first checkpoint: the Deligne torus and Hodge structures (D1)

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #992. The claim is comment 5874140640, confirmed by the bot. No packet existed before this checkpoint.

## What this checkpoint supplies

The checkpoint adds 8 D1 nodes on 30 baseline declarations:

1. The Deligne torus S, as Tau Ceti's Galois-descended torus of the swap lattice ℤ². It is a torus, split by ℂ, and not split over ℝ. It needs an `IsGalois ℝ ℂ` instance, which is supplied here.
2. Its real and complex points: S(A) = (A ⊗ ℂ)ˣ, S(ℝ) → S(ℂ) is z ↦ (z, z̄), and conjugation acts by (z₁, z₂) ↦ (z̄₂, z̄₁).
3. The norm, the weight map w(r) = r⁻¹, and the Hodge cocharacter μ (defined over ℂ only). These use a descent functoriality in the lattice, which is constructed here.
4. The Hodge decomposition of a real representation, with Deligne's sign V^{p,q} = V_{(−p, −q)}. Each weight piece becomes a Tau Ceti `HodgeStructureOn`.
5. The equivalence between real representations of S and finite sums of pure real Hodge structures, compatible with ⊗, duals and Tate twists.
6. h(i) = C⁻¹ for Tau Ceti's Weil operator C.
7. The rational-weight criterion.
8. The four test objects under one convention: the trivial representation, ℚ(m), H₁(E), and the adjoint of GL₂.

There are 3 planets, 2 requests and 1 gap. D1 is partial, and D0 and D2–D5 are not read.

## Requests and gaps

**Requests:**

- to ReductiveGroupsPartII RG2.0a, for the identification S ≅ Res_{ℂ/ℝ} G_m;
- to AdelicAlgebraicGroups AA.1, for real points as Lie groups from D2 on.

**Gap:** Galois descent of comodules, which the inverse construction of the equivalence needs.

## Validation

- `check_blueprint --index` against the pinned index gives 0 errors and 0 warnings.
- The intake file check is clean.
- **The suggested file was not compiled.** The shared machine has no pinned build. It imports Tau Ceti's descended tori, weight spaces and Hodge files.

## Resume

1. Finish D1: comodule descent; polarizations and Hodge tensors in representation form.
2. D0: consume RG2.0a and AA.0–AA.1.
3. D2: Cartan involutions and Hermitian domains (Milne §§1–2; Deligne 1979 §1.2), then D3–D5.
