# FIX-PKG-SpecialValuesBirchTate~adv

Completed for #10991 by Codex (GPT-6), session `codex-7d394M`,
19 October 2026. This is a completed package fix, not a checkpoint.

The five findings of `REV-PKG-SpecialValuesBirchTate~adv.md` are resolved
at roadmap level. The package consumes the newer supplying plans for four
findings and supplies the source-verified compact-support contract for the
fifth. No K-theory or Iwasawa construction is claimed to be formalised.
Only this handoff and the three permitted package files are changed.

## Finding dispositions

| Finding | Change and exact supplier | Disposition |
|---|---|---|
| 1. Integer monomial kernel | Exact contracts and §3.1 import `K2SymbolsBrauer--T.5`, T.2:symbols/monomial-kernel/`generated-by-symbols` and its monomial-subgroup, Weyl-conjugation and finite-rank-symbol prerequisites. Stabilise a finite word to rank at least three, use the integer Euclidean reduction into the monomial subgroup, then reduce the unit symbols to {−1,−1}. The sign symbol supplies the separate lower bound. | Closed; neither a field theorem over ℤ nor low-rank stability is assumed. |
| 2. Independent golden-field upper bound | §3.2 consumes `ArithmeticKTheory--N.7`'s N.8 `tate-norm-filtration`, `tate-criterion`, `golden-congruence-lattices`, `golden-residue-section`, `golden-large-prime-cutoff`, `golden-finite-prime-certificates`, `real-quadratic-upper-generation` and `real-quadratic-example-and-birch-tate`. It gives the direct norm-33 argument and checks all 11 finite-prime certificates in F itself. | Closed; the superseded ℚ(ζ₅)/generalized-Thue route is unnecessary. The upper bound concerns the whole group. |
| 3. Classical–modern module and finite comparison | §7.5 imports the I.2 real-unit radical and uniform capitulation, I.4 dyadic correction, and I.10 module dictionary/finite Euler comparison from `IntegralIwasawaTheory--I.1`. It states both exact module sequences, the real-unit rank calculation, both dual conventions and twists, and the two six-term specialisation sequences. | Closed for arbitrary totally real F, without assuming abelian μ=0, a free inertia module or disappearance of finite Tor. |
| 4. Burns–Flach source/model | Read the original 1996 Proposition 1.20 and proof, definition (1.9), Shapiro formulas, ordinary-to-Tate comparison and p. 86 duality. Exact supplier contracts now give the ordinary-local restriction cone, uniform projective model, derived Iwasawa control, arithmetic cohomology and Selmer comparison, with named interfaces and four discriminating tests. | Closed in this package. The source is obtained and the model/proof adapters are specified. See the existing-owner synchronization below; supplying files were outside the allowed edits. |
| 5. All-prime μ adapters | §6.5 consumes `IntegralIwasawaTheory--L1`'s L4 `analytic-mu-vanishing-dirichlet` and `minus-mu-from-analytic`, through the Sinnott Γ-transform targets. Read Sinnott's separate dyadic argument and the relative class-number formula. Rational eigenvalue comparison is separated from integral μ-content. | Closed for the inputs this package uses. Full dyadic plus-part μ=0 remains the supplier's separate `G-L4-DYADIC-MIRROR`, and is not silently claimed. |

All numbered targets, their hypotheses and earlier Checks remain. The former
seven requested comparison clauses (a)–(g) are replaced by their actual maps
and proof steps. The original 34 Lean examples remain and nine are added;
the original theorem/data declarations and 20 `sorry`s are unchanged.
No admitted data, artificial carrier or placeholder proposition was added.

## Existing-owner synchronization for the maintainer

These are refinements of existing targets, not new roadmaps or alternative
constructions. The edit restriction forbids changing their packets here.

1. In `IntegralIwasawaTheory--I.8`, route source gap G1 and
   `burns-flach-iwasawa-complex`/`compact-complex-cohomology` to the README's
   exact compact-support contract. Its named interfaces are
   `compactOrd_localization`, `compactOrd_perfect`,
   `compactOrd_realComparison`, `compactIw_control`, and
   `compactIw_cohomology`. These are proposed API refinements, not existing
   declarations. Retain I.9's finite abelian totally real hypotheses for the
   main conjecture, although finite-level perfectness is more general.
