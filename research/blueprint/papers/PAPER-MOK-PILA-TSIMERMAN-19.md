# Mok–Pila–Tsimerman: Ax-Schanuel for Shimura varieties

Partial checkpoint by Codex, session `codex-c83e7a`, for issue #1137. There are 113 items: 5 pinned library imports, 12 planned imports and 96 missing items. The 43 definitions/constructions have 129 structured API entries and 129 proposed mathematical acceptance tests. Four prerequisites remain deliberately unrouted. This is a research plan, not a formalization or a claim of complete proof closure.

## Source and extent

The [publisher record](https://annals.math.princeton.edu/2019/189-3/p07) identifies the article as *Annals of Mathematics* 189 (2019), 945–978, DOI 10.4007/annals.2019.189.3.7. I read all 34 published pages, including references, from the [public published PDF](https://bimsa.net/doc/publication/2564.pdf). Its SHA-256 is `1eab0797914752bdc91b4f46692f0a5716be2cc9e0d2dd96b478f1cdb762a0ab`. Selected printed pages 959, 965, 969, 971 and 974 were checked as images. The [arXiv](https://arxiv.org/abs/1711.02189) binary is v3, 20 September 2018; only its p. 23 was compared for Theorem 11.3. Published metadata and revision date match the publisher; no complete arXiv/published textual equivalence is claimed.

Selected [Scanlon](https://math.berkeley.edu/~scanlon/papers/adecm_dec17.pdf) manuscript pp. 3–5 and 7–14 were read for the actual Seidenberg, jet, algebraization and finite-orbit contracts. [Klingler–Ullmo–Yafaev](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf), published pp. 349–351, was read for the full curve-volume Lemma 5.8 proof and the start of the height-counting deduction. The André scan was acquired but its required theorem was not proof-read. Binary provenance, exact read extents, repository blob IDs and pinned-signature hashes are in the JSON. Acquisition ran on 21 September; preparation continued on 22 September 2026.

## Mathematical outputs

The basic theorem concerns a pure arithmetic uniformization q:Omega→X, with X smooth after an effective torsion-free finite-level reduction. Let W be the restriction of an irreducible algebraic subset of the compact-dual product and U an irreducible analytic component of W∩graph(q). If dim W < dim U + dim X, its X-projection lies in a proper **weakly special** subvariety. The two-sorted consequence is dim Y_Zar + dim q(Y)_Zar ≥ dim Y + dim Y_WS. The mixed exponential case is contextual, not a pure Shimura instance.

The jet theorem replaces graph(q) by the graph of its jet map on nondegenerate r-variable jets, with order k≥2 and r≥n=dim X. The excess threshold becomes dim U+dim G. Nondegenerate means the *formal first coefficient* is surjective. It says nothing by itself about the derivative of a parameterized family of jets. The extracted corollaries identify the modular derivative-field transcendence degree as dim G in translation coordinates and give the lower bound dim G+dim V along an analytic V, taking ambient derivatives before restriction.

The differential theorem uses finitely many commuting derivations, their actual constant field, a specified embedding of a finite definition field, and a compatible uniformized tuple (z,x,y). Under the equal/joint positive-rank conditions and absence of a proper weakly special exception, trdeg_C C(z,x,y) ≥ rank(z)+dim G. The product version has exception in X^ell, including cross-factor relations. Its finite-equation interface remains subject to the compatibility issue below.

## Ownership

| Route | Owner and reason |
|---|---|
| Existing source | ShimuraData D2–D3: domains, compact duals and homogeneous variations on the existing Hodge/local-system carriers. |
| Existing source | ShimuraVarieties V0–V2 and V7: effective arithmetic quotients, algebraization and complex conjugation. |
| Existing source | LogicAndDefinabilityInNumberTheory LD.6: o-minimal structures, definable algebraization and counting. Its application assembly explicitly needs an independent functional-transcendence supplier. |
| Existing source | AlgebraicModuliForArithmeticGeometry R09.1–R09.2: projective Hilbert schemes and universal flat families. |
| Existing source | SchemeAndStackFoundations SF.0/SF.4: shared finite jets, infinitesimal discs, prolongation and relative weighted Proj, importing existing representability suppliers. |
| Existing source | ComplexComparisonPartII C0/C4: analytic spaces, coherent ideals, proper analytic images/dimension interfaces and ordinary Chow; definable nonproper algebraization is distinct. |
| Proposed Part II | ShimuraDataPartII: finite-jet stabilizers, local rigidity, weakly special factor geometry, invariant volumes and their quantitative adapters. |
| Proposed Part II | LogicAndDefinabilityInNumberTheoryPartII: the independent basic/jet/differential Ax-Schanuel proof, Hilbert incidence, generalized Schwarzians and differential uniformization. |

The two new briefs specify theorem hypotheses, construction sequence, imports, tests and suggested later Lean files. The entire portfolio was screened for duplicate directions; the detailed supplier documents and reviewed audits were checked as recorded in the JSON. Upstream UniversalCovers and ConformalMapping were read in full; neither is re-planned. A scalar conformal-map API is not a supplier of singular higher-dimensional analytic geometry. General Hodge monodromy is not declared built from fibrewise Hodge structures. The four unrouted items are `monodromy-normality`, `weakly-special-monodromy`, `proper-monodromy-index` and `constructible-orbit-quotient`; their generic ownership needs a finer check.

## Proof structure and source obligations

The basic proof first algebraizes the descended large-intersection locus of a proper Hilbert family. Very general arithmetic stabilizers have a connected rational Zariski closure Theta. Monodromy makes Theta normal; normal-factor induction makes it trivial in a minimal counterexample. Volume growth and bounded fundamental-set volumes create polynomially many bounded-height translates. The required counting refinement gives one semialgebraic curve with two arithmetic points. Intersection/union induction yields an infinite stabilizer, contradicting trivial connected closure.

The jet proof needs its own G-saturated graph algebraization, orbit-dimension boundary argument, fixed-order Hilbert locus and an induction handling vertical directions. The statement “same proof” is not used to hide the base-rank adapter. The differential proof uses Seidenberg and the jet theorem. Section 12.4 is retained as an *alternative* implication; its edges do not feed back into the jet theorem. The selected graph has 113 nodes and 209 edges and is acyclic.

The exact original proofs still needed include André/Deligne monodromy, Hwang–To in the needed dimension, Mumford metric comparison, the height estimates and the precise Pila–Wilkie family/block refinement. KUY Lemma 5.8 bounds volumes of algebraic **curves** by degree; the main proof needs an additional uniformly definable higher-dimensional argument using rank strata, finite coordinate fibres, metric wedge products and change of variables. Its complex dimension d must not be replaced by real dimension 2d. Counting outside the algebraic part alone does not establish a single bounded-complexity curve containing two integer points.

The finite-order orbit alternative from Scanlon separates constant-group orbits using prolongations and model-theoretic compactness. It brings explicit differential-closure, quantifier-elimination, elimination-of-imaginaries and Kolchin-topology proof leaves; none is passed off as a pinned theorem. Generic constructible quotients have invariant strata and regular maps on each stratum, not an unqualified global regular orbit space.

## Formula and interface checks

These are worker inferences from the inspected text, **not acquired author errata**. They require independent review.

1. Freeness of the action on order-two nondegenerate jets requires an effective G. The centre of Sp acts trivially. The grading in Lemma 7.1 gives B=K_C N-, while its proof prints N+. For one-variable Taylor coordinates (z,a,b,c) with denominators 2 and 6, the normalized cubic coefficient is c/(6a)−b²/(4a²), namely one sixth of the usual Schwarzian. The extraction preserves this factor.
2. Corollary 9.3's proof prints trdeg_C C(z_1,…,z_n)=dim G, which is inconsistent in general. The intended field in that line is the modular derivative field. A finite “C-basis of modular functions” is read as finite function-field generators; C(X) is not usually finite-dimensional as a C-vector space. Closedness of W_k and the regular/birational inverse used to recover higher derivatives need actual proofs; freeness alone is insufficient.
3. The weighted jet compactification is interpreted as relative weighted Proj. The all-zero homogeneous point must be removed from a quotient presentation. Jet order k and incidence threshold d are distinct; descent on the first jet factor uses J_k q. Corollary 3.2 prints a closedness hypothesis even though later applications use constructible relations: the stronger intended descent statement needs its own finite analytic-stratification proof.
4. Lemma 11.1 argues from strict stabilizer containment to a drop in dimension. A finite component group can shrink without a dimension drop. The packet records the missing justification and the possible Scanlon finite-order replacement, without certifying m=dim G.
5. Theorem 11.3 needs an exact meaning for “v restricts to u.” A reading that means only zeroth-order equality is insufficient. Work locally in a coordinate of a torsion-free modular curve with q′(t)≠0. Set w(t)=2t, u(t)=q(t), and v(t)=J_r q(id_r(t)), for r≥3. The pair relation holds using the constant group element z↦z/2; v lies on the identity constant-group leaf and evaluates to u. But every tuple L(w,g,r) satisfies du=v_1 dw. Here that would say q′(t)=2q′(t). The printed published and arXiv versions both have this interface. Full jet pullback/chain-rule compatibility could exclude the example, but proving a repaired general characterization remains open. The packet does not claim the Ax-Schanuel theorem itself is refuted.
6. In section 12.4, an invertible formal coefficient matrix does not produce a locally invertible parameter map z(t). The base can be constant while coefficients vary. Recover ambient derivatives algebraically by inverting the formal coefficient matrix and use the stated algebraic-versus-analytic fibre-dimension inequality. Keep rank(z) separate from dim U. The r>n reduction requires an additional full-minor/reparametrization argument. The product exception belongs to X^ell; an exceptional diagonal may project dominantly to every factor.

## Validation and continuation

Repository paper validation and deliverable-scope validation are run before submission. Custom checks validate every local dependency, structured API role, use record and test count; the selected DAG is acyclic and each routed missing item is assigned once. Temporarily changing status to complete produces exactly four missing-route errors, confirming that the checkpoint does not masquerade as complete.

Executed rational regressions check Schwarzian normalization, total-degree jet dimensions, the truncated addition map, nonholonomic coefficient recovery, weighted coordinate changes, the chain-rule negative example and the ineffective central element. These are concrete sanity checks, distinct from the 129 proposed future mathematical unit tests. They neither prove the source theorems nor elaborate Lean. No Lean file is a deliverable of this paper job and none was compiled.

Resume with the four unrouted prerequisites and G1–G6 in the JSON. Preserve these item IDs. Obtain and read the original proof inputs; resolve the section 11.3 interface before using its equations as a theorem; close the two quantitative/vertical-rank adapters; and then refine status/routing against any newly accepted supplier packets. The source/dependency graph should remain acyclic and the general objects should remain with their named owners.

## Continuation: Theorem 11.3 repaired (Claude Code, cc-fb70e5, 22 September 2026)

The printed hypothesis "v restricts to u" is used in the proof only as equality of zeroth orders. The w=2t example shows this is insufficient: every L(w,g,r) satisfies du=v₁dw, and that example violates it.

The item `triple-characterization-obligation` now states the repaired theorem, with the extra hypothesis (iv): the first-order chain rule du=v₁·dw, taken in N⁺-invariant coordinates. The proof is short:
- by the leaf structure of W, v=J_r(q∘g′)(id_r(z)) for one g′;
- (iii) gives du=D(q∘g′)(z)dz, and (iv) gives du=D(q∘g′)(z)dw, so dz=dw because D(q∘g′) is invertible away from elliptic points;
- so z=w+c is translation by τ_c∈N⁺, and (w,u,v)=L(w,g′τ_c,r).

Condition (iv) is the algebraic differential equation Dx=y₁·Dz. The notion of a uniformized tuple in Theorem 12.1 now includes it. The source-level issue is errata E5.
