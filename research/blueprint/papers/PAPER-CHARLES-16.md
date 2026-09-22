# PAPER-CHARLES-16 — extraction and routing checkpoint

François Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture*, Annals of Mathematics 184 (2016), 487–526, [published article](https://annals.math.princeton.edu/2016/184-2/p04).

Status: **partial**. This is a full reading of the published article, not a closed proof blueprint. The extraction has 142 items: 8 library, 14 planned, 120 missing. Nine routes take 116 missing items and 14 planned items. Four missing items are deliberately unrouted: /50, /113, /119 and /127. Every other missing item occurs in exactly one route. Forty-one definitions/constructions carry a consuming API outline and three discriminating tests in their notes.

## Source and version control

The entire forty-page [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), including every proof and references, was read on 22 September 2026. Its SHA-256 is `3425f2697b3600f7920f1bdce67681339d06a20dfaf39ea4fdc2a0baebc940e2`. All unprefixed theorem numbers refer to this edition. The older twenty-eight-page author PDF was consulted only for its Corollary 2.7; published numbering is Corollary 2.8 and Theorem 2.10.

The entire twenty-page [Lieblich–Maulik–Snowden arXiv v5 manuscript](https://arxiv.org/abs/1107.1221) was also read, including its proofs and references. Its moduli proposition is 3.4.2 and partner proposition 3.5.6; Charles cites the published numbers 3.4.1 and 3.5.4. Publication metadata was checked, but the published LMS PDF was not obtained. The JSON records the exact hashes and read scope.

The complete two-page [Charles 2013 erratum](https://www.math.ens.psl.eu/~charles/erratum.pdf) was read. It adds torsion and parity hypotheses and repairs the integral-model argument of that earlier paper. It is not an erratum to Charles 2016. No claim is made that the corrections below have author approval. They are source-versus-formula checks recorded for review.

## What the paper actually establishes

The arbitrary-field construction begins with a polarized K3 surface of degree 2md, where m satisfies specified congruences and quadratic-residue conditions. A primitive rank-two lattice embedding produces a norm-two Mukai vector satisfying condition (C), hence a smooth fourfold of stable sheaves. A positive orthogonal class produces L with fixed L⁴=r and q(L)>0. The extra ample class, prime-to-n refinements and unramified Witt lifting are distinct outputs. Over arbitrary fields, descent via the top Chern number 324 explains the restriction involving 2 and 3; the sixfold remark has a different descent number, 3200.

For complex IHS varieties of dimension 2n, fixed positive top self-intersection gives birational boundedness. The theorem may replace the original L by another L′ of the same top power. It does **not** answer the introduction’s stronger question about uniform birational linear systems of the original L. The proof uses finite ample deformation types, arithmetic monodromy, algebraic period maps, Torelli and a finite family covering the period quotient. These are separate mathematical inputs, not synonyms for the linear-algebraic period-domain carrier already in Tau Ceti.

Over finite fields of characteristic at least five, the strongly admissible deformation/KS construction controls geometric NS lattices. Combined with the corrected unpolarized finiteness statement, twisted K3 partners of growing discriminant give the Tate argument. The Picard-rank-at-least-two argument works in every characteristic and uses fixed-positive-square divisors on the partners; it avoids Kuga–Satake. Both final statements are retained as proved results of the paper, while this extraction explicitly leaves the identified proof gates open.

## Corrections that change the target

### Corollary 2.8: the multiplier need not be an integer

Write K=v⊥∩N(X), I=[N(X):Zv⊕K], and [NS(M):θ_vK]=p^a. The full-sublattice determinant identity gives

`|disc NS(X)| = p^(2a) · (v²/I²) · |disc NS(M)|.`

The positive factor v²/I² is rational. For primitive v, I divides v², so only finitely many such factors occur at fixed v². In the Hilbert-square example v=(1,0,−1), v²=2 and I=2: the factor is 1/2. Consequently the printed formula with a positive integer multiplier cannot hold in odd characteristic. The p.499 image confirms that the integer wording is printed.

For the fourfold application v²=2 and p≥5, the possible factors 2 and 1/2 are p-units. The needed p-valuation argument therefore survives this correction. Items /34–/35 keep both the repaired formula and its regression example. This is not a claim that the entire original proof has been independently closed.

### Proposition 3.17: count surfaces, not arbitrary polarizations

The proof bounds the underlying K3 surfaces. The statement says polarized pairs, but on a fixed eligible (X,H) the bundles H^(ℓ^j), for suitable ℓ and an infinite congruence subsequence, have unbounded degree while satisfying the same conditions and NS-discriminant bound. They cannot form finitely many polarized isomorphism classes.

The corrected endpoint /88 is finiteness of underlying k-isomorphism classes admitting such an H. This is precisely what the final contradiction uses. Item /89 records the test; no primitive-polarization hypothesis has been inserted into the paper.

### Section 4.1: restore the LMS conventions

The displayed integral span consists of (ar,D+aα,c), but it is not the inverse image of integral N(X) under exp(−α/r). In the main isotropic example, untwisting (r,α+D,0) gives (r,D,d/r), whose final component is not integral when ℓ does not divide d.

LMS defines rational twisted Chow classes first, then specifies their integral structure separately. Its relevant α is transcendental; the clean primitivity/completion argument is used at primes avoiding disc NS. Its convention uses the gerbe representing −[α_n] with the exp(+α/r) Mukai vector. Its moduli objects include a determinant isomorphism: this gives μ_r scalar inertia, whereas the stack without that trivialization has G_m inertia. Finally, rank r equals the **geometric** Brauer order in the automatic-stability argument. Arithmetic order alone is not enough. Items /93–/106 carry these conditions.

### Other normalization checks

The BB/Fujiki equation is (2n)!q^n=n!·2^n times the top intersection; for fourfolds it is L⁴=3q(L)². The integral lattice library uses half-norm values modulo Z, while Charles/Nikulin uses full-norm values modulo 2Z. These are compared by division by two, not identified literally.

The primitive crystalline KS embedding retains the Tate twist (1) and the orthogonal-to-L domain; printed (3.4) suppresses these labels. The spin level is n≥3 and prime to p, not the later printed n≤3. The pairing v_n·(0,D,0) is +2d under the selected Mukai sign; the proof only needs its divisibility/absolute value.

The proof of Proposition 3.1 does not establish its displayed numerical constants: if L²=r, (4L)²=16r and h⁰(4L)=8r+2 in the claimed vanishing situation, before accounting for any earlier doubling. Also 3r−4>r fails at r=2. The existential theorem is retained but /50 is withheld until its characteristic-two nonreduced-curve argument is fully repaired.

## Ownership and library evidence

The ownership snapshot is main at `ee6f640ac057d50e12680876719e8cefc5608eee`. Both upstream HodgeStructures and Completed/IntegralLattices documents were read completely before drafting. Full selected campaign documents and relevant stage descriptions were read, together with accepted library coverage for the stated owners. MC.7 has no accepted audit entry at this snapshot; that absence was not mistaken for a library result.

The full atlas, new roadmap definitions, packet/reservations, relevant crystalline decomposition, and current paper route lists were screened. No existing K3-surface or IHS roadmap was found. K3BlochGroups means algebraic K₃. Schröer23’s low-degree Hodge obstruction proposal does not supply the moduli or Tate argument, and an unaccepted paper proposal is not an accepted supplier.

Pinned baseline:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The eight library items are the integral lattice carrier, half-norm discriminant form, index-discriminant identity, even-overlattice criterion, polarized Hodge period points, full Clifford algebra, Hensel lemma and Dirichlet theorem. Each cited declaration was opened and its statement read; the JSON records modules and exact names. In particular `hensels_lemma` is in the root namespace. The library’s Chebotarev auxiliary-prime result gives unramifiedness and cyclotomic irreducibility, not the splitting required in G3.

The 116 routed missing items divide as follows:

| Route | Owner and boundary | Missing items |
| --- | --- | ---: |
| New | K3SurfacesAndSymplecticBoundedness: K3/IHS-specific geometry and proof inputs | 90 |
| Part II | AlgebraicModuliStableTwistedSheaves: stable/twisted sheaves beyond R09 foundations | 6 |
| Part II | OrthogonalIntegralModelsAndKugaSatake: good-prime orthogonal models beyond generic-fiber Shimura theory | 8 |
| Source | GeometryOfNumbersAndQuadraticArithmetic GN.2–GN.3: embedding and lattice arithmetic beyond completed gluing | 12 |

The other five source routes take planned items: R09.1/R09.3 for boundedness and line-bundle descent; Shimura V2/V3 for Baily–Borel/Borel; MC.7 for divisor Hodge/Tate statements and applications; SF.5 for surface intersection, RR, adjunction and Hodge index; A5 for abelian/Hodge Hom comparison.

Each Part II/new route includes an explicit design brief with endpoints, imports, characteristic conditions and tests. Generic crystal/cohomology/stack constructions stay with their owners. The wide MC.7 stage must be refined into an early Lefschetz-(1,1) leaf and late K3 Tate applications before adding dependencies: importing the later theorem into its own K3 proof would create a cycle.

## Why this remains partial

G1–G4 correspond exactly to the four unrouted items.

1. **G1 /50:** certify characteristic-two birational linear systems, tracking powers and the nonreduced-curve separation argument. Always doubling may remove the numerical boundary issue, but that is not a substitute for checking the complete proof.
2. **G2 /113:** the cited Frobenius-lattice theorem bounds ℓ-valuations, not rational discriminant square classes across ℓ. The rank-one inference in Lemma 4.5 needs more than the cited statement.
3. **G3 /119:** LMS Lemma 3.5.2 gives a viable split-prime substitute after quadratic extension, in its stated p≥5 section. Complete its composition with extra congruence conditions and Tate descent; separately audit any extension to p=2,3.
4. **G4 /127:** verify the relative twisted-moduli deformation that simultaneously lifts H_n and has generic Picard rank one, and verify the nonsuperspecial hypothesis for the partners used in Proposition 3.17. Item /128 proves why a correctly constructed projective rank-one family gives special-fiber ampleness; mere generic ampleness would not.

G5 separately requires the original Nikulin primitive-embedding theorem, with its isometry-orbit and initial-embedding conventions. G6 lists unread original prerequisite interiors: Mukai/Yoshioka, Fontaine–Messing’s exact ranges, IHS Torelli, Kisin, special endomorphisms and the superspecial reduction, among others. Their source statements are routed, but not presented as closed proof leaves. The prerequisite register records 25 acquisition/decomposition entries and precisely distinguishes full reading from quotations through Charles/LMS.

No Lean file is required for a paper-extraction job, and none was written or compiled. The paper schema checker and local exact-arithmetic/ownership checks are the validation performed; they do not prove the remaining mathematics.