2. ArithmeticGaloisDuality D7 owns the ordinary-all-places cone, pairings,
   restriction/trace maps and its finite projective model. Its finite-place
   cone must include the ordinary infinite terms for this comparison.
   Proposition 1.20(a) supplies a uniform projective range [−1,3], even
   with real dyadic places and p dividing the finite group order. The
   ordinary-to-Tate comparison is an isomorphism on H_c^i for i≥2, with
   a genuine low-degree correction, not a quasi-isomorphism.
3. SelmerIwasawaCohomology L3 owns the derived inverse limit and
   `derived-control`. Apply coefficient Shapiro at all places, including
   infinite ones, and modulo p^m; use uniform perfect reductions, derived
   completeness and compact Nakayama to obtain the Iwasawa perfect model.
   Base change is derived tensor, including for finite quotients with
   p-torsion. Weak Leopoldt and the p. 86 duality give H²=X and H³=ℤ_p
   for coefficient ℤ_p(1), with real ramification allowed. Kummer and
   inflation–restriction give Kurihara's Selmer injection and its actual
   order-two cokernel.
4. The I.1 dictionary's model description must use the same ordinary-local
   cone: prose suggesting that Burns–Flach uses complete Tate cochains at
   infinity is contradicted by (1.9) and the comparison on p. 80. The
   package's §7.5 uses the corrected model, with H²/H³ in compact degrees
   two/three. Ordinary étale H¹ enters through duality/descent, not an
   unshifted identification of complexes.
5. The older parent G3 and the older SpecialValuesBirchTate packet's four
   gap records are historical inputs, not silently edited here. The
   refinement targets named in the disposition table determine the package's
   proof boundary. In particular, do not reconnect §6.5 to the full dyadic
   plus-part mirror gap when applying the L1 refinements.

The new material belongs to these existing owners. It does not duplicate
LFunctions' continuation, Tau Ceti's quadratic arithmetic or its Euler
products, PMIA's Iwasawa algebra/structure theorem, or the general Selmer
and duality constructions.

## Adversarial pass on every touched statement

Rows group API statements with the same hypotheses. Unchanged Layers 1–2,
4–5 and 8 retain the independent review's pass; the changes in their build
and downstream descriptions only replace the former supplier qualifications.

