# PAPER-WITASZEK-22 — Stein factorization and surface Euler correction

Status: **partial checkpoint**. Codex `codex-c83e7a`, 23 September 2026. Refs [#1101](https://github.com/CBirkbeck/tauceti-explorer/issues/1101). Continues [PR2012](https://github.com/CBirkbeck/tauceti-explorer/pull/2012), retaining the earlier codex-a71f92 and cc-fb70e5 work without reviewing it.

195 items: 21 pinned-library imports, 9 existing-stage imports and 165 missing items, each routed once. There are 40 definitions/constructions with 120 API contracts and 120 proposed tests, 371 internal prerequisite edges and 19 external stage edges. The internal graph is acyclic. Seven routes and 14 source findings are recorded. These counts do not assert transitive closure or formalization.

## What this continuation establishes

The old Stein node stated an algebraic-space theorem while citing the scheme tag03H2. Its source is now [Stacks0A1C](https://stacks.math.columbia.edu/tag/0A1C), with [0A1B](https://stacks.math.columbia.edu/tag/0A1B) supplying the locally Noetherian case. The scheme specializations remain03H2/03H0.

For proper f:X→Y, form Y′=Spec_Y(f_*O_X). The first map h is proper and surjective with canonical h_*O_X=O_Y′; the second is integral. Formation commutes with **flat** base change. Over a locally Noetherian target, coherent proper pushforward makes the second map finite. To prove the first map has geometrically connected fibres, a hypothetical clopen decomposition gives compatible nontrivial idempotents on every infinitesimal neighbourhood. Formal functions puts their limit in a completed strictly local ring. Its locality rules out such an idempotent. The fibre need not be affine: the existing connected-spectrum criterion alone cannot prove this step.

The general-base theorem uses Noetherian approximation and descent of clopen decompositions. Those transitive limit inputs remain open. The finite conclusion is restricted to the Noetherian case; the general interface promises integrality.

The normal-target specialization keeps all hypotheses: Y normal integral, X reduced, all generic points of X dominating Y, and generic global functions equal to κ(Y). The Stein algebra embeds integrally in this fraction field and equals the normal base algebra. Consequently a proper birational map of integral schemes to a normal target preserves functions. Cusp normalization, a closed-point square-zero thickening and a disjoint vertical component expose the three respective guards.

The finite locally free projection formula then identifies every line-bundle section space under a contraction, canonically and compatibly with products. If a surjective map pulls back all sections isomorphically, generation descends: any common zero downstairs remains a common zero after the residue-field extension upstairs. No flatness of the resolution is needed.

## The surface calculation, including its differential

For the given projective resolution π:T→S of a normal projective integral surface, proper coherent pushforward and regularity in codimension one give a coherent R¹π_*O_T with finite support. Fibres have dimension at most one. [Stacks02V7](https://stacks.math.columbia.edu/tag/02V7) deduces R^qπ_*O_T=0 for q≥2 from formal functions and the Noetherian **Zariski** dimension bound. Resolution existence and its normality/dimension inputs remain explicit suppliers.

Let Q_m=R¹π_*O_T⊗L^m, and let ℓ=dim H⁰(S,Q_m), independent of m. More generally this dimension is the sum of local lengths weighted by residue-field degrees. A local frame preserves each length; no canonical trivialization of Q_m is asserted. The finite-support sheaf has no positive cohomology. With the canonical H⁰ comparison, Leray gives

0 → H¹(S,L^m) → H¹(T,π*L^m) → H⁰(S,Q_m) → H²(S,L^m) → H²(T,π*L^m) → 0.

The middle connecting map is d₂. Writing r_m for its rank,

h¹(T,π*L^m)=h¹(S,L^m)+ℓ−r_m, and h²(T,π*L^m)=h²(S,L^m)−r_m.

Thus **χ(S,L^m)−χ(T,π*L^m)=ℓ**. Subtract the equality at m=0 to obtain the constant correction used below. Neither vanishing of R¹π_*O_T nor vanishing of d₂ is needed. The existing Tau Ceti `AlgebraicGeometry.Scheme.Modules.eulerCharBelow` supplies the carrier with cutoff3, after proving finite-dimensionality and higher vanishing. Cutoff2 omits H²; unconstrained `finrank` is not a substitute for finiteness.

## Retained paper mechanism and surface application

The algebraic mechanism starts with **direct-limit multiplicative perfection**. Over mixed characteristic the p-power map need not preserve addition; the construction is a commutative monoid, and perfected line-bundle sections form sheaves of sets. The two halves of Lemma3.4 are separated: integral finite generation clears one common denominator for surjectivity, while kernel p-torsion and nilpotence, combined with binomial divisibility, yield eventual equality for injectivity.

This produces a rational-fiber pullback square for perfected sections. Separately, Theorem1.7 constructs a **2-pullback of Picard groupoids after inverting p**. It is decomposed into characteristic-p, thickening, reduction and conductor-induction steps. Isomorphisms and their automorphisms are essential: a statement only about Picard groups would lose the compatibility needed to glue sections and polarizations.

The pushout argument then uses arithmetic fiber-product rings, étale descent and affine–contraction–affine factorization. Definition2.17's “topological pushout” is deliberately weaker than a categorical pushout. A geometric pushout adds the ring-sheaf fiber product and has a genuine universal property. Geometric pushouts need not be Noetherian; Lemma2.22 supplies only a finite-type **topological** approximation.

The resulting dependencies divide into two applications:

- Finite relations and proper group actions: integral-relative quotients, finite pinching, lower-dimensional relation induction and conductor descent yield Theorems1.4 and1.5. The relation is set-theoretic on geometric points and can have nilpotents; it is not assumed to be a closed immersion into the product. The action is proper; no general GIT assertion is inferred.
- Positivity: Picard/section descent and pushouts give the separate semiample and EWM gluing theorems, reduction plus rational-fiber detection, mixed-characteristic Keel, and the surface/threefold applications.

Theorem6.1 proves the semiample criterion over an excellent base. Its EWM analogue additionally requires a base of finite type over a mixed-characteristic Dedekind domain. The final klt threefold corollary keeps absolute dimension3, projectivity and surjectivity over the Dedekind spectrum, perfect closed residue fields, and both nef-and-big assumptions. Locally finite positive-characteristic closed residue fields give semiampleness. The JSON records the plt corollary and relative surface proposition separately.


## Surface Riemann–Roch and the repaired application

PR2012 gave the fibration proof for nef numerical and Iitaka dimensions one. That decomposition first passes to a smooth projective resolution before taking moving and fixed divisors. This ensures these divisors are Cartier and supplies an explicit semiampleness descent step. The stronger usable input is two independent sections of one positive power.

Let S be a normal projective integral surface over an algebraically closed field and π:T→S a projective resolution. Normality gives π_*O_T=O_S. By projection formula, all section spaces of L^m and π*L^m agree. Generation descends because π is surjective: a common zero downstairs would remain a common zero upstairs.

The sheaf R¹π_*O_T has finite support and higher direct images vanish. Tensoring this sheaf by L^m preserves its length. Leray therefore gives

χ(S,L^m)−χ(T,π*L^m)=χ(S,O_S)−χ(T,O_T).

Smooth surface Riemann–Roch, with Cartier–Weil projection, then yields

χ(S,L^m)=χ(S,O_S)+(m²L²−m L·K_S)/2.

This cancellation needs no rational-singularity hypothesis and no assumption that K_S is Cartier. In the application aL≡K_S+Δ+A, with Δ effective and A ample. Since L is nef with ν(L)=1, L²=0 and

−L·K_S=L·Δ+L·A>0.

The last strict inequality uses Hodge index. Thus χ grows with positive slope c. The bounded H² from Keel5.4 gives h⁰(L^m)≥χ(O_S)+cm−C, so some power has at least two independent sections. The packet separates the resolution Euler correction, normal Cartier formula, positive slope and elementary cohomology inequality.

On T write |mL_T|=|M|+F. Nefness gives L_T·M=L_T·F=0, followed by M²=M·F=F²=0. Two moving members with no common component and intersection zero are disjoint, so |M| is generated. Its nonconstant image is a curve; Stein factorization gives M=f*A with A ample on the base. The equality M·F=0 makes F vertical.

For a connected fibre with components C_i and multiplicities m_i, write Q=(C_i·C_j). Off-diagonal entries are nonnegative, Qm=0, and the positive-intersection graph is connected. The exact identity

xᵀQx=−Σ_{i<j}q_ij m_i m_j(x_i/m_i−x_j/m_j)²

proves negative semidefiniteness and identifies the kernel with Q·m. Group F by fibres. The sum of their nonpositive squares is zero, so each piece is a nonnegative rational multiple of the whole fibre. Clearing denominators shows a positive power of L_T is pulled back from a positive-degree divisor on the base. It is semiample, and semiampleness descends to S.

`gap-surface-nef-repair` is resolved at this application level. The exact general resolution, Hodge index, intersection projection, cohomological-dimension, duality and dévissage inputs remain under the named foundation gaps. This is an explicit conditional proof plan, not a claim that these prerequisites are formalized or transitively closed.

The retained `surface-h2-bound` supplier states the actual line-bundle theorem in Keel5.4. The old arbitrary-coherent-F top-cohomology statement was an unverified strengthening. Keel’s auxiliary coherent-sheaf assertion instead concerns sections of F tensored with negative nef powers.


## Source acquisition and reading boundaries

PR2012 acquired and read all 51 pages of the [published paper](https://par.nsf.gov/servlets/purl/10429755), printed655–705, including proofs and references. Its SHA-256 is `d71bd9254d80145a84f13059f18d37d6f777008900ab907b14d195bb61414ea0`. This continuation freshly read printed661–664 and700–701. It does not claim a second complete reading. The eight inspected publication images and Keel99 printed279–282 reading remain historical PR2012 evidence.

The [arXivv2](https://arxiv.org/pdf/2002.11915v2) has 46 pages, SHA-256 `5ab792128995b0735311a5284620e5d14549ecc6c5be08595c5d8cdffedda842`. The earlier worker's full reading and PR2012's pp1–12/targeted comparisons remain separately attributed. Exhaustive version collation is still open. Automated heading extraction must not turn wrapped BCHM3.9.1 citations into Witaszek declarations.

Fresh statements and displayed proofs were read in 20 archived Stacks pages: 0A18,0A1B,0A1C,08B1,08AR,01E7,01E8,0AY8,03H0,03H2,0E7D,02V7,08AZ,073K,0A0X,0AYI,08AV,08AY,02OD and02UZ. Their hashes and links are in `steinContinuation.sources`. This includes the Noetherian formal-functions filtration argument and general proper approximation. Their cited transitive proofs, omitted details, Chow/dévissage and limit engines have not all been closed.

## Source findings awaiting independent review

E1–E11 are retained from PR2012 with their original bounded correction searches. They concern Witaszek or Keel. E12–E14 are newly observed typing/index errors in **external Stacks prerequisite proofs**, not errors attributed to Witaszek. All remain unreviewed; the earlier D1–D9 records are preserved.

**E1 — misprint; Published p.662, EWM definition; arXivv2 p.8.** Reverse the inequality: dim f(V)<dim V. Quantify over all integral closed subvarieties, not just curves. An image cannot have larger dimension. A constant map contracts a positive-dimensional variety; the printed inequality never detects it. Image inspected. BMPSTWW Remark2.49 addresses a different curve-only-definition issue.

**E2 — error; Published p.662, Lemma2.1; arXivv2 p.8.** Require the finite map of integral proper schemes to be surjective. A closed point Spec k→P¹ and O_P¹: the pullback is big in dimension zero, while O_P¹ is not big. The degree/intersection calculation requires equal dimension and dominance. The use in Proposition5.2 chooses a component surjecting onto V.

**E3 — gap; Published p.657, informal EWM extension after Corollary1.3; compare Corollary6.7 pp.699–700.** Retain perfect closed residue fields in this informal extension, as explicitly assumed in Corollary6.7. Corollary1.3 itself assumes locally finite fields, hence perfectness automatically; no defect is asserted in that formal corollary. Its broader following prose omits the guard used in the stated theorem/proof. No counterexample to an eventual stronger theorem is claimed.

**E4 — gap; Published p.701, Lemma6.8.** State that the conductor on the generic fibre is empty or supported at at most one geometric point. For a normal divisor the conductor subscheme is empty. The degree bound supplies at most one point, not nonemptiness. Under conventions allowing the empty scheme as connected and zero-dimensional this is a clarification only; the downstream proof must not infer existence of a point. Keel99 p.280 explicitly allows emptiness.

**E5 — error; Keel99 Lemma5.2, printed p.281; repeated as a paraphrase in Witaszek22 published p.701.** Use h⁰(L⊗m)≥2 for some m>0, with nef numerical dimension one on a normal projective surface over an algebraically closed field. Growing h⁰ in the application supplies this stronger hypothesis. Take an elliptic curve E/C and a nontorsion M in Pic⁰(E). On P_E(O⊕M), L=O(1) is nef, L²=0 and L·fibre=1. For every m>0, H⁰(L^m)=⊕_{i=0}^m H⁰(E,M^i) has dimension1. Its unique section vanishes along a section of the ruled surface, so no positive power is generated. The source assumption gives κ=0 here. The resolution/moving-pencil proof and the positive Euler slope below repair Witaszek’s actual application.

**E6 — error; Published p.664, Section2.1, characteristic-zero field-extension parenthesis.** For finite separable K/L and an algebraic closure Ω containing K, use K⊗_L Ω≅Ω^[K:L]. Splitting over K itself needs an additional normality/splitting hypothesis; also reverse the printed degree notation. For L=Q and K=Q(a), a³=2 real, K⊗_Q K≅K[T]/(T³−2)≅K×K[T]/(T²+aT+a²). The quadratic factor has negative discriminant −3a² in this real field, so the algebra is not K³. The needed conclusion, a characteristic-zero purely inseparable field extension is trivial, follows directly from pinned Mathlib separability and bijectivity instead.

**E7 — misprint; Published p.673, Lemma2.26 proof.** Compose as q=p∘g⁻¹ on underlying topological spaces. The diagram has p:Y→X and g:Y→Y′, with |X|=|X′|. The corrected composition has source Y′ and target X′; the printed order does not type-check. The preceding sentence and diagram give the intended construction.

**E8 — misprint; Published p.677, Lemma3.4 proof, divisibility range.** Require 1≤i≤p^k. The binomial expansion already sums over positive i. At i=0, p^i binomial(p^k,i)=1, which is not divisible by p^n for n>0. For positive i, the identity i binomial(p^k,i)=p^k binomial(p^k−1,i−1) gives the explicit valid bound recorded in binomial-divisibility.

**E9 — misprint; Published p.679, end of Step2 in Theorem1.7 proof.** The last sentence of Step2 should refer to Step2. This paragraph proves the infinitesimal-thickening case. The following Step3 invokes precisely that Step2 reduction.

**E10 — misprint; Published p.697, Lemma6.3 proof.** Supply the target Z for the induced action map m_Z:Z×G→Z. The following commutative diagram shows the target and the action comparison uses this typed morphism.

**E11 — misprint; Published p.703 bibliography; compare arXivv2 p.45 and Fujita citation on published p.694.** Disambiguate Sean Keel, Polarized pushouts, from Dennis Keeler, Ample filters. Theorem1.5 used for Fujita is Keeler’s. The published bibliography assigns the same key to two different authors and articles. The v2 bibliography already uses Kee03a for Keel and Kee03b for Keeler.

E3 narrows the earlier diagnosis: formal Corollary1.3 is correctly guarded by locally finite residues, which are perfect. The issue is the following informal extension only. E4 is convention-sensitive; its correction explicitly permits the empty conductor and asserts no counterexample under conventions that already include the empty scheme. D6/D7 remain source-version and dependency investigations; D8 is a library-type warning, not a paper error.

The author publication entry, journal article page, arXiv history and targeted correction searches were checked on22September2026. No matching correction for E1–E10 was located within that scope. This does not prove absence of a correction. E11 records the earlier correct v2 bibliography.


**E12 — external prerequisite misprints, [Stacks08AR](https://stacks.math.columbia.edu/tag/08AR).** The projective embedding should be i′=(i,π):Z′→P^n_A×_A Z=P^n_Z. In the last full-support argument, G=π_*L^d lives on Z. Use the point π∘z̄ of Z and the adjunction π*π_*L^d→L^d, with the target stalk of L^d. The printed g′:Z′→Spec A has the wrong type there. These are local typing repairs.

**E13 — external prerequisite index shift, [Stacks08AY](https://stacks.math.columbia.edu/tag/08AY), final bound in part(3).** The proof obtains m≥c₃(n)+c₁+n and uses k=n+m. A sufficient absolute-index threshold is therefore c₂(n)=c₃(n)+c₁+2n. The displayed smaller threshold is not justified by that estimate; this does not assert it always fails. Enlarging an existential constant leaves the theorem and its application intact.

**E14 — external prerequisite sheaf subscript, [Stacks08B1](https://stacks.math.columbia.edu/tag/08B1), final displayed equality.** Replace i_n,*F by i_n,*F_n because the closed immersion pushes forward a sheaf on X_n. The analogous scheme proof02OD already has the corrected expression and a2022 correction comment. The space page inspected on23September2026 still has the typo.

Current pages and comments were inspected, and targeted tag/typo searches found no further matching corrections in the returned results. This is a bounded search. No external source comment was posted.

## Ownership and existing libraries

The new nodes reuse the current owners: SF.1 owns the algebraic-space Stein supplier; SF.0 owns section-generation descent; SF.4 owns resolution geometry; SF.5 owns the surface Euler/intersection application. The added source route SF.2 owns Zariski vanishing, the proper-fibre bound, finite-support length and cohomology. The two existing continuation proposals are retained unchanged.

Formal functions is imported from **AdicSpacesPartII:F0**, finite locally free projection/coherent cohomology from **StableReduction layer2**, and ordinary Leray from **DiamondsAndVStacks:D0**. The algebraic-space formal-functions node adapts the same engine to spaces; it does not infer that an étale cover of the target makes the source a scheme. Benoist19/173 and185 already request the same Stein/cohomology suppliers. The refreshed Gille–Parimala/119 is another finite-scheme consumer; it does not require a competing owner.

The current ownership snapshot is `277594a65a53ae5f7530539524add19c453b4e19` with 531 input hashes. Fresh relevant stage descriptions, SF foundation audits and SR2 audits were checked; no direct reviewed F0/D0 record was located. Earlier full upstream-roadmap readings remain recorded under the prior ownership audit. The changed and newly added paper inputs were screened by summaries, routes and relevant item statements, not claimed as full-paper readings.

Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` supply the integrally closed fraction criterion, local-ring unit dichotomy, unit-idempotent lemma, connected-spectrum criteria, truncated Euler carrier, Artin–Rees, controlled Artin–Rees lifts and locality of adic completion. Eleven exact declaration records include source excerpts and hashes. These algebraic facts are **already built**; the geometric formal-functions comparison remains a supplier request. Both algebraic-geometry trees and relevant ring/cohomology files were searched. A full Lazard flat-module colimit theorem was not located in that scope; its proof and cohomology-colimit adapter remain explicit requests.

## Verification and open work

The paper checker, three-file intake check and structural audit pass. The structural audit checks unique IDs, every missing item routed once, resolved acyclic recorded edges, definition APIs/tests, 531 input hashes and 11 declaration hashes. The 120 mathematical tests are plans, not compiled examples.

Fresh exact arithmetic/linear-algebra diagnostics pass **11,236 cases**, including local idempotents, cusp guards, the formal-functions index shift, nonzero Leray ranks and cancellation, and length invariance. The executable certificate is embedded in JSON. PR2012's **55,157** cases remain historical evidence and were **not rerun here**. Finite calculations do not establish the geometric theorems. No Lean file was required, supplied or compiled.

The packet remains partial: version collation, transitive formal-functions/approximation/coherence roots, resolution/intersection/duality, Keeler/adjunction/BPF inputs, quotients, arbitrary-excellent-base induction and numerical Picard finiteness remain open. The earlier application-level surface repair remains resolved, conditionally on its named suppliers. See the [handoff](../handoff/PAPER-WITASZEK-22.md).
