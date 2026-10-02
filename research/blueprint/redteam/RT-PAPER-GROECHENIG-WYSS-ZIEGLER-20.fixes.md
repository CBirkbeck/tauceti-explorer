# FIX-RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20

All six independently confirmed findings are applied to the paper extraction and reader. The main mirror-symmetry theorem is retained. The actual Galois-isomorphism strengthening in Theorem 7.23 and the previously recorded E15/E16 transgression comparisons remain explicit proof obligations.

Worker: **Codex**, session **codex-rtOQ9t**, 2 October 2026. Refs [#5509](https://github.com/CBirkbeck/tauceti-explorer/issues/5509). Base: `6467e6c710ff22f51615f2abc19530d8f6b7680e`. The red team was written by this session and independently verified before this fix was claimed. This is a repair, not a self-review verdict. The original extraction and accepted review remain attributed to their original workers.

Only the issue's three deliverables change: this report, the paper result JSON and its reader. The original 78 identifiers and statuses (3 library, 5 planned, 70 missing), five route owners and memberships (4, 3, 4, 23, 36 items), eleven prerequisites, source record, verification record and twenty accepted source-issue records are preserved. Fifty-five unrelated item records are unchanged. Changed statement fields retain their former wording as history. New source records E21–E25 have no fabricated review verdict.

## 1. Retain the base action in gerbe descent

**Changed:** /9(a), the /11 proof input, the Part II brief and the reader. New E21 records the published Lemma 2.7(a) defect on pp. 516–517 and its use in the Lemma 2.9 proof on pp. 520–521.

Equivariant structures use torsors L_γ and multiplication `L_γ⊗γ*L_δ→L_{γδ}`, with trivial unit torsor, unit/associativity coherence, coherent equivalence and an equivariant commutative band. The pullback convention is explicit. Ordinary central extensions are retained only when the base and band actions are trivial. For a free C₂ action on Y=C₂ over algebraically closed characteristic-zero k, the permutation-module formula `H²(C₂,M)=M^{C₂}/N(M)` has one class, whereas forgetting the action gives four. This distinguishes the two classifications.

**Lemma 2.9 audit:** retain its conclusion without the incorrect global-character step. If α is the root gerbe δ(L) of a Γ-linearized line bundle, an inertia automorphism g acts on the rank-one fibre by a scalar λ_g satisfying `λ_g^{ord(g)}=1`. These scalars give a conjugation-invariant map from inertia to μ_|Γ|. The transgressed torsor is the torsor of r-th roots of λ. Under the source's constant μ_{r|Γ|} hypothesis, the surjection `[r]:μ_{r|Γ|}→μ_|Γ|` has a section as finite constant sets/schemes; it need not split as groups. Pulling back a chosen section trivializes the torsor. The owner must implement the root-gerbe identification and centralizer descent. A linearization on a nontrivially acted-on base is a cocycle of units, so its values need not be roots of unity away from inertia.

The later B_{k_F}I presentation has trivial base action and is retained. E20's earlier presentation/misquotation distinction is not used to excuse the original untwisted classification.

## 2. Require descent of geometric extensions

**Changed:** /9(c), the /42 compatibility note, the Part II brief and reader. New E22 records Lemma 2.7(c), equation (4), pp. 516–517 separately from E20.

The cyclic split sequence is restricted to trivial base/band actions and constant finite étale A with H²(k,A)=0. Constant abstract extensions give its splitting. General nonconstant smooth coefficients are not assigned a surjection to all geometric Ext classes; invariance alone would also need an obstruction argument.

The distinguishing example uses k=R, Γ=C₃ and A=μ₃. Geometric Ext¹ is C₃, conjugation acts by inversion, and its invariant subgroup is zero. Higher C₂ cohomology of a 3-primary module vanishes, giving H²(R,μ₃)=H²(B_R C₃,μ₃)=0. Thus the original geometric surjection fails within its hypotheses. For cyclic inertia I=C_e over finite k_F containing μ_e, the retained constant-coefficient sequence has H¹(k_F,Hom(I,μ_e)) and geometric Ext¹ both C_e, hence H² has order e². The original Spec k_L presentation must still retain its base action.

## 3. Weight character counts by automorphism groups

**Changed:** /13(b), the new-roadmap brief and reader. New E23 records the omitted denominator in Definition 2.14(b), p. 523. The cohomological definition and existing weighted stringy/volume formulas are unchanged.

Each trace summand is divided by |Aut(x)|. For BC₂/F₃, the two torsors each have two automorphisms: their trivial-character contributions sum to one, agreeing with cohomology; the printed unweighted sum is two. For the generically free sign action on A¹/F₃, the zero sector contributes two halves and the free locus contributes two, giving three rather than four. The nontrivial-character BC₂ sum is zero. The accompanying exact diagnostics also check the analogous sign quotient over F₅, F₇ and F₁₁.

## 4. Retain the complementary Tate-pairing block

**Changed:** /23, the /78 consumer note, Part II brief and reader. New E24 records Lemma 3.7, p. 531. Proposition 3.6, the unramified annihilator and normalized ordered mixed evaluation are retained.

For F=Q₃, uniformizer 3 and Γ=C₂, the Kummer class −3 satisfies `(-3,3)_3=+1`, so its unramified reciprocity coordinate is zero and it belongs to the complementary factor. But `(-3,-3)_3=-1`, giving self-pairing 1/2. In basis (unramified −1, complementary −3), the invariant matrix is `[[0,1/2],[1/2,1/2]]`. The class +3 would not test the same complementary factor. The odd-prime Hilbert formula directly computes all entries.

A full block formula now includes the restriction D on the complementary factors, or requires a proved hypothesis eliminating its 2-primary obstruction. The embedding `k mod |μ(F)|↦k/|μ(F)|` in Q/Z and reciprocity/Frobenius/cup-product conventions are explicit. Item /78 uses only the unramified mixed evaluation, so neither its statement nor mirror symmetry is refuted by this diagonal example.

## 5. Separate traces from actual Galois isomorphism

**Changed:** /76, the proposed new-roadmap target, summary and reader. New E25 is a proof gap in the Theorem 7.23 proof, p. 589. Corollary 7.22 is unchanged.

Theorem 6.12 supplies equal alternating Frobenius traces over finite extensions, hence a trace/virtual-character consequence. The stronger actual Gal(k)-equivariant isomorphism of fibre complexes remains unresolved until supplied with arithmetic semisimplicity and valid cohomological-degree separation at the actual fibres, or an independent geometric isomorphism. No unqualified degreewise semisimplification is asserted from alternating traces.

Frobenius I₂ and `J₂=[[1,1],[0,1]]` are continuous pure weight-zero representations: J₂^m has trace two for every positive m, but their fixed-space dimensions are two and one. The diagnostic checks the first 64 powers. This challenges the printed inference, not these specific Hitchin fibres. R01.5 assumes semisimplicity; DWP.7 cannot provide it merely by asserting purity, nor can smooth-proper purity be silently transferred to singular ordinary fibre cohomology.

A `requests` entry hands this missing proof to the existing proposed owner `TopologicalMirrorSymmetryForHitchinSystems`, needed by /76. It is not a new registered stage, supplier or second owner. No blueprint for that candidate is edited by this paper fix.

## 6. Apply accepted corrections in active statements

The old E1–E20 findings and all their review records are preserved exactly. Finding 6 concerns applying that accepted history, rather than claiming to discover it again.

| Items | Active correction |
|---|---|
| /15, /17 | Retain compatible root choices for general prime powers; only use the justified prime-field independence fixing character values. Density-one prime-residue points suffice for the comparison. |
| /16, /17 | Work over R′[1/ℓ] with suitable finite étale covers and Q̄_ℓ roots, giving finite coefficient models for the finite denominators used. Q_ℓ denominators require prime-to-ℓ or explicitly proved valuation bounds. Use negative fractional Tate twists, correct i/j indices, and justified weight pieces. |
| /25, /52 | Use μ_r-gerbes, the Hochschild–Serre edge map and quotients by the image of H²(F,μ_r). A torsor's base map need not inject. Normalize at the unit after trivialization; underlying Brauer r-torsion loses Pic/r. |
| /36 | Obtain the inertia generator from the inverse tame character `σ↦σ(π_L)/π_L`, corresponding to ζ^{|Γ|/e}, rather than reciprocity of ζ. |
| /40–/47 | Explicitly enlarge to L′=L·F_d, d=[L:F], before splitting-based arguments. Keep Γ′=Γ×_{C_{d/e}}C_d and quotient-stack descent. Choose the complement and its totally ramified fixed field E, then a suitable uniformizer with π_E^e∈F. |
| /50 | Use the full Hochschild–Serre edge sequence with its constant-global-units hypothesis and the middle exactness needed by Lemma 6.5. Base Brauer injectivity and right surjectivity have their actual extra hypotheses. |
| /66, /71 | Put M=det(π_*O); use Nm⁻¹(L·M⁻¹), `(P^L)^e=P^{L^e M^{1−e}}`, and N=M⁻¹Q^n of degree zero. |

For the tame enlargement, Γ is abelian under μ_e⊂F but need not split. A Frobenius lift g has order dividing d, so `(g,1)` generates a complement of order d in Γ′. Its intersection with inertia is trivial. The unramified map of integer rings is finite étale; quotient descent preserves X_{L/F}. The diagnostic checks 280 cyclic finite-group models with d≤64; the preceding argument, rather than that finite enumeration, supplies the general complement construction. No statement claims that every original uniformizer has its e-th power in F.

For the norm sign, `Nm(L′)=det(π_*L′)·M⁻¹`; taking the e-th power gives norm `L^e M^{−e}`. This is the fixed-determinant target `L^e M^{1−e}`. Choosing deg(Q^n)=deg M gives deg N=0, and `L^e N^{e−1}` differs by the n-th power `Q^{n(e−1)}`. The exact degree diagnostic covers 1,872 formal parameter choices; the existence/degree-independence conclusion is retained.

Existing E15/E16 comparisons remain explicit in /46, /47 and /52. Neither the splitting correction nor the μ_r formulation proves those omitted transgression comparisons. The two refined route briefs retain their owners and memberships; the separately accepted sibling extraction is not edited.

## Sources, scope and validation

Primary source: Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, Inventiones mathematicae 221 (2020), 505–596, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), [publisher article](https://link.springer.com/article/10.1007/s00222-020-00957-8). The work is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); quotations and paraphrases are attributed to it, and this report identifies the changes proposed to its statements.

The fresh download contains 92 pages and hashes to `f2231145778b0a3fb57ce241ce0014fc4299f0de536d3e19daf4206d146c3e07`, matching the extraction and red team. Repair reading covered journal pp. 516–517, 520–521, 523, 525–527, 531, 534, 543, 548–551, 565, 567–568, 579, 582–583, 585 and 589. Images of pp. 516, 523, 531 and 589 were viewed. Additional locally extracted pages are not claimed as fresh readings. No fresh full-paper or preprint collation is claimed.

Fresh correction checks covered the publisher article, [arXiv history](https://arxiv.org/abs/1707.06417) through v3 (28 October 2019), Crossref DOI metadata (`relation={}`, no `update-to`/`updated-by`) and bounded title/author/DOI searches. No relevant correction was found. This does not establish exhaustive novelty or rule out unpublished corrections. Supporting literature cited in the earlier red team remains historical evidence, rather than a claimed fresh download here.

The repair inspected the affected item fields, route briefs, source locators and relevant recognition/purity/stack import descriptions. It does not claim a new whole-library absence audit, a full rereading of every reviewed coverage record or a global atlas graph audit. The three library statuses and pinned citations remain unchanged at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Route memberships and prerequisites are unchanged, so this fix introduces no registered atlas dependency edges.

Validation:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json`
- `python3 research/blueprint/intake.py check-files` on the three deliverables.
- Shared `source_issues.check_issues` on all 25 records and `check_errata.versions_checked` on the new published findings.
- Exact distinguishing mathematics described above, plus the root-choice and finite-coefficient obstruction controls.
- Baseline preservation: all 78 identifiers/statuses, 55 unrelated records, five owners and route memberships, all 70 missing items routed once, eleven prerequisites, source/verification, and twenty existing source-issue/review records.
- `git diff --check` and three-file scope check.

No Lean deliverable is required or compiled. No library build, cache download, new Lake project or language server was run. The exact diagnostics support the stated mathematical arguments; they are not Lean formalizations of gerbes, local duality or Galois sheaves.
