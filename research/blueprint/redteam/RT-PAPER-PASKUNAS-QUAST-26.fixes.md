# FIX-RT-PAPER-PASKUNAS-QUAST-26

Codex, session `codex-J6LwjP`, 2 October 2026. Refs #5517. Complete fix of the twelve findings confirmed in [the independent red-team verification](RT-PAPER-PASKUNAS-QUAST-26.review.json). The [result](../papers/PAPER-PASKUNAS-QUAST-26.result.json) and [reader](../papers/PAPER-PASKUNAS-QUAST-26.md) carry the repairs. This report supplies implementation obligations for the pending design; it is not a review verdict or a claim that the mathematics has been formalized.

Only the issue's three deliverables are changed. No existing blueprint packet for these new Part II layers was named as a deliverable. The corrected statements, proof interfaces, prerequisites and tests therefore stay in the paper inventory and its coalesced Part II brief for the design job. The existing owner `LocalGaloisDeformationRingsPartIIComponentsAndNormality`, all six route item lists, and upstream roadmaps are unchanged. All 80 missing items are still routed once.

## 1. Completion of the total space

Corrected /32 and Part II brief (3): for x∈X̄∖Y the formula is `Ô_{X,x}[[T]] ≅ R^□_{G,ρ_x}`. The corresponding reduction is `Ô_{X̄,x}[[T]] ≅ R^□/ϖ`, with the **same O-uniformizer defining the special fibre**, its image in the local-field coefficient ring Λ, and the extra variable T retained. The reader states the characteristic-zero versus characteristic-p distinction. The API requires completion/reduction compatibility rather than silently changing the coefficient ring or uniformizer after extension.

The published Lemma 5.17, p. 35, already uses the total space; Lemma 15.11, p. 80, separately records the total and special-fibre formulas. This is an extraction correction, so no new source issue was invented. The planned tests check reduction compatibility, characteristic zero for the O-flat total algebra, characteristic p for the special fibre, and the extra dimension contributed by T.

## 2. Connected isogenies and disconnected finite maps

Corrected /4: `Z(G^0)^0 → G^0/G′` and `Z_i → H_i^0` are the connected isogenies. Δ-stability gives normality of Z_i in G; centrality in disconnected G is not assumed. Corrected /70's proof interface: factor q through `H_1 ×_Δ (G/Z_1)`, prove the neutral-component map finite using the connected isogeny, prove componentwise finiteness after the split constant-component extension, and descend. The fibre product has a closed immersion into the full product because Δ is finite separated. Finiteness of q, /45 Proposition 8.7, base change to ψ_1 and the product identification suffice. Surjectivity onto the full product and disconnected centrality are unnecessary.

Added E3 against published p. 76. For `G=G_m×C_2`, the component map is the diagonal `C_2→C_2²`: finite, not surjective. Connected tori cannot surject onto disconnected H_i. The finite-map conclusion of Proposition 15.1 remains a target with the listed proof obligations.

Added E4 against Proposition 13.25's proof, p. 68, and corrected /64: the split centre is diagonalizable, not necessarily a torus. Its finite derived centre admits the required characteristic p-primary/prime-to-p decomposition. `Z(SL_2)=μ_2` is the negative test. Replacing the centre with only its torus would lose this finite part.

## 3. Fixed-residual torus component labels

Replaced /77's all-H¹ display. Every pro-p group occurrence in the formal labelling construction now uses Γ_E, with **Δ-invariants**, as already required by /71. Put `J_E=(Γ_E^{ab,p}⊗M_2)^Δ` and `μ=J_E,tors`. PQ25 Theorem 9.3 describes the pseudodeformation ring as `O[[J_E]]` after the specified splitting/existence-of-lift hypotheses. Choosing a lift identifies the framed fixed-residual functor with a torsor for principal-unit cocycles `Z¹(Γ_F,Hom(M_2,1+m_A))`. The component labels use the pseudodeformation/formal-character interface and restriction to μ, not an unrestricted H¹ or a blanket restriction-of-cocycles bijection. When p divides |Δ|, the full cocycle functor remains essential.

