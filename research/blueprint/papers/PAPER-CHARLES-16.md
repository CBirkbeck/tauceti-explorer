# PAPER-CHARLES-16 — extraction and routing checkpoint

François Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture*, Annals of Mathematics 184 (2016), 487–526, [published article](https://annals.math.princeton.edu/2016/184-2/p04).

Status: **partial**. This is a full reading of the published article, not a closed proof blueprint. The extraction has 153 items: 11 library, 14 planned, 128 missing. Nine routes take 124 missing items and 14 planned items. Four missing items are deliberately unrouted: /50, /113, /119 and /127. Every other missing item occurs in exactly one route. All 44 definitions/constructions now have structured API statements, a named consuming item and three discriminating proposed tests: 132 contracts and 132 tests. The previous prose notes are retained as historical context.

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

The original eight library items are the integral lattice carrier, half-norm discriminant form, index-discriminant identity, even-overlattice criterion, polarized Hodge period points, full Clifford algebra, Hensel lemma and Dirichlet theorem. Each cited declaration was opened and its statement read; the JSON records modules and exact names. In particular `hensels_lemma` is in the root namespace. The library’s Chebotarev auxiliary-prime result gives unramifiedness and cyclotomic irreducibility, not the splitting required in G3.

The 124 routed missing items divide as follows:

| Route | Owner and boundary | Missing items |
| --- | --- | ---: |
| New | K3SurfacesAndSymplecticBoundedness: K3/IHS-specific geometry and proof inputs | 90 |
| Part II | AlgebraicModuliStableTwistedSheaves: stable/twisted sheaves beyond R09 foundations | 6 |
| Part II | OrthogonalIntegralModelsAndKugaSatake: good-prime orthogonal models beyond generic-fiber Shimura theory | 8 |
| Source | GeometryOfNumbersAndQuadraticArithmetic GN.2–GN.3: embedding and lattice arithmetic beyond completed gluing | 20 |

The other five source routes take planned items: R09.1/R09.3 for boundedness and line-bundle descent; Shimura V2/V3 for Baily–Borel/Borel; MC.7 for divisor Hodge/Tate statements and applications; SF.5 for surface intersection, RR, adjunction and Hodge index; A5 for abelian/Hodge Hom comparison.

Each Part II/new route includes an explicit design brief with endpoints, imports, characteristic conditions and tests. Generic crystal/cohomology/stack constructions stay with their owners. The wide MC.7 stage must be refined into an early Lefschetz-(1,1) leaf and late K3 Tate applications before adding dependencies: importing the later theorem into its own K3 proof would create a cycle.


## Continuation: primitive embeddings and the explicit Zarhin plane

Codex, session `codex-c83e7a`, independently reread all forty pages of the published paper and preserved all 142 earlier item identifiers. This continuation adds eleven items, imports three additional pinned lattice facilities, and converts every definition's planning contracts into structured `api`, `uses` and `unitTests` entries. It does not close the four moduli/Tate gates /50, /113, /119 and /127.

The continuation also read selected original [Nikulin publisher text](https://www.mathnet.ru/eng/im1677): §§1.1–1.6, the stability corollary and Theorem 1.14.2, and Proposition 1.15.1 with its proof and following orbit qualifications. The web PDF text was available, but local download returned HTTP 403 and page screenshots failed. Some formulas in the extraction are damaged. The result records these limits explicitly, with no invented PDF hash or claim of a full Nikulin read.

Nikulin 1.15.1 requires a complement and discriminant-form identification, then an isometry quotient of the data. It classifies embeddings up to ambient isometry; unmarked sublattices have an additional source-isometry quotient. The fixed target Λ₂n also requires the genus-uniqueness specialization for <2n>⊕U. The extraction separates these from the rank-one complement and from raw embedding data; item 37 is an existence criterion, not a raw-tuple bijection.

There is a more concrete problem in Charles Proposition 2.9: the proof needs an initial **primitive** embedding, but the printed hypothesis only says sublattice. The broader statement is false. In Λ₂=<2>⊕U, with basis h,e,f and e·f=1, the sublattice generated by 2h and 2(e+f) has Gram matrix diag(8,8). If it admitted any primitive embedding into Λ₂, reduction modulo 2 would give a two-dimensional subspace on which the half-norm

`Q(x,y,z)=x²+yz` over F₂

vanishes. Its nonzero singular vectors are exactly (0,0,1), (0,1,0) and (1,1,1). The sum of any two has Q=1, so such a plane does not exist. Taking m=1 meets every congruence and coprimality condition of the printed statement and disproves it. Saturating the initial sublattice does not preserve the primitivity conclusion for the original lattice. This is a derived audit counterexample, not an author-issued erratum.

The application in Theorem 2.10 can use an explicit primitive initial lattice. For d,k>0 in Λ₂d=<2d>⊕U, set

`v=e+f, w=kh+e, l=2w−v`.

Then the Gram matrix of v,w is `[[2,1],[1,2dk²]]`, with positive determinant `4dk²−1`. The integral map `(x,y,z)↦(z,y−z)` retracts the embedding `(a,b)↦av+bw`, proving that its image is primitive. Moreover,

`v²=2, v·w=1, l·v=0, l²=2(4dk²−1)>0`.

For the prime-to-n refinement, choose k to be a positive multiple of the odd integer |n|. Then l²≡−2 modulo n, so its norm is prime to n. This supplies the actual input needed by the corrected transport theorem and the Mukai coprimality argument. The orthogonal complement is explicitly generated by `(1,2dk,−2dk)` and has norm `−2d(4dk²−1)`.

Items 38–40 now make the transport conditions explicit. One can include `(2d)!` in N to ensure coprimality of m with the representative y₀∈[1,2d]. If u²≡−d and v²≡t modulo m, choose λ≡u(vy₀)⁻¹ modulo m and λ≡1 modulo 4dt. The two moduli are coprime, and the resulting unit rescales the quadratic generator as required. The primary genus/classification proofs remain separate dependencies.

The added library imports are the actual even-overlattice order equivalence, the canonical discriminant isometry `A_M≅H^⊥/H` with its representative formula, and the rank-one generator formulas. Their statements were read at Tau Ceti `f790474`. The half-norm Q/Z convention is retained throughout, with multiplication by two when passing to Nikulin's Q/2Z convention. These completed objects are not re-planned in GN.2/GN.3; only their embedding and arithmetic consumers are added there.

The continuation's exact diagnostics check the integral retraction, Gram positivity, both orthogonal classes and their norms, the prime-to-n congruence, every singular vector over F₂, and ten concrete CRT rescalings. It also verifies retention of prior IDs, all 132 unique API and test names, consumer references, the 31 new/expanded dependency edges and their acyclicity, exactly one route for every routed missing item, the four deliberately open routing gates, and acquired source/input hashes. These finite computations support the displayed identities and counterexample; they are not Lean proofs or a closure certificate for the other geometric inputs.

## Why this remains partial

G1–G4 correspond exactly to the four unrouted items.

1. **G1 /50:** certify characteristic-two birational linear systems, tracking powers and the nonreduced-curve separation argument. Always doubling may remove the numerical boundary issue, but that is not a substitute for checking the complete proof.
2. **G2 /113:** the cited Frobenius-lattice theorem bounds ℓ-valuations, not rational discriminant square classes across ℓ. The rank-one inference in Lemma 4.5 needs more than the cited statement.
3. **G3 /119:** LMS Lemma 3.5.2 gives a viable split-prime substitute after quadratic extension, in its stated p≥5 section. Complete its composition with extra congruence conditions and Tate descent; separately audit any extension to p=2,3.
4. **G4 /127:** verify the relative twisted-moduli deformation that simultaneously lifts H_n and has generic Picard rank one, and verify the nonsuperspecial hypothesis for the partners used in Proposition 3.17. Item /128 proves why a correctly constructed projective rank-one family gives special-fiber ampleness; mere generic ampleness would not.

G5 now records the remaining deeper Nikulin proof leaves and local PDF/image acquisition limits; the initial-primitivity and orbit interfaces have been resolved as described in the continuation above. G6 lists unread original prerequisite interiors: Mukai/Yoshioka, Fontaine–Messing’s exact ranges, IHS Torelli, Kisin, special endomorphisms and the superspecial reduction, among others. Their source statements are routed, but not presented as closed proof leaves. The prerequisite register records 25 acquisition/decomposition entries and precisely distinguishes full reading from quotations through Charles/LMS.

No Lean file is required for a paper-extraction job, and none was written or compiled. The paper schema checker and local exact-arithmetic/ownership checks are the validation performed; they do not prove the remaining mathematics.

Continuation validation: the paper checker, three-file intake check, exact-arithmetic diagnostics, and fresh-main ownership/concurrency checks passed. No Lean compilation is claimed.

## Continuation: G1 resolved, Proposition 3.1 completed (Claude Code, cc-fb70e5, 22 September 2026)

Item 50 now carries a complete proof of the birational-boundedness statement, with explicit constants N=128r+2 and d=256r. It is routed to K3SurfacesAndSymplecticBoundedness with items 49 and 51.

The paper's argument is kept, with three repairs:
- **Doubling.** Pass to a fixed-part-free, base-point-free L₄ with s=L₄²≥4. The printed 3r−4>r fails at r=2.
- **The non-reduced member.** When C=2C_red, which happens in characteristic 2, the vanishing H⁰(C,−2L₄|_C+D(p)+D(q))=0 that "By Riemann–Roch" needs follows from the conormal filtration 0→I⊗N|_{C_red}→N→N|_{C_red}→0. Both pieces have negative degree, −s/4−s+2 and −s+2, when s>2. Separation lifts to X through H¹(X,2L₄)=0, and two members through a general point make φ_{4L₄} separable, hence birational.
- **Constants.** The printed final display, degree r in P^{r/2+1}, describes L, not 4L. The certified bounds are h⁰(4L₄)=8s+2≤128r+2 and deg=16s≤256r.

Gaps G2–G4 (items 113, 119, 127) remain open.
