# DESIGN-StableReductionPartII — coefficient-relative exactness research checkpoint

Worker: ChatGPT — gpt-20261002-atlas-b73e. Refs #3342. Date: 2026-10-02.
Claim 5959304556; bot confirmation 5959308029. The issue was reread after confirmation.

## Status and preservation

This is a **handoff-only partial research checkpoint**, not a complete blueprint submission. It supplies mathematical proofs for the actual polynomial model and fresh finite regressions. The roadmap, packet, reader and suggested Lean file are unchanged. No declaration, API, test contract, planet, baseline record or graph edge has been added to those files. No implementation or stage is certified.

The complete predecessor handoff, including its native coefficient-splitting archive and validation receipts, is preserved at the merge of PR #5831:

https://github.com/CBirkbeck/tauceti-explorer/blob/18d7d3768b68d381b78021dcd84b4fe9114a8e98/research/blueprint/handoff/DESIGN-StableReductionPartII.md

The predecessor reports 125 nodes, 142 API items, 135 definition/construction tests plus two exactness tests, 35 planets, 73 baseline declarations, 135 requests and 14 gaps. These are inherited counts, not fresh checker counts. Its canonical Lean proof archive remains at suggested-file revision 637b45159fc2451aa40ce5b5cf9a31ce755c646f. No historical compilation or axiom audit is attributed to this worker.

The new point is exactness after tensoring over the **coefficient ring A with any A-module L**, including non-flat modules. It proves natural Hom exchange, canonical bidual evaluation and both positive-degree Ext vanishings for the polynomial section ideal. It also verifies the existing cokernel maps with their prescribed signs. This supplies a direct route to the relative conditions in this model, not the two-base completion or geometric descent statements.

## Fresh readings and limits

The issue and all preceding comments, predecessor handoff and relevant MC.2 reader statements were read. The reader blob was fd6c79e266a780096fe1040c229b7f69c7f87a8d. Existing IDs and maps, including `StableReductionPartII:key/moduli-curves`, are retained.

Knudsen, *A closer look at the stacks of stable pointed curves*, arXiv:1106.1588v2, §3, printed pp.11–12, was read in the parsed primary PDF: https://arxiv.org/pdf/1106.1588 . The matrix entries, skew rotation, cokernel signs and Proposition3.1 were checked against that text. Screenshot attempts for PDF pages9,10,11 failed; visual verification is not claimed. The published assumptions are noetherian A and unit discriminant. The broader polynomial-module argument below is an explicit derivation, not a quotation of that broader statement.

Ile, *Stably reflexive modules and a lemma of Knudsen*, arXiv:1110.3909v3, Definitions3.1 and3.4, Proposition3.5 with proof, and Remark3.6, printed pp.6–8, were read in the parsed primary PDF: https://arxiv.org/pdf/1110.3909 . Screenshot attempts for PDF pages5 and6 failed. Remark3.6 records Knudsen's arbitrary-coefficient-module conditions. The general theorem is not imported with weaker hypotheses: the special case is proved here.

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, the actual statement and proof of `Polynomial.Monic.isRegular` in `Mathlib/Algebra/Polynomial/Monic.lean`, blob facebe38cd161f5df111d1885d9039377494cd53, were read. It concerns multiplication in a polynomial ring, not by itself the arbitrary-module assertion C1. It was already in the inherited baseline and is not a new planned definition.

The parent StableReduction document's scope and conventions were checked; its scheme-level curve theory is an input, not a moduli-stack properness theorem. A complete new audit of both pins, all suppliers and two entire nearby upstream documents was not performed. The earlier failed read of the oversized library-coverage file is not credited as an audit. No claim that these generic lemmas are absent from the pins follows. The existing Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369 is unchanged.

Bibliographic discrepancy for integration: the publisher gives DOI 10.1016/j.jpaa.2012.03.021 for Knudsen's article, whereas the arXiv metadata ends `.03.21`. This is metadata, not an alleged mathematical error. No PDF file hash was computed. All fresh source-reading dates are 2026-10-02; earlier source inventories and audit receipts are historical.

## Conventions

Keep the actual inherited model, over any commutative ring A:

B=A[Y][X], q(X,Y)=X²+γXY+δY², F=q(X,Y)−q(s,t), R=B/(F).

