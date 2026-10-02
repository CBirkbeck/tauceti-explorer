# FIX-RT-PAPER-BOXER-CALEGARI-GEE-25

Codex, session `codex-rtOQ9t`, 2 October 2026. Refs [#5528](https://github.com/CBirkbeck/tauceti-explorer/issues/5528).
Base: `09dc58cdf2e55d3ccb2ddb285c55dc6a7d650b4a`.

All four findings confirmed in `RT-PAPER-BOXER-CALEGARI-GEE-25.review.json` are repaired in the extraction JSON and reader. This worker authored the original red team, independently verified by another worker; this is a fix, not a self-review. Only the three issue deliverables change. The global existence theorems retain their original hypotheses and conclusions.

## /1: the symmetric-power polarization

`symmetric-power-polarization` now requires `n≥1`, `d=n−1`, and invertibility of **2 and d!** in the coefficient field. This includes characteristic zero and odd characteristic p with n≤p, covering all of the paper's n=p−2,p−1,p applications. The existing symmetric-power functor is reused, with ownership at ArithmeticGaloisRepresentations G7.

For a nondegenerate alternating h on the two-dimensional space, define on symmetric tensors

\[
 B_d(u_1\cdots u_d,w_1\cdots w_d)
 =\frac{1}{d!}\sum_{\sigma\in S_d}\prod_{j=1}^d h(u_j,w_{\sigma(j)}).
\]

The expression is symmetric in each list of factors, hence descends to the symmetric power. If h(x,y)=1 and v_i=x^(d−i)y^i, its matrix is antidiagonal:

\[
 B_d(v_i,v_{d-i})=(-1)^i/{d\choose i}.
\]

Every binomial coefficient is a unit under the factorial hypothesis, proving nondegeneracy. Transposition contributes (−1)^d; odd d and 2 invertible give an alternating form, even d a symmetric form. Each h factor acquires μ=det r, so the multiplier is μ^d. This proves the scoped general pairing statement; finite checks are not its proof.

The group identification is also explicit: carry P∈GL_n(F), c∈F× with `PᵗB_dP=cA_n`, where the paper uses J_n in even dimension and 1_n in odd dimension. Alternating forms admit a symplectic basis over the stated field. In odd dimension over a finite field of odd characteristic, rescaling changes the determinant square class, and the classification of nondegenerate finite-field symmetric forms supplies this congruence. The diagnostic constructs one explicitly for n=7 over F₇. Over an arbitrary characteristic-zero field the identification with 1_n is an additional hypothesis: for F=ℝ,d=2 the induced form is indefinite, whereas every nonzero scalar multiple of 1₃ is definite. Retain GO(B_d) if no identification is provided. This qualification prevents another hidden overgeneralization of the group-valued conclusion.

The API specifies the normalized form, nondegeneracy/sign/multiplier and transport. Named acceptance checks include d=p−2 and p−1 positively, and d=p negatively. The exact all-form computation for SL₂(F₇) on Sym⁷ has a one-dimensional invariant-form space; its nonzero forms have rank6 and radical span{x⁷,y⁷}. Thus the old unrestricted GSp₈ conclusion fails, including after field extension. No source issue is added for this extraction overgeneralization.

The reviewed G7 audit distinguishes the existing algebraic symmetric powers from the absent arithmetic polarized package. The actual pinned `Representation.symmetricPower` was read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti/RepresentationTheory/SymmetricPower.lean:47`: it constructs the functor and its equivariant maps, without asserting this induced pairing. Existing statuses and all library citations are preserved.

## /2: fixed cohomological inertia signs

`nonordinary-local-shape` now uses **ω₂^{1−k} ⊕ ω₂^{p(1−k)}**. `lubin-tate-characters` fixes ω₂ as the reduction of ε₂ and states `ω₂^(p+1)=ε̄|I_p`, with ε₂ trivial on the specified uniformizer. The large-image note and local comparison use this convention consistently; there is no isolated discretionary sign.

The determinant is therefore ε̄^{1−k}, as required by `galois-representation-of-eigenform`. At p=79,k=38 the corrected exponent is −37≡41 mod78, while the printed positive formula gives37. The projective ratio is inverted, leaving its order `(p+1)/gcd(k−1,p+1)` unchanged. Twisting both characters by the quadratic inertia character is invariant under simultaneous inversion, so the dihedral contradiction and gcd conclusion remain unchanged.

New **E9** records the source's printed positive signs, checked on published p.516 and arXiv v3 p.8 against the earlier cohomological convention and following Lubin–Tate definition. It affects the proof, not a stated global existence result. Its literal mathematical display is recorded without an invented independent review verdict. API/acceptance checks include the determinant regression, projective order and dihedral inversion.

## /3: determinant normalization, quadratic twist and component

Choose φ lifting Art_Qp(p), with ε̄(φ)=1 and ε₂(φ²)=1. Ordinary induction has coset-basis Frobenius matrix

\[
 S=\begin{pmatrix}0&1\\1&0\end{pmatrix},\quad\det S=-1.
\]

The prescribed residual representation instead has determinant1 at φ, so its unramified normalizing character λ satisfies **λ(φ)²=−1**, of order four. Its Frobenius matrix is conjugate to

\[
 A=\begin{pmatrix}0&-1\\1&0\end{pmatrix},\quad A^2=-1.
\]

After /2, m=k−1 fixes the inducing exponent ε₂^{−m}. Taking Sym^(p−1) leaves λ^(p−1)=η^((p−1)/2), where η is unramified quadratic. The existing independence-of-m theorem therefore gives

\[
 \bar\rho|G_{\mathbf Q_p}\simeq
 \eta^{(p-1)/2}\otimes\bar\rho_{p,1}.
\]

`local-shape-theorem-3-1` uses that comparison and the crystalline lift **η^((p−1)/2)⊗ρ_{p,1}**. `deformation-ring-nonordinary` uses the same lift to label its local component. The fixed quadratic twist transports components between appropriately relabelled residual deformation problems; it is not an equality of components in a ring whose residual representation is unchanged. Its Hodge–Tate weight is zero and square is1, so it preserves weight zero and multiplier ε^(1−p).

At p=79 the unique middle monomial gives trace1 for Sym⁷⁸S and trace−1=78 for Sym⁷⁸A. The untwisted lift is therefore not a lift of the specified residual representation. At p=13 the twist exponent is even and the traces both equal1. Named local/component checks cover both cases and restriction compatibility.

Since F_v contains Q_p² in the paper's tensor construction, η is trivial on G_Fv. `tensor-identities` explains this restriction explicitly: the original displayed identities and local weights there survive. E4's separate theta-prime correction and E5's oddness obligation are retained, as are every other prior source issue. New **E10** records the missing twist in the comparison/component on published p.517 and v3 p.9, affecting the proof only. No new serialized source-issue review verdict is fabricated.

## /4: an early transfer interface, with an honest handoff

Route2 formerly imported ML.5 while supplying ML.2 and ML.3. The base graph has ML.2→ML.3→ML.5, so this closes a cycle. The import is replaced by the **existing proposed ET.4b** early cyclic-transfer interface from `RT-AREA-langlands-1.fixes.md /1`, coordinated with its `/15` early character stage SR.3b. Neither stage is currently registered or reserved; the extraction explicitly records a pending design/blueprint handoff, not an available implementation.

| Interface | Prerequisites | Consumers in this repair's graph |
| --- | --- | --- |
| Proposed SR.3b early characters | SR.3, ET.1, RG2.0 | ET.4, ET.4b, ET.6 |
| Proposed ET.4b cyclic base change/induction | AS.6, ET.3, ET.4, SR.3b | ET.6, ET.7a, R17.4, polarized lifting, ML.5 |
| Proposed polarized lifting | ET.4, ET.7a, ET.4b; AG2.0–AG2.7; G7 adequacy/global deformations; L7/L8; R03.3–R03.6/P8; arithmetic duality | ML.2, ML.3, level-one Part II |

The `requests` and `routingRepair` entries state the supplier, prerequisites, consumers, source scope, acceptance graph and authorized handoff. Generic transfer remains owned once in ET.4b; GL₂ R17.4/R17.5 specialize it. ML.5 remains the downstream endpoint registry. The late ET.7a unitary comparison export is a separate input, not a substitute for early cyclic transfers. The cyclic-base-change item's existing ML.5 planned target is retained as that registration target, with the proof supplier clarified. Route1's corresponding imports and reader dependency explanation are updated; no reviewed base or other blueprint is edited.

The exact source need is the automorphic input to **BLGGT14 Lemmas2.2.1,2.2.2,2.2.4**. Fresh reading of v4 pp.35–37 confirms algebraic twisting, soluble descent with irreducibility upon restriction and descent from an induced polarized representation. The latter uses AC89 Theorems3.4.2,3.5.1, HT01 LemmaVII.2.6 and the normalized `|det|^{n(1−m)/2}` twist. The books' proof interiors and full transfer decompositions were not freshly read; those remain supplier work/source-access obligations. The proposal does not assume a complete book extraction.

The assembled base at this commit is acyclic with **2,956 nodes, 8,558 distinct registered-endpoint edges**. Adding the two named early proposals, lifting and the level-one endpoint, their specified edges, all named lifting imports and ML.2/ML.3 consumers gives **2,960 nodes, 8,614 edges**, still acyclic. Restoring ML.5→lifting produces `lifting→ML.2→ML.3→ML.5→lifting`. The 76 external proxy-endpoint edges are counted separately and not recursively certified. This proves the proposed interface graph is consistent; it does not certify an unwritten supplier proof graph or silently apply its stages.

## Source provenance, validation and limits

Fresh bounded readings on 2 October 2026:

| Source | Scope | SHA-256 |
| --- | --- | --- |
| [Published JAMS offprint](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf) | pp.513,516–517; latter two also viewed as images | `4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290` |
| [arXiv v3](https://arxiv.org/pdf/2309.15944v3) | pp.5,8–9; latter two also viewed as images | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |
| [BLGGT14 v4](https://arxiv.org/pdf/1010.2561v4) | pp.35–37, §2.2 | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| [Pépin–Schmidt author copy, 26 Nov2019](https://www2.math.uni-wuppertal.de/~schmidt/Publications/LT191112.pdf) | §2 pp.2–3, induction/fundamental characters | `50990676f3c2331a0daa4eb1cb4478ba83c7e78383c896147bc052d5cf34c184` |

All hashes match the earlier extraction/red-team bytes. The new `sourceVersions` records the actual bounded published/v3 reading. Historical full-paper and v1/v2 readings in `source.readSections` and the earlier reader are preserved and attributed to their original workers. v1/v2, the other author copies, full prerequisite corpus and existing E1–E8 computations were not freshly re-audited. The arXiv history still lists v3; bounded title searches with erratum/corrigendum and Calegari/Gee author listings found no correction of these two formulas. That is not an exhaustive claim about unpublished corrections.

Exact arithmetic checks passed **194,846 additional assertions**, plus the archived all-form/inertia/Frobenius regression script: exhaustive GL₂(F₇) pairing equivariance in degrees5,6; generators/diagonal units at p11 degrees9,10; an explicit F₇ basis taking B₆ to a scalar identity; the forbidden-degree invariant space; full Frobenius traces at p7,11,13,79,107; determinant/sign, dihedral and gcd regressions; and both tensor-character identities at (79,38),(13,6). They are finite diagnostics, not Lean proofs of general automorphy or pairing theorems. The normalized tensor proof and specified graph are recorded above.

Paper, sourceVersions and three-file intake validators pass, as do diff and preservation checks. All **96 item IDs, 3 library/13 planned/80 missing statuses, 10 route memberships, 19 prerequisites and eight prior review objects remain unchanged**. Every missing item is routed exactly once. Current source findings total10; E9/E10 await their own source-issue review. No Lean deliverable, compilation, cache, library build or language server is required or claimed. Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
