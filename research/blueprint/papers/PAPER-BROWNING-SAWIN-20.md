# PAPER-BROWNING-SAWIN-20 — geometric circle method

Codex — codex-c83e7a, continuing codex-a71f92. Issue #1125. Status: **partial**, not formalised.

The complete author version and all published text have been read. The continuation inventory has 136 interfaces: 11 library, 9 planned, 116 missing, with every missing item routed exactly once. All numbered main/auxiliary results have an interface or an explicit gated target; the remaining proof and publication-reconciliation debts are not hidden by that inventory count. The sharp comparison-range proof is unclosed. The official journal PDF confirms the two most consequential minor-arc problems and the low-dimensional loop-space problem.

## Sources and limits of the read

Primary full read: Browning–Sawin, [arXiv1711.10451v3](https://arxiv.org/pdf/1711.10451v3), dated 19 February2020, labelled Final version, all §§1–7 and references. SHA256: `4518f88842e2bc19d2b2e0634f1df54c96d36164331e88fc30ef892f3c879072`.

Publication: [Annals191(2020),893–948](https://annals.math.princeton.edu/2020/191-3/p04), DOI10.4007/annals.2020.191.3.4. The [official 56-page PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf) was obtained later in the work; SHA256: `f20c87e337c054e42134bf2daf577203ce4b391e0d22ff59b9425d1249c33c53`. Its main statements pp.893–895, Cor.3.10 p.919, minor-arc proof pp.934–935 and topology pp.942–946 were checked. Images of journal pp.934 and944 were compared with the author PDF. Those were the previous checkpoint’s read extents. On 23 September 2026 all published text was freshly read, pp.893–948. This does not certify image-level reconciliation of every inherited finding. A token comparison is only a navigation aid, not evidence that mathematical formulas are equivalent. Reference numbers15/16 and24/25 exchange places between the two versions.

Original-source passages read: [Browning–Vishe2017 §4](https://msp.org/ant/2017/11-7/ant-v11-n7-p06-s.pdf), [Browning–Vishe2015 Lemma2.8 and beginning of proof](https://www.maths.dur.ac.uk/users/pankaj.vishe/fqt.pdf), [Katz–Sarnak §§11.4.4–9 through the proof](https://web.math.princeton.edu/~nmk/RMFEM.pdf), and [Church–Ellenberg–Farb Prop.3.3/Thm.3.7](https://arxiv.org/abs/1309.6038). The JSON records hashes, precise read extents and unexamined subsidiary inputs. No author was contacted and no finding has independent-review status.

## The objects and theorem boundary

Fix a nonzero coordinate representative x of P at infinity. Mor consists of tuples g_j=x_j T^d+lower terms satisfying f(g)=0; some individual g_j may have degree less than d when x_j=0. This is neither a quotient by reparametrization nor a Kontsevich moduli space. Both the affine hypersurface X and its projective leading-form boundary are smooth.

Write D=d(n−k), L=kd, K0=k−1, t=floor(d/K0), and δ=n/2^k−k+1. The main hypotheses are d≥k−1≥2, δ>0, and in positive characteristic p>k with ℓ of even order modulo p. Artin–Schreier coefficients are explicitly E=Q_ℓ(μ_p); descent to the displayed Q_ℓ objects remains a listed obligation.

The shifted major-arc spectral sequence has

\[
E_1^{m,s}=\bigl(H_c^{s+mn}(PConf_m,E)\otimes H_c^{n-1}(X,E)^{\otimes m}\otimes\mathrm{sgn}^{n-1}\bigr)^{S_m}(kd-m-n(d-m)),\quad 0\le m\le d.
\]

It vanishes outside those columns. Differentials have degree(r,1−r), and odd pages vanish in the main parameter range. The sign comes from derived tensor symmetry; the Tate twist is retained over finite fields. A finite-filtration convergence theorem is required in addition to the library's spectral-sequence carrier.

The source compares its abutment to H_c^{i+2D}(Mor) for i>−4(tδ−1). The displayed minor-arc argument does not establish that exact range. What its stated intermediate estimates do give is the conservative range i>−4(tδ−K0), as detailed next. Conjectures1.3 and7.1 stay unproved propositions. Theorem7.7 is a conditional implication, not a proof of either conjecture.

## The rounding check

There are two separate problems on author p.38 / journal p.934.

First, the minor-arc stratification must end at m=ceil(L/2)−1. The printed floor(L/2)−1 omits the last stratum when L is odd. For L=9, m=4, b5=1 and all other b_r=0, the 5×5 Hankel matrix is anti-identity and has rank5, so A4 is not all A9.

Second, the stratum estimate is

\[
B(m)=2dn-\frac{n}{2^{k-2}}\left\lfloor\frac m{k-1}\right\rfloor+4(m+1).
\]

The paper displays a decreasing **lower bound** for B(m), then uses it as an upper bound. Put m=K0 q+r, 0≤r<K0. Then

\[
B(m)=2dn-4q\delta+4(r+1)\le 2dn-4t\delta+4K0.
\]

Thus the same method, with the correct stratification, yields the conservative vanishing cutoff 2dn+4K0−4tδ. In the entirely even-length case k=3,d=4,n=24, the source cutoff is188 but the included stratum m=5 has B(5)=192. This shows a failed inference, **not a counterexample to the geometric vanishing theorem**. A sharper geometric input might recover it.

There is also an independent endpoint gap in Cor.1.4/2.9. Even assuming the source's sharp comparison, tδ=1 gives only i>0, while the proof needs i=0. A sufficient hypothesis for this invocation would be tδ>1; with the conservative replacement it is tδ>K0. Do not silently relabel the original weak endpoint as proved.

## Other source findings

All 28 findings are recorded in the required sourceIssues format, with quoted formula fragments, correction, argument, scope and correction searches. The major ones are E1–E8; the rest include shift, twist, indexing, domain and omitted-hypothesis problems. Only locators explicitly marked as checked in publication are asserted to persist there.

- E1 (error; the proof): Proof of Prop.2.6, v3 p.38; journal p.934 (both images checked). Use m0=ceil(kd/2)−1 in the disjoint minor-arc stratification.
- E2 (gap; a stated result): Proof of Prop.2.6, v3 p.38; journal p.934 (both images checked). The displayed lower bound on B(m) cannot be used as its upper bound. Retaining the remainder gives B(m)≤2dn+4(k−1)−4tδ. The sharper Proposition2.6 requires an additional estimate not present in this step.
- E3 (gap; a stated result): Cor.1.4/2.9 v3 pp.6,14; journal main condition p.894 and Cor.1.4 p.898. Even granting the sharp theorem, invoking it at i=0 requires tδ>1, not ≥1. With the conservative repaired range a sufficient hypothesis is tδ>k−1. The equality endpoint needs an independent argument.
- E4 (error; a stated result): Lemma7.6 v3 p.46; journal p.944 (both images checked). Restrict this full-double-loop Betti formula to n≥4, or supply a different componentwise formulation for n=2,3.
- E5 (error; the proof): Eq.(7.3) v3 p.46; journal pp.943–944. The right side is only the weighted-diagonal component for a fixed j. Define c_m=[q^{m(n−2)−j}U^m] of the full series, then extract [q^{−j}] after U=q^{2−n}.
- E6 (misprint; the proof): Lemma7.4 proof v3 p.45; journal p.942. Use ordinary H^i in the first sum and ordinary H^{m−i} in the intermediate sum; duality then gives the final H_c^{m+i} sum printed correctly.
- E7 (misprint; nothing): Lemma7.4 last line v3 p.45; journal p.943. Restore the exponent −e_r(N) on every factor.
- E8 (misprint; the proof): Theorem7.7 proof v3 p.47; journal p.945. Use dim H_c^{i+2D}(Mor,Q), and begin the next comparison with this compact-support dimension rather than already asserting the desired E1-diagonal equality.
- E9 (misprint; nothing): Lemma2.4 proof v3 p.10; publication not separately checked. The upper index is m+1, the number of kernel-vector coordinates.
- E10 (misprint; nothing): Lemma2.8 final sentence v3 p.14; publication not separately checked. Replace PConf_m in that sentence by PConf_m/G_a.
- E11 (misprint; the proof): Lemma3.2 proof v3 p.17; publication not separately checked. The product degree should be i+2 (and include the Tate twist before suppressing it over a separably closed field).
- E12 (misprint; the proof): Lemma3.4 proof v3 p.19, first two affine-pushforward displays; publication not separately checked. Use E[−2n(d−m)](−n(d−m)).
- E13 (misprint; nothing): Lemma3.5 last paragraph v3 p.21; publication not separately checked. The involution swaps the coprime factors l1,l2 and their associated residue data, not the numerator h1 with the denominator h2.
- E14 (misprint; nothing): Lemma3.6 nonzero-f case v3 p.22; publication not separately checked. Modulo polynomials, the right side is λ f(g(x))/(T−x). Its coefficient of T^{−1} is λ f(g(x)).
- E15 (misprint; nothing): Lemma3.7 proof v3 p.23, twice; publication not separately checked. Use a2,…,an for the generic/fixed coordinates while a1 varies.
- E16 (gap; a stated result): Cor.3.10 arXiv v3 p.24 and journal p.919 (both statements read). Add 0≤m≤d to the stated hypotheses.
- E17 (misprint; nothing): Figure2 v3 p.26; publication not separately checked. On U_m use Rp2'! ebar*L_ψ; apply Rπ2! only after moving the base to A^m.
- E18 (misprint; nothing): Lemma4.3 proof v3 p.29; publication not separately checked. For (orthogonal dimension, symplectic dimension), the exceptional pairs are (3,2) and (5,4).
- E19 (misprint; nothing): Lemma4.4 relative trace v3 p.30; publication not separately checked. The trace target is E[−2(n−1)](−(n−1)).
- E20 (error; the proof): §6 first full-phase equality v3 p.38; journal p.935. The displayed expression uses only f0. It equals the phase for f0, not for general f. Use the degree-k homogeneous part of G_b and V_k(G_b)=V_k((G_b)_k).
- E21 (misprint; nothing): Prop.6.2 v3 p.40; publication not separately checked. Replace A^N by A^{kd}; N=dn is reserved for the a-variable dimension.
- E22 (misprint; nothing): Lemma6.4 proof v3 p.41; publication not separately checked. The shrunken quantity is N_{γ,a−s,c+s}.
- E23 (gap; a stated result): Prop.2.5(3)/Prop.4.1 versus Lem.4.3, v3 pp.12,27–29; publication not separately checked. For the proof supplied, restrict to n≥3,(k,n)≠(3,3),(3,4), or supply proofs for omitted exceptional cases.
- E24 (gap; the proof): Spreading-out paragraph v3 p.13; publication p.906 not separately checked. Adjoin the chosen coordinates x_j as well, spread all data, and say Spec K lies over the generic point rather than equals it. Use a common lisse open for the finite collection of nonzero cohomology sheaves.
- E25 (misprint; nothing): Cor.2.9 proof v3 p.14; publication not separately checked. Here #π0(U) counts only the top-dimensional irreducible components of M.
- E26 (misprint; nothing): Definition of a polynomial lattice, v3 p.40; publication not separately checked. For an N×N lattice matrix use u∈F_q[T]^N.
- E27 (misprint; nothing): Def.2.3 v3 p.10; publication not separately checked. Define the matrix only for 0≤m≤kd and set A_m=A^{kd} for larger m.
- E28 (topology gap, with a counterexample to the compact-open interpretation): published pp.940–941, (7.1) and Lemma7.2, freshly reconciled. The explicit Fermat family below has an infinite-order winding class in the compact-open germ space, while its double-loop comparison target is simply connected. A stronger intended topology requires a new, explicit comparison proof.

The low-dimensional issue is substantive: a smooth cubic Fermat fibre in C³ has the homotopy type of a wedge of eight S²'s. The full double loop space therefore has components Z⁸ and infinite-dimensional H⁰; the source's Euler product contains a degree-zero singular factor. The intended main application already has n≫3. Use n≥4 for the connected full-loop Betti formula, and separately verify the original rational-homotopy prerequisites. This calculation and the mapping-space topology finding require independent mathematical review, like every other finding here.

## Ownership and routes

The pinned-library checks do not credit paper-level theorems from similar names. AddChar and finite orthogonality, LaurentSeries, the cohomological spectral-sequence carrier, abstract Goursat, GenLoop, loop homotopy shifts and Möbius inversion are present. Artin–Schreier sheaves, compact-support mapping-space complexes, nonarchimedean shrinking and Hilton/Sullivan computations were not found. Relevant reviewed audits and the exact opened declaration paths are in the JSON.

| Route | Items | Ownership decision |
|---|---:|---|
| source: ExponentialSumsAndCircleMethod | 10 | Polarization, coefficient-count identities, iterative shrinking and the uniform arithmetic minor-arc count are concrete function-field Weyl/counting interfaces inside ES.0–1. Import the nonarchimedean lattice theorem from the dedicated Part II below; do not reprove its general lattice API here. |
| source: FiniteFieldsAndCharacterSums | 6 | Artin–Schreier coefficient objects and cancellation, the one-dimensional Fourier input, and Lang–Weil all-extension dimension detection are reusable geometric character-sum inputs. FF.2 already calls for ℓ-adic trace functions; these items supply its precise sheaf interfaces. Import EDC/SF operations and existing weight-theorem owners rather than creating a private six-functor or Weil-conjectures theory. |
| source: FoundationsAndLibraryIntegration | 1 | Use the existing spectral-sequence carrier and LI.3's planned spectral-sequence theory. The exact finite-closed-filtration convergence interface is a supplier requirement, not a new page carrier. |
| part-ii: GeometricCircleMethodAndMappingSpaces | 72 | ES.0–5 develops numerical oscillatory/counting estimates, not compact-support complexes, configuration-space E1 pages, odd-page monodromy or mapping-space comparison. These are genuinely new layers in the same circle-method direction. |
| part-ii: FunctionFieldLatticesAndShrinking | 7 | GN.0 explicitly fixes real finite-dimensional lattices and GN.1 builds Euclidean convex geometry. F_q[T]-lattices in F_q((T^{-1})) and exact ultrametric successive-minima identities are not those carriers or the same proof. |
| part-ii: UniversalHypersurfaceMonodromy | 3 | LPV.5 explicitly proves odd-dimensional symplectic open image and does not assert even-dimensional universal orthogonal monodromy. Katz–Sarnak's full O/Sp theorem and the simultaneous-product argument add this missing direction. |
| part-ii: ConfigurationSpacesAndRationalLoops | 18 | Upstream AlgebraicTopology owns singular homology, products, duality, CW and ordinary homotopy; it does not provide configuration-representation Euler products, tame-fibre bouquets, Hilton decomposition or Sullivan rational H-space calculations. Extend it; do not source-route a replan of upstream stages. |

Generic compact-support operations, traces, weak Lefschetz and analytic comparison remain in SF.2/EDC.0,2,4,6. The generic finite-filtration theorem remains in LI.3. LPV.5 does not already prove universal orthogonal monodromy: it explicitly restricts its openness claim to the symplectic case. GN.0 explicitly uses real lattices; a Laurent-series polynomial lattice is not that same carrier. The upstream AlgebraicTopology roadmap is imported and extended, never re-planned.

No extra foundation is made merely to support this paper. The four Part II briefs give exact endpoints, hypotheses, imported owners, suggested modules and regression tests. FF.2's trace-function supplier includes the specific one-dimensional Fourier interface; it must use the shared derived/perverse infrastructure rather than a private category. No unproved result is to be packaged as an assumed typeclass.

## Proof spine and extraction coverage

The JSON's 136 item records are the authoritative statements. Every new definition/construction has API contracts and at least three structured tests; inherited short API/test lists still need expansion under G10. Every dependency resolves and the recorded spine is acyclic. It is not yet declaration-level closure.

1. Fixed-leading-vector mapping scheme → residue phase → Artin–Schreier complex → Fourier orthogonality (Lemma2.1).
2. Hankel rank → Padé approximation → exact-denominator open → translation cancellation → affine remainder fibration → CRT → repeated-root cancellation → trace fibre → ordered configurations → signed stratum cohomology (Lemmas2.4,3.1–3.11, Corollaries3.10,3.12).
3. Universal pair and adjacent primitives → full O/Sp monodromy and algebraic Goursat → a lift with only eigenvalue−1 → relative stratum formula → odd-page vanishing (Proposition4.1, Lemmas4.2–4.4).
4. Iterated finite differences and coefficient-field sign conjugacy → cohomological Weyl bound → all-extension point-count dimension detection → uniform arithmetic count → stalk support → corrected minor-arc stratification/range (Propositions5.5,5.7,5.8,2.6).
5. Polar forms and coefficient identities → ultrametric lattice shrinking → vanishing of short polar values → dimension of the polar-zero variety → uniform polynomial-box count (Lemma6.1, Proposition6.2, Lemma6.4).
6. Germ-constrained mapping space → conditional double-loop equivalence; configuration trace → signed Euler exponents → weighted-diagonal extraction; tame fibre → sphere bouquet → rational homotopy → connected double-loop Betti series → conditional Theorem7.7.

The source's sharp comparisons and weak endpoint, and its low-dimensional statements, are preserved as source targets/findings, not silently dropped. The conservative endpoints are explicitly labelled repairs. Diagram shifts and Tate twists use RΓ_c(A^r)=E[−2r](−r). All-extension uniformity and the p>k factorial restriction stay visible.

## Remaining work

- G1: Close the sharp minor-arc rounding bound and equality endpoint, or confirm a corrected theorem with an independent reviewer. Finite arithmetic checks do not prove geometric vanishing. Resume: Start with E1–E3, journal p.934. The conservative remainder argument is supplied explicitly.
- G2: Compact-open Lemma7.2 is obstructed. Specify a stronger topology and prove polynomial inclusion, uniform-family collar straightening and global comparison with the fixed-collar model. Resume: Use compactcounter and stronggermgate; do not try to prove the false compact-open equivalence. The explicit nonempty Fermat reference is supplied. General nonempty-reference construction remains an input.
- G3: Read Katz §8.2.5(2) completely and verify its middle-extension/nonconstant polynomial hypotheses and shifts. Resume: Author [16] is journal [15]; do not confuse it with Katz's Betti-number paper.
- G4: Read original Broughton1983, Hilton1955 and Sullivan1977 statements/proofs, including connectedness and finite-type restrictions. Resume: Use n≥4 for the full-loop endpoint; independently check the cubic n=3 counterexample. The new special Fermat/Milnor calculation suffices only for E28; it does not replace the general Broughton1983, Hilton1955 or Sullivan1977 suppliers.
- G5: Close nonarchimedean orthogonalization/duality and the original uniform polynomial-box proof, keeping constants independent of q. Resume: BV17 explicitly points to a Lee gap and Usher–Zhang repair; BV15 proof needs more than its statement.
- G6: Decompose original monodromy auxiliary inputs and algebraic-group quotient classification; do not substitute abstract Goursat for closed group-scheme Goursat. Resume: Katz–Sarnak11.4.9 was read through its proof; audit the subsidiary SGA7, Deligne–Illusie and Lie-group inputs.
- G7: Make E=Q_ℓ(μ_p) versus Q_ℓ descent, full-pair spreading and good characteristic choice explicit; verify remaining generic cohomology source statements. Resume: SF.2/EDC.0 are planned suppliers, not implemented theorems.
- G8: Read the underlying hyperplane-arrangement and Lang–Weil originals; CEF's trace proof was read but its imported cohomology presentation remains a source debt. Resume: Separate arrangement purity from general Weil bounds and all-extension counts from one-field counts.
- G9: All published text has now been read; finish image-level formula reconciliation and independent verification of inherited E1–E27. A full read does not certify every prior correction. Resume: Use matching-hash 56-page Annals PDF. E28 is freshly reconciled at pp.940–941; preserve the inherited checked/not-checked distinctions for other findings.
- G10: Expand the remaining elementary proof dependencies into declaration-level closure and exact APIs before any blueprint is certified complete; no Lean implementation or compilation was done. Inherited API outlines and short test lists also need expansion to the protocol’s structured three-test format; only the new definitions/constructions below meet that format in this continuation. Resume: Use the inventory, route briefs, explicit dependency spine and reproducible certificate. This is a paper extraction checkpoint, not a finished blueprint.

The prerequisite list is deliberately not a claim to have read every cited paper. In particular, the Broughton/Hilton/Sullivan originals, Katz's Fourier section, Lee/Usher–Zhang lattice foundations, and the complete degree-uniform box proof still need work. The finite certificate below tests arithmetic mistakes, not those geometric proofs.

## Continuation: the topology of the prescribed germ

Codex — codex-c83e7a, 23 September 2026. This continuation retains the previous extraction and its unresolved arithmetic and source obligations. The 56-page published text has now been read completely. This does not independently validate all 28 inherited findings or replace their formula-image checks. The substantive new work concerns E28, published pp.940–941, definition (7.1) and Lemma7.2. All findings remain unreviewed.

**With the subspace compact-open topology, the claimed equivalence is false.** The paper does not specify a topology, so this conclusion is deliberately limited to that interpretation. It is not a refutation of every stronger germ topology that might have been intended. Nor does it prove or refute the spectral-sequence construction.

Let k≥3,n≥3,d≥1, choose ζ^k=−1, and consider

\[
X=\{x_1^k+\cdots+x_n^k=1\},\quad
\overline X=\{x_1^k+\cdots+x_n^k=x_0^k\},\quad
P=[1:\zeta:0:\cdots:0:0].
\]

All three relevant varieties—X, its projective closure and its boundary—are smooth: simultaneous vanishing of the relevant derivatives would force every coordinate to vanish. The polynomial reference g(T)=(T^d,ζT^d,1,0,…) lies in X. In the z=1/T chart it is [1:ζ:z^d:0:…:z^d], so it meets (7.1) exactly with an allowed O(|z|) tangential term. Write Hco for the source's set of maps equipped with its subspace topology inside C(P¹(C),Xbar).

For 0<r≤1/4 define

\[
h(s,r)=\max(0,\min(1,(s-r)/r)),\qquad
\sigma(s,r)=\exp(2\pi i h(s,r)),\quad 0\le s\le1.
\]

The endpoint values of σ agree, so it is a loop. At fixed r its real lift h starts at0 and ends at1; its degree is1. At fixed s>0 it is identically1 whenever r<s/2, and the same eventual statement holds at s=0. Nevertheless σ(3r/2,r)=−1. These are pointwise eventual identities, with no uniform convergence in s.

Set

\[
r(T)=\frac1{4(1+|T|)},\qquad
a_s(T)=T^d\sigma(s,r(T)),\qquad
F_s(T)=(a_s(T),\zeta a_s(T),1,0,\ldots).
\]

The first two kth powers cancel; hence each finite value lies in X. For each fixed s, F_s agrees with g outside a compact set. It therefore has precisely the required germ, with no need to estimate a nonzero error term. Also F_0=F_1=g.

This is a continuous loop in Hco, including at the identified parameter endpoint. Indeed it is jointly continuous at every finite T. Near infinity, divide homogeneous coordinates by a_s(T): the chart coordinates are [1:ζ:a_s(T)^(−1):0:…:a_s(T)^(−1)]. Their varying entries have absolute value |T|^(−d), uniformly in s. Thus the family extends jointly to S¹×P¹, with all infinite values P. Compact-open currying gives continuity into the mapping space and then into its subspace Hco. No uniform estimate on the normalized coordinate a_s(T)^(−1)/T^(−d) follows from this projective estimate.

Suppose F bounded a continuous disk H:D²→Hco. Evaluation is jointly continuous because P¹ is locally compact. For each parameter u the point H(u,∞) is P in the chart x1≠0. Compactness of D² and the tube argument give a common R0 such that this chart contains H(u,T) for every u and |T|>R0. At every finite T these values lie in X, so the normal coordinate v=x0/x1 is nonzero. Choose a positive real R>R0. Then u↦v(H(u,R)) gives a disk in C*, whose boundary is

\[
R^{-d}\sigma(s,r(R))^{-1}.
\]

Its normalized circle loop has real lift −h(s,r(R)), with endpoint difference−1. It cannot extend over a disk. This contradiction proves that F is not nullhomotopic.

More precisely, evaluate an arbitrary based loop sufficiently far out, divide its normal coordinate by the basepoint value, normalize its absolute value, and take degree. A radial interval compares any two sufficiently large radii. A based homotopy supplies a common radius by the same compact-parameter argument. Concatenation adds degree. Thus there is a homomorphism endWind:π1(Hco,g)→Z with endWind([F])=−1; it is surjective and [F] has infinite order. The construction never assumes a uniform O-germ for the disk family.

For the comparison target, the JSON's `finitejoin`, `fermatjoin` and `fermatpi3` items supply a separate special-case proof spine. [Milnor, §9 Lemma9.2](https://djvu.online/file/kCFrJq27uCPRi) supplies the Fermat join model. Only selected primary-book OCR pages were read, not the full book; a direct file request returned403, so there is no acquired-file hash. The elementary positive-scaling map and the finite-CW cone-collapse argument are stated explicitly in those items. The generic CW and cellular-approximation inputs belong to upstream AlgebraicTopology Stages4 and8. Consequently π2(X)=π3(X)=0 for n≥5; the pinned loop-space shift gives π1(Ω²X)=0 and Ω²X is connected. The general Broughton/Hilton/Sullivan supplier debt remains open.

Taking k=3,d=2,n=40 meets the paper's main degree and dimension hypotheses: d=k−1 and n>2^k(k−1). Its Hco has an infinite-order fundamental-group element, whereas Ω²X is connected and simply connected. Even if Hco has other components, that prevents a homotopy equivalence. This is an actual obstruction to the compact-open statement, stronger than the previous missing-uniformity observation. It does not depend on the unclosed minor-arc estimate.

## What a corrected topology still needs

Within a fixed product chart (u,v) at P, where the boundary is v=0, fix ε>0 and require u=O(|z|), w=v/z^d=1+O(|z|), with u in a convex chart ball and |w−1|<1/2. The weighted supremum distances of u/|z| and (w−1)/|z| give a concrete topology on these controlled tails. For a cutoff χ that is1 on an inner disk and0 near |z|=ε, the formula

\[
u_t=(1-t\chi)u,\qquad
v_t=z^d\bigl(1+(1-t\chi)(w-1)\bigr)
\]

is a continuous homotopy in that model. It preserves the outer boundary, produces a standard inner tail at t=1, and creates no new zero: the normalized normal coordinate has real part greater than1/2. The weighted error bound does not increase. This proves a fixed-chart construction. It is not a strong deformation retraction onto all maps already standard on the inner disk: such a map may still change in the annulus.

A fixed boundary loop β:S¹→X with a chosen disk extension has an extension space modelled by the fibre of the based restriction Map_*(D²,X)→Map_*(S¹,X). The boundary cofibration gives homotopy lifting by adjunction; the based disk mapping space contracts. The corresponding fibre comparison gives Ω²X after choosing the reference extension/nullhomotopy. The JSON records the implementation contracts, rather than crediting an absent pinned restriction-fibration theorem.

These facts do not yet define the source's all-germs topology. A corrected endpoint must choose that topology, establish uniform control over compact parameter families, prove the polynomial-map inclusion continuous, and compare it with the fixed-collar model. In the Fermat example a model with the claimed Ω²X homotopy type cannot also be weakly equivalent to Hco. The original conjecture must not be silently rewritten with a different target.

## Library, routing and verification of this continuation

At the exact pins, the statements freshly read include Mathlib `ContinuousMap.continuous_of_continuous_uncurry` and its locally compact evaluation/uncurrying API; Tau Ceti `UnitAddCircle.fundamentalGroupMulEquiv`, its integer-monodromy characterization, `Circle.fundamentalGroupMulEquiv`, and `HomotopyGroup.piLoopSpaceMulEquiv`. These are imports. The older upstream circle fundamental-group target is superseded by the pinned implementation. No matching reviewed coverage entry exists for the upstream AlgebraicTopology/UniversalCovers stages; the stages were read directly and credited only as planned where appropriate.

The seven routes are retained. The application-specific germ, winding and collar work belongs to GeometricCircleMethodAndMappingSpaces; the special Fermat join calculation belongs to ConfigurationSpacesAndRationalLoops, importing generic topology. Suggested additional files are `TauCeti/NumberTheory/CircleMethod/Geometric/InfinityGerm.lean` and `TauCeti/Topology/RationalHomotopy/FermatFibre.lean`. Suggested planets are Prescribed infinity germ, End winding, Compact-open obstruction, Controlled collar straightening and Fermat fibre join model. Each new definition/construction has typed API contracts and at least three structured tests in the JSON. The inherited short API/test lists remain an explicit G10 debt, so this is still partial.

The exact regression script below checks clamp branches and lifts, tail bounds, nonuniform normalized behaviour, the main-range arithmetic and convex collar nonvanishing. Complex phase/Fermat cancellation checks are separately labelled floating-point diagnostics. Neither proves a homotopy theorem or supplies Lean elaboration. The prior extraction's arithmetic certificates remain prior evidence and were not rerun in this continuation.


```python
from fractions import Fraction as Q
from math import pi
from cmath import exp
checks=0
def check(p):
    global checks
    assert p
    checks+=1
def h(s,r):return max(Q(0),min(Q(1),(s-r)/r))
for denominator in range(4,205):
    r=Q(1,denominator)
    check(h(Q(0),r)==0);check(h(Q(1),r)==1)
    check(h(3*r/2,r)==Q(1,2))
    check(h(2*r,r)==1);check(h(r,r)==0)
    # Exact piecewise lift, including both breakpoints: degree is one.
    knots=[Q(0),r,3*r/2,2*r,Q(1)]
    check(sum(h(b,r)-h(a,r) for a,b in zip(knots,knots[1:]))==1)
    check(sum(-h(b,r)+h(a,r) for a,b in zip(knots,knots[1:]))==-1)
    for numerator in range(1,21):
        s=Q(numerator,20)
        rr=min(r,s/4)
        check(h(s,rr)==1)
for d in range(1,7):
    for radius in range(1,81):
        r=Q(1,4*(1+radius)); s=3*r/2
        check(h(s,r)==Q(1,2))
        # At the half-phase, normalized normal coordinate is -1 exactly;
        # unnormalized normal coordinate tends to zero at rate radius^-d.
        v=-Q(1,radius**d)
        check(abs(v)==Q(1,radius**d));check(abs(v/Q(1,radius**d)-1)==2)
for a in range(-9,10):
    delta=Q(a,20)
    for t in range(11):
        for cutoff in range(11):
            factor=1-Q(t,10)*Q(cutoff,10)
            w=1+factor*delta
            check(w>Q(1,2));check(abs(w-1)<=abs(delta))
check(Q(40,8)-3+1==3);check(2//(3-1)==1);check(40>8*2)
print('exact rational assertions:',checks)
floating=0;max_error=0.0
for k in range(3,8):
    zeta=exp(1j*pi/k)
    for d in range(1,5):
        for T in [0,0.25,0.5+0.1j,1j,-0.75]:
            r=1/(4*(1+abs(T)))
            for s in [0,r,1.5*r,2*r,0.9,1]:
                phase=exp(2j*pi*max(0,min(1,(s-r)/r)))
                a=T**d*phase
                error=abs(a**k+(zeta*a)**k)
                assert error<1e-12
                max_error=max(max_error,error);floating+=1
print('separate floating Fermat residual checks:',floating,'max error:',max_error)
```

Continuation regression result: **11,468 exact rational assertions; 600 separate floating checks**, maximum Fermat cancellation residual 7.425×10^−16. The paper-schema check, three-file intake check, exact-once routing, preservation and dependency checks pass. No Lean compilation.

## Verification

Passed: scripts/check_paper.py; swarm intake check-files (3 files, 0 problems); all 9 tests in tests.test_check_paper; exact-once routing/API/dependency checks. No Lean file was required or compiled. No formalisation is claimed.

The following Python standard-library certificate was executed successfully: 17,280 minor-arc bound cases, the odd-length Hankel rank test, endpoint test, degree12 Euler-product regressions, and 120 direct finite-field squarefree-polynomial character-sum cases. Copy the block to a scratch file and run python3; it is self-contained. This is reproducible finite evidence, not a replacement for proof.

```python
"""Finite regression checks, not a proof of geometric/cohomological claims."""
from fractions import Fraction as F
from itertools import product
from math import comb

def mobius(n):
    ans, p = 1, 2
    while p*p <= n:
        if n % p == 0:
            n //= p
            ans = -ans
            if n % p == 0:
                return 0
            while n % p == 0:
                n //= p
        p += 1
    return -ans if n > 1 else ans

def euler(r, n, N):
    value = -sum(mobius(a)*((-1)**n*N)**(r//a)
                 for a in range(1, r+1) if r % a == 0)
    assert value % r == 0
    return value // r

def multiply(a, b, limit):
    c = [0]*(limit+1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            if i+j <= limit:
                c[i+j] += x*y
    return c

def euler_product(n, N, q, limit):
    out = [1]+[0]*limit
    for r in range(1, limit+1):
        e = euler(r, n, N)
        factor = [0]*(limit+1)
        for a in range(limit//r+1):
            if e > 0:
                factor[a*r] = comb(e+a-1, a)*q**a
            elif a <= -e:
                factor[a*r] = comb(-e, a)*(-q)**a
        out = multiply(out, factor, limit)
    return out

def remainder(f, g, p):
    f = list(f)
    while f and f[-1] == 0:
        f.pop()
    while len(f) >= len(g):
        c, shift = f[-1], len(f)-len(g)
        for j, x in enumerate(g):
            f[j+shift] = (f[j+shift]-c*x) % p
        while f and f[-1] == 0:
            f.pop()
    return tuple(f)

def rank_mod(matrix, p):
    matrix = [list(r) for r in matrix]
    rank = 0
    for col in range(len(matrix[0])):
        pivot = next((i for i in range(rank, len(matrix)) if matrix[i][col] % p), None)
        if pivot is None:
            continue
        matrix[rank], matrix[pivot] = matrix[pivot], matrix[rank]
        inv = pow(matrix[rank][col], -1, p)
        matrix[rank] = [(v*inv) % p for v in matrix[rank]]
        for i in range(len(matrix)):
            if i != rank:
                c = matrix[i][col]
                matrix[i] = [(v-c*w) % p for v,w in zip(matrix[i], matrix[rank])]
        rank += 1
    return rank

matrix = [[int(i+j == 4) for j in range(5)] for i in range(5)]
assert rank_mod(matrix, 5) == 5  # L=9,m=4,b5=1: missed last stratum
checks = 0
for k in range(3, 10):
    K0 = k-1
    for d in range(K0, 4*K0+1):
        for excess in (1, 2, 2**k, 3*2**k+1):
            n = 2**k*K0+excess
            delta = F(n, 2**k)-K0
            safe = 2*d*n+4*K0-4*(d//K0)*delta
            for m in range(d, (k*d+1)//2):
                q, r = divmod(m, K0)
                bound = 2*d*n-F(n, 2**(k-2))*q+4*(m+1)
                assert bound == 2*d*n-4*q*delta+4*(r+1)
                assert bound <= safe
                checks += 1
assert 2*4*24-F(24,2)*(5//2)+4*(5+1) == 192
assert 2*4*24+4-4*(4//2)*(F(24,8)-2) == 188
assert (2//2)*(F(24,8)-2) == 1  # source equality endpoint excludes i=0
print('minor-arc bound cases:', checks)

for n in (4, 5):
    for N in range(5):
        assert euler_product(n,N,1,12) == [1,(-1)**(n-1)*N]+[0]*11
        for r in range(1, 13):
            assert (-1)**(r*(n-2)-1)*euler(r,n,N) >= 0

counts = 0
for p in (2,3,5):
    irreducibles = []
    max_degree = 4
    for m in range(1, max_degree+1):
        for coefficients in product(range(p), repeat=m):
            f = coefficients+(1,)
            if all(remainder(f,g,p) for g in irreducibles if 2*(len(g)-1) <= m):
                irreducibles.append(f)
    for m in range(max_degree+1):
        omega = []
        for coefficients in product(range(p), repeat=m):
            f = coefficients+(1,)
            factors = [g for g in irreducibles if len(g) <= len(f) and not remainder(f,g,p)]
            # A monic polynomial is squarefree iff degrees of its distinct factors sum to m.
            if sum(len(g)-1 for g in factors) == m:
                omega.append(len(factors))
        for n in (4,5):
            for N in range(4):
                direct = sum(N**w*(-1)**((n-1)*(m-w)) for w in omega)
                predicted = (-1)**((n-1)*m)*euler_product(n,N,p,max_degree)[m]
                assert direct == predicted, (p,m,n,N,direct,predicted)
                counts += 1
print('squarefree-polynomial character-sum cases:', counts)
print('PASS: Hankel rank, floor remainder, strict endpoint, signed Euler products and finite-field character sums')
```