Write u=[X], v=[Y], coefficient map ι:A→R, c=u−ι(s), d=v−ι(t), b=u+ι(s)+ι(γt), a=ι(δ)v+ι(δt)+ι(γ)u. Then J=(c,d), D=Hom_R(J,R), Φ=((a,b),(-c,d)), Ψ=((d,-b),(c,a)). The lifted matrices multiply in either order to FI₂, and cb+da=0 in R. Matrices act on columns. Let H=((0,-1),(1,0)); then Ψᵀ(-H)=(-H)Φ.

In C1–C6, P,Q denote either ordered pair of lifted matrices or their transpose pair, and p,q their images over R. There q denotes the matrix map, not the quadratic form. Set E=R², M=coker p, R_L=R⊗_A L and E_L=R_L². Dual coordinates represent R-linear functionals by transposed columns. Finite freeness identifies E*⊗_A L with E_L; this is **not** a claim about the dual Hom_R(E_L,R). Zero rings and zero coefficient modules are included.

## C1. Monicity on arbitrary coefficient modules

**Statement.** Multiplication by F is injective on T_L=B⊗_A L for every A-module L. Canonically T_L/FT_L=R_L.

**Proof.** Identify T_L with finite-support polynomials in X with coefficients in L[Y]. If a nonzero element has largest nonzero X-coefficient in degree n, multiplication by the monic quadratic F preserves that coefficient in degree n+2. Its product is nonzero. The zero module case is immediate. Right exactness applied to B --F--> B →R→0 gives the quotient identification with its natural R-module action.

No flatness of L is used. Cancellation is in T_L **before** quotienting, not in R_L where F acts as zero. This finite-support proof does not apply a highest-degree argument to formal power series.

## C2. Universal coefficient exactness

**Statement.** The alternating p,q complex on E_L, and its transpose complex, are exact for every A-module L.

**Proof.** The products vanish in the quotient. Given p_L(z)=0, lift z to z̃ in T_L² and write Pz̃=Fw. Apply Q: Fz̃=FQw. C1 cancels F coordinatewise, so z̃=Qw and z belongs to im q_L. Interchange P,Q for the other equality. Their transposes also multiply in both orders to FI₂, so the same argument proves both transpose equalities.

For L=A this is the already planned exactness argument. The added assertion quantifies over arbitrary coefficient modules, not only fields or flat changes.

## C3. The canonical cokernel description of the dual

**Statement.** There is an R-linear equivalence

θ:coker(pᵀ) → M*,    θ([λ])([z])=λᵀqz,

where M*=Hom_R(M,R).

**Proof.** Replacing z by z+pw changes the value by λᵀqpw=0; replacing λ by λ+pᵀμ changes it by μᵀpqz=0. Thus the formula descends. Pullback along E→M identifies M* with ker pᵀ in E*. The map θ is then induced by qᵀ. By C2, im qᵀ=ker pᵀ and ker qᵀ=im pᵀ, proving bijectivity. The formula proves linearity and specifies the equivalence uniquely.

The source is coker(pᵀ), not coker(qᵀ). The node's duality between coker Φ and coker Ψ uses the separate rotation in C8.

## C4. Arbitrary-module Hom exchange

**Statement.** For every A-module L the natural R-linear map

M*⊗_A L → Hom_R(M,R_L),    h⊗ℓ ↦ ([z]↦h([z])⊗ℓ),

is an isomorphism, as is the corresponding map for M*.

**Proof.** By C3 and right exactness, the source identifies with coker(pᵀ_L). Since E is finite free, the target identifies with ker(pᵀ_L) in **E_L**. Under these identifications the displayed natural map is induced by qᵀ_L: on [λ]⊗ℓ its value at [z] is (λᵀqz)⊗ℓ. C2 identifies its kernel before quotienting as im pᵀ_L and its image as the whole target. Apply the transpose factorization and C3 for M*.

Only Hom of the finite free E is identified with two copies of the target. Arbitrary Hom commuting with tensor is the conclusion, not a premise. The ambient module in this paragraph is E*⊗_A L≅E_L, never Hom_R(E_L,R).

## C5. Canonical biduality and both Ext vanishings

**Statement.** Evaluation η_M:M→M**, η_M(m)(h)=h(m), is an isomorphism. For every A-module L and i>0,

Ext_R^i(M,R_L)=0 and Ext_R^i(M*,R_L)=0.

The composite M⊗_A L --η_M⊗1--> M**⊗_A L →Hom_R(M*,R_L) is the natural evaluation isomorphism.