Added E5 against published p. 85; the same display was read in arXiv v2, p. 94. The semidirect Teichmüller lift supplies a canonical minimally ramified base component only in that case; a general choice of α remains noncanonical. Tests include the unramified quadratic sign lattice at odd p, where Γ_F would give zero sign invariants instead of the Γ_E rank [F:Q_p], and an unramified Frobenius value −1. The latter is an unrestricted prime-to-p character with nontrivial residual reduction and cannot factor through a pro-p group. Correcting the subscript alone would not pass these tests.

## 4. Weil-group torus correspondence

Corrected /81, its API, tests, prerequisite note and Part II torus input: the full torus correspondence is `H¹_cont(W_{E/F},T̂(Q̄_p)) ≅ Hom_cont(T(F),Q̄_p^×)`, using the relative Weil group (equivalently admissible W_F parameters). Separately restrict the Galois parameters of Theorems 16.4–16.5 to the Weil group. The abelian dual torus on Γ_E allows factorization through the relative Weil group. This direction is all those applications need. No stronger unrestricted or unitary Galois bijection is exported.

Read Birkbeck's published Theorem 1.0.1, p. 134, and the parameter definition in §1.1, p. 136; its theorem uses divisible topological coefficients. A uniformizer value p is a continuous unramified F^×-character but has unbounded valuations and cannot come from compact Γ_F. A value 1+p has compact principal-unit cyclic closure and extends via `Ẑ→Z_p`. This is an extraction correction; Theorems 16.4–16.5 are not withdrawn.

## 5. Local factoriality

Replaced /76's arbitrary-ring claim with the noetherian **local** complete-intersection theorem: regularity at every prime of height≤3 implies UFD. Nonlocal rings or schemes receive local factoriality unless a global Picard/class-group argument is supplied. The complete local deformation-ring application of /75 and the R03.3 route remain.

The negative test is the regular Dedekind hypersurface `Z[√−5]`. It is locally factorial but `6=2·3=(1+√−5)(1−√−5)` has nonunique factorization. Norms `a²+5b²` exclude elements of norm 2 or 3; units are ±1 and the displayed factors are nonassociate. This is an extraction mistake, not a new source issue. The reviewed R03.3 audit supplies regular sequences but not the CI/CM/excellence package; its missing general inputs stay with their existing owner.

## 6. Reduced inverse-image subgroup

Changed /54 to `H_0=(p_2⁻¹(μ_{p−1}))_red` over the algebraically closed/perfect field. Its API requires: reduced closed inverse image is a subgroup; smoothness over the perfect field; equality of geometric points with the original preimage; reductivity and the strict centre-dimension inequality. The repaired proof applies the reductive-subgroup argument only to the reduced group: its image with the centre generates the relevant Levi image, excludes proper R-parabolics, and supplies the centralizer conclusion needed for the dimension drop. Martin's cited subgroup input is still a stated prerequisite, not a newly claimed library result.

Propagated reduction into /69's Proposition 14.5 interface, including the reduced pullback under φ, geometric containment equivalence and the reductivity/dimension checks before induction and /68. Added E6 separately from E1. At p=2, `SL_2→PGL_2` pulls μ_1 back to μ_2 with algebra κ[ε]/ε². It is nonsmooth, whereas its reduction is the trivial subgroup. Geometric points agree and tangent dimensions differ. The existing characteristic-p restriction E1 alone cannot repair this construction.

## 7. Positive multiples of cocharacters

Added /54's positive-multiple lift API. A finite lattice cokernel allows a lift after multiplying by n>0, not necessarily an integral lift of the original cocharacter. Replace `α∘p_2∘λ=id` by `α∘p_2∘λ(t)=t^n`. The image still is not contained in the finite μ_{p−1}. Positive multiples preserve the limiting parabolic, its Levi and unipotent functors, and the contraction of U; Conrad Theorem 4.1.7(1) explicitly states this.

Added proof-level E7 at published pp. 54–56. The SL_2-to-PGL_2 torus cocharacter map is multiplication by 2, so exponent 1 does not lift but exponent 2 does. Exact sign checks for positive multiples agree with the weight argument. This repairs the proof without asserting that the centre-dimension or non-speciality conclusions fail.

