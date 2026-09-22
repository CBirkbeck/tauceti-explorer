# PAPER-WITASZEK-22 — published-source and surface-proof continuation

Status: **partial checkpoint**. Codex session `codex-c83e7a`, 22 September 2026. Refs [#1101](https://github.com/CBirkbeck/tauceti-explorer/issues/1101). Continues codex-a71f92 ([PR1680](https://github.com/CBirkbeck/tauceti-explorer/pull/1680)) and cc-fb70e5 ([PR1834](https://github.com/CBirkbeck/tauceti-explorer/pull/1834)).

169 items: 14 pinned-library imports, 6 existing-stage imports and 149 missing items, each routed exactly once. All157 earlier IDs and six ownership routes are retained. The38 definitions/constructions retain114 API entries and114 mathematical test plans. The326 prerequisite edges are resolved and acyclic. None of these counts asserts transitive mathematical closure.

## Published source and reading boundaries

The complete [published paper](https://par.nsf.gov/servlets/purl/10429755), Annals of Mathematics195(2),655–705, was acquired and read through all51 pages, proofs and references. SHA-256:

`d71bd9254d80145a84f13059f18d37d6f777008900ab907b14d195bb61414ea0`.

The [journal record](https://annals.math.princeton.edu/2022/195-2/p04) supplies DOI10.4007/annals.2022.195.2.4. The separately pinned [arXivv2](https://arxiv.org/pdf/2002.11915v2),23January2022, has46 pages and SHA-256 `5ab792128995b0735311a5284620e5d14549ecc6c5be08595c5d8cdffedda842`. The earlier worker read it fully; this continuation reread pp.1–12 and selected diagnostic/version passages. Images of published662,664,673,677,679,697,701,703 were checked.

The prior acquisition obstruction is resolved. Principal statements and every diagnosed passage have been checked against publication. Exhaustive statement-by-statement collation remains open: automated heading extraction misidentifies line-wrapped citations and repeated theorem references. In particular, it must not mistake the BCHM citation3.9.1 for a theorem of Witaszek. The bibliography demonstrably differs: publication loses the distinction between the two2003 Keel/Keeler references.

The complete JSON reading log retains the earlier supporting-source boundaries. This continuation reread [Keel99](https://arxiv.org/pdf/math/9901149), printed279–282, in full, including the Euler calculation, Lemma5.2, adjunction and Lemma5.4. This does not claim that the underlying Hartshorne/Kollár duality and dévissage proofs were acquired.

## Mathematical scope

The algebraic mechanism starts with **direct-limit multiplicative perfection**. Over mixed characteristic the p-power map need not preserve addition; the construction is a commutative monoid, and perfected line-bundle sections form sheaves of sets. The two halves of Lemma3.4 are separated: integral finite generation clears one common denominator for surjectivity, while kernel p-torsion and nilpotence, combined with binomial divisibility, yield eventual equality for injectivity.

This produces a rational-fiber pullback square for perfected sections. Separately, Theorem1.7 constructs a **2-pullback of Picard groupoids after inverting p**. It is decomposed into characteristic-p, thickening, reduction and conductor-induction steps. Isomorphisms and their automorphisms are essential: a statement only about Picard groups would lose the compatibility needed to glue sections and polarizations.

The pushout argument then uses arithmetic fiber-product rings, étale descent and affine–contraction–affine factorization. Definition2.17's “topological pushout” is deliberately weaker than a categorical pushout. A geometric pushout adds the ring-sheaf fiber product and has a genuine universal property. Geometric pushouts need not be Noetherian; Lemma2.22 supplies only a finite-type **topological** approximation.

The resulting dependencies divide into two applications:

- Finite relations and proper group actions: integral-relative quotients, finite pinching, lower-dimensional relation induction and conductor descent yield Theorems1.4 and1.5. The relation is set-theoretic on geometric points and can have nilpotents; it is not assumed to be a closed immersion into the product. The action is proper; no general GIT assertion is inferred.
- Positivity: Picard/section descent and pushouts give the separate semiample and EWM gluing theorems, reduction plus rational-fiber detection, mixed-characteristic Keel, and the surface/threefold applications.

Theorem6.1 proves the semiample criterion over an excellent base. Its EWM analogue additionally requires a base of finite type over a mixed-characteristic Dedekind domain. The final klt threefold corollary keeps absolute dimension3, projectivity and surjectivity over the Dedekind spectrum, perfect closed residue fields, and both nef-and-big assumptions. Locally finite positive-characteristic closed residue fields give semiampleness. The JSON records the plt corollary and relative surface proposition separately.


## Surface Riemann–Roch and the repaired application

The previous continuation gave the fibration proof for nef numerical and Iitaka dimensions one. The new decomposition first passes to a smooth projective resolution before taking moving and fixed divisors. This ensures these divisors are Cartier and supplies an explicit semiampleness descent step. The stronger usable input is two independent sections of one positive power.

Let S be a normal projective integral surface over an algebraically closed field and π:T→S a projective resolution. Normality gives π_*O_T=O_S. By projection formula, all section spaces of L^m and π*L^m agree. Generation descends because π is surjective: a common zero downstairs would remain a common zero upstairs.

The sheaf R¹π_*O_T has finite support and higher direct images vanish. Tensoring this sheaf by L^m preserves its length. Leray therefore gives

χ(S,L^m)−χ(T,π*L^m)=χ(S,O_S)−χ(T,O_T).

Smooth surface Riemann–Roch, with Cartier–Weil projection, then yields

χ(S,L^m)=χ(S,O_S)+(m²L²−m L·K_S)/2.

This cancellation needs no rational-singularity hypothesis and no assumption that K_S is Cartier. In the application aL≡K_S+Δ+A, with Δ effective and A ample. Since L is nef with ν(L)=1, L²=0 and

−L·K_S=L·Δ+L·A>0.

The last strict inequality uses Hodge index. Thus χ grows with positive slope c. The bounded H² from Keel5.4 gives h⁰(L^m)≥χ(O_S)+cm−C, so some power has at least two independent sections. The packet now separates the resolution Euler correction, normal Cartier formula, positive slope and elementary cohomology inequality.

On T write |mL_T|=|M|+F. Nefness gives L_T·M=L_T·F=0, followed by M²=M·F=F²=0. Two moving members with no common component and intersection zero are disjoint, so |M| is generated. Its nonconstant image is a curve; Stein factorization gives M=f*A with A ample on the base. The equality M·F=0 makes F vertical.

For a connected fibre with components C_i and multiplicities m_i, write Q=(C_i·C_j). Off-diagonal entries are nonnegative, Qm=0, and the positive-intersection graph is connected. The exact identity

xᵀQx=−Σ_{i<j}q_ij m_i m_j(x_i/m_i−x_j/m_j)²

proves negative semidefiniteness and identifies the kernel with Q·m. Group F by fibres. The sum of their nonpositive squares is zero, so each piece is a nonnegative rational multiple of the whole fibre. Clearing denominators shows a positive power of L_T is pulled back from a positive-degree divisor on the base. It is semiample, and semiampleness descends to S.

`gap-surface-nef-repair` is resolved at this application level. The exact general resolution, Hodge index, intersection projection, cohomological-dimension, duality and dévissage inputs remain under the named foundation gaps. This is an explicit conditional proof plan, not a claim that these prerequisites are formalized or transitively closed.

The `surface-h2-bound` supplier now states the actual line-bundle theorem in Keel5.4. The old arbitrary-coherent-F top-cohomology statement was an unverified strengthening. Keel’s auxiliary coherent-sheaf assertion instead concerns sections of F tensored with negative nef powers.

## Source findings

The JSON now records11 `sourceIssues` according to PROTOCOL§18, with precise locators, short source excerpts, corrections, reasons and bounded correction searches. All await independent review; no reviewer verdict is supplied. The previous diagnostics D1–D9 remain, with explicit continuation assessments rather than silent deletion.

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

## Ownership and pinned-library reuse

| Supplier | Missing items |
| --- | ---: |
| SchemeAndStackFoundations:SF.0 | 24 |
| SchemeAndStackFoundations:SF.1 | 64 |
| SchemeAndStackFoundations:SF.4 | 4 |
| SchemeAndStackFoundations:SF.5 | 8 |
| SchemeAndStackFoundationsMixedCharacteristicPositivity | 48 |
| NumericalPicardAndContractionDescent | 1 |

The six existing routes remain. Surface resolution/section comparison refine SF.4; the normal Cartier formula and fibre intersection argument refine SF.5; the mixed-characteristic positivity Part II consumes these shared lemmas. Smooth surface Riemann–Roch itself is imported from the already explicit SF.5 target. NumericalPicardAndContractionDescent remains the SAME pending proposal shared with PAPER-SCHROER-23, with no new competing design.

The continuation refreshed485 input hashes, reread reviewed AUDIT-01 foundation targets and current stages, and checked the StableReduction scope. Its shared-intersection instruction prevents placing general surface theory inside a curve-specific namespace. Abstract GrothendieckEulerForms does not supply geometric surface Riemann–Roch. The pinned algebraic-geometry trees were searched for the newly exposed surface interfaces; no exact implementations were found at that scope.

At Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, the actual statements and proofs of `IsPurelyInseparable.bijective_algebraMap_of_isSeparable`, `PerfectField.ofCharZero`, and `Algebra.IsAlgebraic.isSeparable_of_perfectField` were read. They supply a direct repair for the characteristic-zero residue extension argument. Do not plan these algebraic facts again. Tau Ceti remains pinned to f790474821cf4256814db967cb154e7af3d0c369.

The old carrier distinctions remain: monoid perfection is a direct limit, whereas Mathlib Perfection is an inverse limit; the full invertible-sheaf category must be restricted to its core for Picard groupoids; scheme-level properties do not by themselves provide algebraic-space infrastructure.

## Verification and remaining work

The repository paper validator passes. A separate audit verifies169 unique IDs,326 acyclic edges,149 missing items routed exactly once,38 definitions with114 API entries and114 test plans, valid gap consumers and485 input hashes. Exact standard-library Python calculations passed55,157 cases:3,734 sharp positive-range binomial checks,13,120 fixed-range checks,20 zero-index counterexamples,29,322 connected-fibre matrix identities,8,960 Euler identities and one exact cubic factorization. These calculations test formulas and boundaries; they do not prove the geometric suppliers.

No Lean file was required, supplied or compiled. The114 mathematical definition tests remain planning assertions. Eleven gaps remain open, including exhaustive version collation, primary Stacks/Kollár/Artin/Temkin chains, dimension induction over an excellent base, corrected Keeler proof inputs, adjunction/BPF, general intersection/duality, numerical Picard finiteness and the final transitive closure audit. The Lean-prototype marker is a downstream design obligation, not an extra unauthorized paper deliverable.

See the [handoff](../handoff/PAPER-WITASZEK-22.md) for the ordered resumption work.