**Proof of biduality.** C3 for the transposed factorization gives θ_T:coker p→(coker pᵀ)*, with θ_T([z])([λ])=zᵀqᵀλ. Pullback by θ identifies M** with (coker pᵀ)*. For every λ,z,

(θ*η_M([z]))([λ])=η_M([z])(θ([λ]))=λᵀqz=zᵀqᵀλ=θ_T([z])([λ]).

Thus θ*η_M=θ_T. Both θ* and θ_T are isomorphisms, so the actual η_M is one. Tensor it with L and apply C4 for M*: on m⊗ℓ the composite sends h to h(m)⊗ℓ.

**Proof of Ext vanishing.** Augment the alternating free resolution by E→coker p. Applying Hom_R(-,R_L) gives the transpose maps on E_L, whose positive cohomology vanishes by C2. C3 supplies the analogous free resolution of M* from the transpose factorization. Use C2 again. This uses the standard computation of Ext from projective resolutions; no competing Ext functor is defined.

## C6. Coefficient flatness and arbitrary ring changes

**Statement.** M and M* are A-flat. For every A→A′, all C1–C5 hold over the actual mapped polynomial model R′. Its cokernel and dual identify canonically with A′⊗_A M and A′⊗_A M*. For every A′-module L′,

M*⊗_A L′ ≅ Hom_{R′}(A′⊗_A M,R′⊗_{A′}L′),

with the pure-tensor evaluation formula, and both corresponding positive Ext vanishings hold.

**Proof.** Monic normal form makes R A-free on v^n and uv^n. Thus the free R-resolution is also A-free. By C2 its tensor with every L is exact in positive degrees, giving Tor_1^A(M,L)=0 for every L. The standard flatness criterion applies, and the transpose proof applies to M*. This alternative argument does not replace the predecessor's checked section-ideal retraction proof.

Coefficient mapping identifies A′⊗_A R with the actual R′: the monomial bases agree and a′⊗r↦ι′(a′)φ(r) respects multiplication. Right exactness identifies cokernels. C4 for L=A′, followed by scalar extension/restriction adjunction, identifies the canonical dual map; the same conclusion follows directly from C3's representative formula. Repeat C1–C5 over A′ and use tensor associativity for L′. Identity, composition and evaluation compatibility follow on pure tensors and quotient representatives. Neither flatness nor injectivity of A→A′ is used.

For noetherian A these give the three conditions quoted in Ile Remark3.6: natural dual exchange, natural double-dual exchange and both Ext vanishings for all coefficient modules. Using Definition3.4 directly, A-flatness and this argument over each residue field also prove relative stable reflexivity of the polynomial cokernel. This does not prove a general criterion for unrelated families.

## C7. Transport to the actual section ideal

**Statement.** The existing map coker Ψ→J, [z₀,z₁]↦cz₀−dz₁, is an R-linear equivalence. Therefore C4–C6 hold for J and its actual dual D with their canonical evaluation maps.

**Proof.** Normal form R=A[Y]⊕uA[Y] shows d is regular: multiplication by Y−t is injective on each polynomial summand. Put σ=(c,-d):E→J. It is surjective and σΨ=0. The matrix κ=((0,-1),(-d,b)) is injective: κ(x,y)=0 first gives y=0, then dx=0, hence x=0. Direct multiplication gives κΦ=((c,-d),(0,0)). If σz=0, injectivity of κ gives Φz=0, so C2 gives z∈im Ψ. This computes the kernel and proves the specified equivalence.

Its generator formula commutes with coefficient mapping. Transport of Hom and biduality is through this actual map. The exchange for J is h⊗ℓ↦(j↦h(j)⊗ℓ), not an arbitrarily chosen equivalence.

## C8. The existing dual generator and the cokernel signs

**Statement.** There is a unique ε:J→R with dε(j)=bj. Under the existing coker Φ→D equivalence, [w₀,w₁] maps to w₀ incl−w₁ε.

**Proof.** For j=cx+dy put ε(j)=−ax+by. Multiplication by d gives bj. For two expressions of the same j, regularity of d forces the proposed values to agree. This gives R-linearity, ε(c)=−a, ε(d)=b and uniqueness.

Apply C3 with p=Ψ and q=Φ. Since Ψᵀ(-H)=(-H)Φ, the invertible -H induces coker Φ≅coker Ψᵀ. Compose with θ and transport along C7. Writing λ=-Hw=(w₁,-w₀), the pulled-back functional on E is