## 8. Corrected matrix action

Added E8 and /54's corrected expression `γ·ē21=ωψ⁻¹ē21+2ωbē11−ωψb²ē12`. Direct conjugation by `[[1,b],[0,ψ⁻¹]]` gives `[[b,−ψb²],[ψ⁻¹,−b]]`, whose diagonal class modulo scalars is `2bē11`. The flag `(ē12)⊂(ē12,ē11)⊂(ē12,ē11,ē21)` and graded characters `(ωψ,ω,ωψ⁻¹)` are unchanged. The invariant-line and diagonalization argument retains Lemma 11.4's hypotheses and conclusion.

Exact computations for every b and nonzero ψ,ω in F₂, F₃, F₅, F₇ and F₁₁ checked all three basis actions: **4,338 computations passed**. The omitted term was nonzero in **1,288** odd-characteristic parameter cases and vanished in every characteristic-2 case. These computations test the corrected proof input; they do not prove the entire Galois cohomology theorem.

## 9. Existing dynamic Hopf functors

Added library item /85 after reading the actual pinned statements in `Dynamic/Parabolic.lean` and `Dynamic/Functor.lean`. For commutative R,H with `HopfAlgebra R H`, the functor packaging needs no connectedness, reductivity, smoothness or finite presentation. The pointwise carrier definitions even allow the stated semiring setup. Reuse parabolic/Levi/unipotent membership, unique extension, limit and Levi retraction, pointwise decomposition and trivial intersection, change-of-value maps, the three group-valued functors and their natural inclusions.

Kept /10 missing for the scheme-level natural identification, representability, finite presentation/closedness, smoothness, geometric unipotence and the R-Levi/component results. Its API cites Conrad Theorem 4.1.7 with finite presentation and smoothness hypotheses rather than mistaking a packaged functor for a representable scheme. Tests cover the trivial cocharacter, GL_2, change of algebra including dual numbers, and the swapping `G_m²⋊C_2` example: `(t,1)` and `(t,t)` give distinct parabolics with the same neutral component. The Part II imports /85 and upstream is unchanged.

## 10. Conrad references