| Statement or interface | Instances and explicit computation | Result/change |
|---|---|---|
| Monomial-kernel generation | A=ℤ with units ±1; a field; finite rank 2 versus 3; zero stable word. | The arbitrary-ring assertion is only about W_n∩ker, with n≥3. Integer reduction precedes its use; a field Bruhat theorem is not substituted. |
| Finite-to-stable passage | A word beginning in rank two can be embedded in rank ≥3; its matrix image becomes identity after a sufficiently large stabilisation. | No assertion that an unstable kernel already injects into stable K₂. |
| Generator and integer order | w=[[0,−1],[1,0]] has w²=−I and w⁴=I; the real symbol sends {−1,−1} to −1. | Matrix membership and nontriviality are separate; c²=1 plus its sign gives exactly two. Matrix identities checked in Lean. |
| Tate filtration and congruence relation | Equal nonzero residues; a=b; norm exactly q². | Zero difference is separate; strict norm <q² is required. Arbitrary-global-field criterion is used, not the imaginary-quadratic geometry. |
| Golden-coordinate arithmetic | ε²=ε+1, Nε=−1, N2=4, N3=9; ε has residue orders 3 and 8. | Correct multiplication/norm and inert norms. Both residue-order examples elaborate in Lean. |
| Congruence lattices | Two coordinates have covolume 5q; three have covolume 5√5q². | With d=2√5/π, t=d√q and s=dq^(2/3), Minkowski gives nonzero fractions/common denominators. Norm <q excludes a zero numerator or denominator with nonzero residue. |
| Residue-section independence/multiplication | 4t²<q² and 4st<q² for q>33. | Cross-products, not a bound on a quotient's individual coordinates, give well-definedness and multiplicativity. |
| Inverse on prime generators | An earlier prime may have the same norm q; N((π′)p′)≤√5<4. | The integral ideal is the unit ideal, giving an inverse generator with both embeddings <1. The comparison ideal has norm ≤4tq′<q²; tied norms do not introduce later support. |
| Inverse on ordinary units/cutoff | a=−1, ε; H(ε)<5. π>157/50 gives 320/π²<33 and d<3/2. | The stretched bound 20d√q<q² holds for q>33. The small-prime certificate is used at q=4,5,9,11,19,29,31. |
| All finite certificate relations | 173 rows: all a,b,w factorizations, a−b=πw, exponent vectors, torsion products, reductions. | Recomputed with exact rational arithmetic in ℤ[ε]; all pass. Every listed factor is an old unit. |
| Index certificate and surjectivity | 23 selected maximal minors and residue closures at all 11 primes. At q=4 the determinants 6,−3 have gcd 3; 6,6 would give 6. | Gcd is q−1 at each prime and generated residue group has size q−1, proving equality of the lattice index; Lean checks the negative control. |
| Kernel upper/lower bounds | Ordinary units ±ε^n reduce symbols to c,d with c²=d²=1. Sign images are (−1,−1),(1,−1), exponent determinant 1 over 𝔽₂. | Upper bound four applies to the whole kernel, not just its subgroup killed by two. Signs prove only the lower bound. Lean checks determinant. |
| Auxiliary first-kind field | F=ℚ, F=ℚ(√2): F′=ℚ, conductor of F′(i) has dyadic part four; b=0 or 1. | Sinnott's p=2 first-kind condition excludes divisibility by eight and is satisfied. Existing character-count and order-four inverse-character checks retained. |
| Minus comparison maps | M=ℤ/4 with trivial j: anti-invariants {0,2}, minus quotient ℤ/2, both comparison maps zero. | Composites are multiplication by two; integral isomorphism is false. Lean checks nonzero 2 in ℤ/4 and its zero reduction. |
| Rational versus integral comparison | M=Λ/(2), j=1 and N=id: norm-minus=0 but minus quotient M has μ=1; both rationalise to zero. | Only rational comparison is unconditional. Finite comparison errors require full-module μ=0. Lean verifies a nonzero power-series carrier killed by two. |
| Analytic μ, including trivial branch | Nontrivial first-kind branches use Sinnott's rational measure. Trivial branch: v₂((1−1/2)log₂5)=1, so its pole-cleared numerator divided by two has a unit value. | μ is taken on integral numerators, never on a function at its pole. No circular main-conjecture input. |
| Arithmetic norm-minus μ | h^−=Qw∏(−B₁/2), Q∈{1,2}, v₂(w)=O(n); class norm is onto by wide-Hilbert-class-field disjointness. | Neither Q nor w has a 2^n growth coefficient. Analytic μ=0 gives norm-minus μ=0. The dyadic plus mirror is not needed. |
| Restriction of Γ and abelian endpoint | ℚ and ℚ(√2) give contents 2 and 4, f=1; restricting to index 2^b raises eigenvalues to 2^b powers with the graph-character factor. | Rational roots and independent integral contents are both supplied. Minus μ=0 is used only for the abelian endpoint. |
| Ordinary-local compact cone | Real trivial ℤ₂: H⁰=ℤ₂, Tate H⁰=ℤ/2; sign lattice H⁰=0,H¹=ℤ/2. Complex 𝔽_p: ordinary H⁰=𝔽_p, Tate cohomology zero. | Complete Tate is not substituted. The global cone cancels high real tails. Lean verifies the real norm 2 is injective but not a unit. |
| Finite-level projectivity | Trivial G; G=C₂ at p=2; arbitrary p dividing |G|. | Subgroupwise cohomological triviality, uniform truncation and torsion-free final image give projectivity; averaging or semisimplicity is unnecessary. |
| Iwasawa perfectness/control | Γ quotient by an open subgroup; reduction mod p^m; finite C₂ quotient at p=2. | The alternating 0,2 resolution has nonzero odd Tor. Derived Shapiro and uniform perfect reductions are used, not ordinary tensor or regularity of a finite group ring. |
| Arithmetic cohomology and Selmer maps | Coefficient ℤ_p(1) has dual discrete coefficient ℚ_p/ℤ_p. CM inflation–restriction has H¹(C₂,D)=ℤ/2 at p=2 and zero at odd p, H²(C₂,D)=0. | H²=X,H³=ℤ_p and the precise Selmer cokernel follow with traces dual to restriction. Local auxiliary-prime boundary is the sum of augmentation maps. |
| Ordinary Kummer sequence at the limit | For fixed exponent 2^r, dyadic valuations become divisible by 2^r after enough levels of eventual total ramification. | The infinite-level ordinary-unit/ordinary-class sequence follows from the ideal Kummer sequences. Finite-layer S-units/S-classes are not relabelled. Extra non-dyadic S needs its local terms. |
| Kummer anti-invariants | V divisible, j trivial; H¹(J,V with sign)=V/2V=0. Finite-level norm-minus/anti discrepancy has order at most two. | Right exactness is justified. Its finite limit discrepancy has dual embedded in X(−1), so no-finite-submodule eliminates it without μ=0. |
| Real-unit module C_F | Unit rank d·2^n−1, uniform capitulation error O(1); d=1 gives growth 2^n+O(1). | Rank over 𝔽₂[[Γ]] is d. char(C_F)=(2^d) allows finite torsion; no claim that it is free or is a split inertia module. |
| Two dual conventions and twists | Covariant eigenvalue 2 on ℤ/5 stays 2; contragredient gives 3. Standard twist M(j) replaces h(γ) by h(u^(−j)γ). | char(X(−1))=2^d ι(f), hence char(ι_u X)=2^d f with full 2-content. Earlier finite action check retained. |
| Series/pole dictionary | u=5,γ=25: uγ^(−1)−1=−4/5; u^(−1)γ−1=4. | ι_u sends γ−1 to −γ^(−1)(γ−u); existing Lean example pins the unit, inversion and pole direction. |
| κ² and denominator | u=5 gives u²−1=24 and w₂(ℚ){2}=8; general e≥2 gives valuation e+1. | Nonzero denominator, convergence and odd dyadic Euler factors retained. |
| Compact specialisation and degrees | ℚ: #H²=2,#H³=8, quotient 1/4. A degree-one placement of the same denominator gives 16. | Compact degrees two/three are kept; ordinary étale H¹ is compared through its order. New Lean example rejects the degree mistake. |
| Both finite specialisation sequences | E=ℤ/2(−2) has invariant/coinvariant orders 2,2. Λ/(2,T) has unit characteristic ideal and coinvariants of order two. | All six terms retained before cancellation. E still injects into Y′_Γ and is a quotient of X(−2)_Γ; its Euler contribution is one. Lean computes its kernel/image. |
| Euler contribution of C_F | Free 𝔽₂[[Γ]] rank d gives quotient 2^d; any finite torsion has equal invariant/coinvariant sizes. | #X(−2)_Γ=2^d#B′_Γ, with B′ invariants zero by its embedding in X(−2). No height-one shortcut to a finite order. |
| Federer endpoint and descriptions | ℚ gives (2), ℚ(√2) gives (4); abelian F only in §6.5, arbitrary totally real F in §7.5. | Both endpoints have their stated inputs. No extension of abelian μ=0 to general totally real fields. Existing endpoint Checks retained. |