λᵀΦz=(w₀c+w₁a)z₀+(-w₀d+w₁b)z₁
       =(w₀ incl−w₁ε)(cz₀−dz₁).

Surjectivity E→J identifies the functional. Thus this is the prescribed `section-dual-cokernel`, with [1,0]↦incl and [0,1]↦−ε, not a differently signed map. The proof does not assume the full normal-coordinate equivalence of D.

## Integration boundaries and next work

These polynomial-model assertions are proved mathematically above, but have **not** been translated into checked Lean or integrated as packet nodes.

- Reuse `node-factorization-exact`, `section-dual-generator`, `section-dual-cokernel`, the existing ideal cokernel and canonical tensor adapters. C7–C8 prove their specified maps, rather than installing parallel objects.
- Arbitrary-module monicity, coefficient exactness, quotient duality, canonical biduality and Hom/Ext computations are separate proof obligations. Match them against reviewed pins and supplier nodes before insertion. General matrix-factorization/MCM theory remains with StablePeriodicCurved, layer7; its proposed PartII ownership change is unapproved. This note adds no ownership decision or edge.
- L is an A-module, not an arbitrary R-module. Setting all coordinates to zero in a receiving ring can make both matrices zero while retaining product zero; exactness then fails. No R-flatness, R-projectivity or geometric nodality follows merely from the coefficient argument.
- No polynomial highest-degree argument is transferred to formal power series. Complete the two-base completion comparison, Proposition7's exercise, pointed completed-local hull, actual nodal-family identification and coefficient-compatible faithful descent. Generic Appendix/family assertions remain separate even though this polynomial case has a direct proof.
- The dual normal-equivalence, scalar-correction, residue and tensor signatures still need implementation; none of their required APIs or tests is removed. Preserve the checked native coefficient splitting.
- At integration, include a non-flat coefficient module over Z/4, characteristic two with unit discriminant, degenerate discriminant, the natural pure-tensor formula, canonical bidual evaluation and negative second cokernel generator as discriminating tests.
- Run the indexed checker and combined stage/declaration/request graph checks after integration. They were **not run** for this handoff-only change. Neither Lean nor Lake is available here; no compiler, setup, cache download, library build or server was run.
- All predecessor MC.0–MC.7 moduli, positivity, fine-level, determinant/Deligne-pairing, Picard/Torelli, arbitrary-base approximation and source-collation gaps remain required. No stage or shared geometric key is closed.

## Fresh executable regression archive

The exact 127-line Python source and its output are preserved in the Python and text blocks of the first commit of this checkpoint:

https://github.com/CBirkbeck/tauceti-explorer/blob/8692df7aed441ac35678e6f36dc94ba815fca007/research/blueprint/handoff/DESIGN-StableReductionPartII.md

Use that revision for the **regression code**. The authoritative mathematical statements are C1–C8 above: in particular C4 explicitly uses E*⊗_A L≅E_L, not the ambiguous `E_L*` notation in the earlier archive.

Extract its Python block verbatim, preserving its final newline, and run `python relative_factorization.py`. Source SHA-256: `1622409e3e996f765c63aee7699a85cbc27a78b6887a9e605648b1c9d9025497`. Output SHA-256: `aabe98897e321defe5f5e08d1628efeb87c4312fd83239c837a49a72ce15b695`.

The program was run in this session. Its finite rings additionally impose Y^k=0 for enumeration. F remains monic in X on the lifted coefficient module, so these fixtures test the factorization mechanism, **not** the section-ideal identification: Y−t need not remain regular after truncation. They are finite regressions, not proofs of untruncated algebra, completion, sheaves or Lean correctness.

Fresh output:

```text
{
  "canonical_dual_quotient_cases": 20,
  "coefficient_module_cases": 20,
  "evaluation_formula_checks": 5620,
  "exactness_equalities": 80,
  "nonflat_Z4_to_Z2_cases": 3,
  "receiving_ring_counterexamples": 1,
  "skew_rotation_cases": 20,
  "tested_vectors": 11240
}
PASS: coefficient-module exactness, dual quotient and canonical evaluation regressions
```

There are 11,240 vector visits across the four exactness checks, not 11,240 distinct modules. The 20 coefficient fixtures include three non-flat Z/4→Z/2 cases. The evaluation tests check the actual pairing formula on the two standard source generators and all enumerated vectors, rather than claiming an exhaustive enumeration of all bidual maps.