Added E9 for the four misbound [16] references and a fifteenth prerequisite with the obtainable [author PDF](https://math.stanford.edu/~conrad/papers/luminysga3.pdf). Published bibliography p. 94 identifies [16] as *Irreducible components of rigid spaces* and [19] as *Reductive group schemes*. Checked intended inputs:

| Consumer | Correct source locator | Use |
|---|---|---|
| /50, discussion before Proposition 10.1, p. 51 | Example 1.1.16, p. 12 | Semisimple derived group is its own derived group |
| /51, Lemma 10.4 proof, p. 52 | Example 5.3.9, pp. 170–171 | Generation by root groups |
| /51, same proof | Theorem 1.2.7, p. 20 | Rank-one structure |
| /59 supporting input and /61, discussion before Proposition 13.11, p. 63 | Theorem 4.1.7(4), pp. 112–114 | Smooth dynamic subgroups and Lie weights |

The notes cite title and locator instead of perpetuating the wrong numeric reference. Valid target statements are unchanged.

## 11. Affine condensed-points construction

Added E10 against Appendix A.1, p. 90, and restricted /26 and /84 to the affine representable functors actually used. For finitely presented B, `X(A)(S)=Hom_{R-alg}(B,A(S))` preserves the empty/finite products and descent equalizers of the condensed algebra A; finite presentation handles accessibility at the needed cutoff. The generic construction and Lemma A.8 remain owned by VS2, with /26 importing them. A future nonrepresentable extension must give sufficient exactness/descent/accessibility hypotheses.

The constant two-element accessible functor sends ∅ to 2 rather than 1 and the disjoint union of two singleton profinite sets to 2 rather than 4. It is not condensed. No arbitrary-accessible-presheaf API is exported. The closed-immersion statement of A.8 is retained and tested on affine polynomial equations.

## 12. Wild normal-basis prerequisite

Added E11 against **PQ25**, published p. 30, Lemmas 8.4/8.7, and corrected /71 plus its prerequisite and Part II input. Tensor with Q_p before rational normal basis for rank. For completion, choose `Λ_nb=O_F[Δ]θ⊂E` from a normal-basis element, scale it into the exp domain, and use `π_F^nΛ_nb`. These full Δ-stable lattices are cofinal and induced. Their diagonal tensors with M untwist to induced modules; Shapiro supplies the H¹ vanishing needed for the invariants/completion comparison. This never asserts that O_E or every `p_E^n` is induced.

For `E=Q_2(√2)`, `O_E=Z_2[√2]` has trace image `2Z_2` but invariants `Z_2`; the regular `Z_2[C_2]` module has trace onto invariants. The two cannot be isomorphic. The lattice `Z_2(1+√2)⊕Z_2(1−√2)` is a normal-basis lattice with determinant/index 2, invariant subgroup `2Z_2` and trace onto it. Scaling by 4 puts it inside the convergence range `v_2>1`. Tests distinguish the false integral claim from the cofinal induced-lattice repair. No false main theorem of the 2026 paper is claimed.

## Provenance and verification

`sourceVersions` records exact URLs, full SHA-256 hashes, date and scope for the 2026 published PDF, main arXiv v2 PDF, 2025 published prerequisite, Birkbeck and Conrad. Cambridge's fresh downloads carry time/IP footers, so their hashes are download-specific. Targeted page images were checked for the key published assertions; text extraction was not trusted for the total/special-fibre bars or scheme labels. This was a targeted fix reading, not another full recursive prerequisite audit.

The bounded correction search on 2 October 2026 checked both arXiv histories, both Crossref records, Quast's public/institutional listings and title-specific correction searches. No relevant correction was found. Cambridge notice-page HTML failed while its PDFs were readable; no claim to have inspected an inaccessible corrections tab is made. E1/E2, their old search records and independent verdicts are preserved exactly. E3–E11 have no self-authored `review` fields and await independent review.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed R03.1/R03.3 and VS2 audits were read. /85 cites only actual declarations read at the pin; scheme theorems remain missing.

Checks run successfully:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json`.
- `python3 research/blueprint/intake.py check-files` on the three deliverables.
- Shared source-issue validation and `check_errata.versions_checked` on the result.
- `git diff --check`.
- Exact algebraic regression models described above, plus unique routing, acyclic added dependencies, preserved route lists/owner and preserved E1/E2 review objects. Final counts: **85 items, 2 library, 3 planned, 80 missing; 6 routes; 15 prerequisites; 11 source issues**.

No Lean file is a deliverable of this job, and no suitable compiled build at the pinned commits was available. No Lean compilation was run. No large library build/cache or language server was started. The downstream design must prove the listed subgroup, lattice, representability, finiteness and formal-torsor interfaces; finite Python regressions are not substitutes for those proofs.

### Reproducing the matrix regression

The following dependency-free Python performs the exact basis-action check and detects the omitted term in odd characteristic:

```python
def mul(A, B, p):
    return [[sum(A[i][k]*B[k][j] for k in range(2)) % p
             for j in range(2)] for i in range(2)]

bases = [[[0,1],[0,0]], [[1,0],[0,0]], [[0,0],[1,0]]]
checked = missed = 0
for p in [2,3,5,7,11]:
    for b in range(p):
        for psi in range(1,p):
            for omega in range(1,p):
                A = [[1,b],[0,pow(psi,-1,p)]]
                inv = [[1,-b*psi % p],[0,psi]]
                expected = [[omega*psi,0,0],
                            [-omega*psi*b,omega,0],
                            [-omega*psi*b*b,2*omega*b,
                             omega*pow(psi,-1,p)]]
                for E, coeff in zip(bases, expected):
                    C = mul(mul(A,E,p),inv,p)
                    actual = [omega*C[0][1] % p,
                              omega*(C[0][0]-C[1][1]) % p,
                              omega*C[1][0] % p]
                    assert actual == [c % p for c in coeff]
                    checked += 1
                assert expected[0][1:] == [0,0]
                assert expected[1][2] == 0
                missed += int(p > 2 and 2*omega*b % p != 0)
assert (checked, missed) == (4338, 1288)
```