The Lean examples are computations on carriers at the pins. The actual
Steinberg groups, tame kernels, derived arithmetic complexes, unit radicals
and characteristic ideals remain README targets in their stated owners.
Their generality has not been represented by a weaker or fictitious Lean
signature.

## Source audit

All writing is in our own words. Printed page numbers are used. The readings
below are the passages used by this fix, not an assertion that all papers
were reread in full. No uncleared Milnor or NSW copy was used: their locators
remain attributed to the supplying plans.

| Original read | Passage checked | PDF SHA-256 |
|---|---|---|
| Burns–Flach 1996, GDZ public scan linked in README | (1.9) p. 73; (1.18) p. 77; Proposition 1.20 and full proof pp. 78–80; (1.21)–(1.23) p. 80; duality pp. 85–86. Scanned page images, not empty OCR. | `ec4487d7975a96c8a36a6fefb0a69a19575a6ec818ae7cf7cb7860b925ed95b4` |
| Kurihara 2025, author PDF | §4.1 pp. 22–24, Lemma 4.2 and proof pp. 25–26, including sequence (12). | `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33` |
| Bass–Tate 1973, public Ravenel volume | II §3 Lemma 3.2 pp. 404–407; Appendix A1–A3 and Proposition 1 pp. 429–431. | `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55` |
| Groenewegen 2004, original 16-page paper at [public mirror](https://scispace.com/pdf/bounds-for-computing-the-tame-kernel-4jcvx5pki0.pdf) | Lemma 7 pp. 1448–1449, Proposition 10 p. 1450, §4 p. 1451, Lemma 12/Proposition 13 p. 1453, Theorems 14–15 pp. 1454–1455. AMS and direct download failed; the original paper was readable through the browser PDF renderer. Specialised inequalities checked independently. | No local PDF/hash claimed. |
| Sinnott 1984, GDZ scan | Theorem 1 and separate p=2 proof pp. 276–277; §4, Proposition 4.1 and (4.1)–(4.5), pp. 279–282. Page images. | `2158086c73ac8ef3ba43781a190c4fcd5c1073a431a1216a129d580c81e9287d` |
| Washington 1978, GDZ scan | §2 p. 88, class-number formula and Q∈{1,2}; source explicitly switches to p odd for its later proof, which is not used here. | `b0954600a0ad5fd1e6ccfce57640378ba7ce34c330bb0b599e880fd255caefb6` |
| Oesterlé 1979, Numdam | §4 pp. 173–174, auxiliary first-kind reduction and relative class-number formula; mirror implication is distinguished from the input used. | `003c5a2385bc637dab5244c1037932fd9c505688a553e15f313cb4db06b67920` |
| Weibel, author K-book | Examples III.5.2.2 p. 218 and III.6.2.1 p. 232, integer and real-sign checks. | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Kolster 1989, publisher PDF | Entire pp. 248–251, covariant action, finite sequence, Theorem 1, Lemma 2 and Theorem 5. | `ce649cf4085c501f755517afb0dd7bc9a9798ad1ee9a37116d7b5aae98073f2f` |
| Greither 1992, Numdam | Lemma 3.3 p. 469, exceptional branch p. 470; original inclusive statement and module conventions retained. | `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da` |
| Rognes–Weibel 2000, author PDF | Appendix A pp. 45–49, A.1/A.2 and proofs, A.4(b), ramification at real places, twists and rational roots versus integral contents. | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` |

## Library and ownership check

Read all eight reviewed B.1–B.8 audit entries. The upstream check used
TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only.
Searches covered all nine roadmaps newer than the atlas snapshot and all
four newer Completed roadmaps, including OperatorTheory's separate files.
Object searches distinguished local cyclotomic characters from Iwasawa
modules and geometric compact supports from the arithmetic cochain cone.
No new overlap or ownership move was found.

The current ArithmeticDirichletSeries and ProfiniteArithmetic roadmaps and
the PadicMeasuresIwasawaAlgebras exemplar were read for their interfaces
and package form. The package continues to cite current Tau Ceti's zeta
positivity, Euler restriction and √5 arithmetic; it does not plan them.
The new Lean uses the existing matrix, power-series, ZMod and p-adic
integer carriers and `PadicInt.not_isUnit_iff`/`norm_p` at the Mathlib pin.

## Reproducing the finite certificate check

The data remains in `ArithmeticKTheory--N.7.json`, in the N.8 node's
`certificateData.certificates`. File SHA-256 at this check:
`dbacb5f4e6424a33786cd01323db0705765d3fe801aa6f2eb5956adcee86d9b7`.
The temporary checker used only Python's standard library and exact
`Fraction` arithmetic, with these independently implemented operations:

1. Multiply pairs by (a,b)(c,e)=(ac+be,ae+bc+be). Invert (a,b) by
   ((a+b)/N,−b/N), N=a²+ab−b², and use binary exponentiation.
2. Check the old generators are −1, ε and precisely the preceding prime
   generators. Check |Nπ|=q. For every unit-kernel row recompute its three
   factorizations, a−b=πw and the exponent difference; for a torsion row
   check its generator product is one.
3. Reduce pairs modulo 2 or 3 for q=4,9, retaining ε²=ε+1. For the split
   or ramified rational prime q use ε=−π₀/π₁ modulo q. Check each stored
   residue image and relation, and close the old-generator residues under
   multiplication; its size must equal q−1.
4. Compute every stored selected maximal minor from the relation vectors
   using exact Gaussian elimination. Compare with the recorded determinant
   and recompute their gcd; it must equal q−1, not just be divisible by it.

Results, in the stored prime order:

```text
norms:        4  5  9 11 11 19 19 29 29 31 31
rows:         4  3  4 15 12 14 16 27 20 22 36
minors:       2  1  1  3  2  2  2  3  2  2  3
gcd:          3  4  8 10 10 18 18 28 28 30 30
PASS: 11 primes, 173 relations, 23 maximal minors
```

## Validation and remaining work

- `lean-check research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean`:
  exit 0; only 20 `declaration uses sorry` warnings. 489 lines, 43 examples.
  Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/SpecialValuesBirchTate.json`:
  0 errors, 0 warnings; the historical packet is unchanged.
- Exact finite certificate computation: all checks above pass.
- Four-file `intake.py check-files`: 4 files, 0 problems. JSON parsing and
  `git diff --check` pass.

No package-fix finding remains. The maintainer's existing-owner synchronization
above and the independent package gate are the next steps; the separate full
dyadic plus-part theorem remains outside this package's required inputs.
