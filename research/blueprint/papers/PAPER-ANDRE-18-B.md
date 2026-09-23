# PAPER-ANDRE-18-B — direct summands and big Cohen–Macaulay algebras

Status: **partial**. Issue #2188. Continuing agent: ChatGPT — `cgpt-20260923-4c72a9`, 23 September 2026. This continues Codex checkpoint #2210; it is not an independent review of that checkpoint, a complete extraction, or a formalization.

## 1. What this checkpoint establishes

The result retains the 76 existing mathematical item identities and five ownership routes. It adds four explicit lemmas for the Artinian-retraction argument, two statement-read Mathlib suppliers for eventual ranges, and one corrected implication from Appendix A.3.1. The resulting inventory is 83 items: 11 library, 7 planned and 65 missing. Each missing item has one route. The 18 definitions/constructions retain use-derived APIs and three planning tests each. The dependency list is a selected proof spine, not an exhaustive prerequisite graph.

The substantial new finding is **E4**: the printed implication A.3.1(c)⇒(b) is false when the separating element is allowed to be a zero divisor. Section 3 gives an explicit counterexample, verifies every hypothesis, and proves a sufficient repair. This finding has **not** been independently reviewed. It is an error in the appendix’s stated generality, not a counterexample to the direct-summand theorem.

The second advance is the full source-level explanation of §3.4: how unrelated finite-quotient retractions yield a compatible system. The argument uses descending cosets in Artinian modules, not finite underlying sets, and does not assume that the original transition maps on retractions are surjective. Section 4 records the construction and exact library boundary.

G3 remains open for the separate reduction to the unramified complete-local base. Its source is **Hochster 1983, Theorem 6.1**, as André explicitly says in §0.2; Hochster 1973 p.30 is the source of the inverse-limit argument, not that complete reduction. G6 remains open for the other, regular/integral local-duality branch of A.3.1 and the full absolute-integral-closure application. The remaining gaps G0–G2, G4–G5 and G7 have not disappeared.

## 2. Sources, reading and library evidence

### Primary sources

The paper is Yves André, *La conjecture du facteur direct*, Publications Mathématiques de l’IHÉS 127 (2018), 71–93, DOI [10.1007/s10240-017-0097-9](https://doi.org/10.1007/s10240-017-0097-9). Locators use the [published Numdam PDF](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), whose first PDF page is printed page 71.

The predecessor downloaded that 23-page PDF, recorded SHA-256 `34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`, and read the whole article. That byte-level provenance is inherited, not presented as a fresh hash computed by this worker. This continuation rechecked §0.2, §3.4 and Appendix A.3.1, including page images 84, 90 and 91. The browser source was accessible, but this worker did not obtain a local PDF download or compute a new source hash.

Hochster’s *Contracted ideals from integral extensions of regular rings*, Nagoya Math. J. 51 (1973), 25–43, was read in the [public Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/82D140341FC0DE224799A1FB5468DC45/S0027763000015701a.pdf/contracted-ideals-from-integral-extensions-of-regular-rings.pdf). The relevant page 30 was inspected as an image as well as text. It constructs nonempty retraction cosets, stabilizes their images, and passes to a compatible inverse limit. The opening local/base-change and domain-reduction material was also inspected; this is not a claim of a complete extraction of Hochster’s paper. No local byte hash of that PDF was obtained.

Hochster’s 1983 *Canonical elements in local cohomology modules and the direct summand conjecture*, J. Algebra 84, 503–553, DOI [10.1016/0021-8693(83)90092-3](https://doi.org/10.1016/0021-8693(83)90092-3), remains a required source for the unramified reduction and the remaining local-duality assertion. Finding its bibliographic record is not treated as reading those proofs.

The [arXiv history](https://arxiv.org/abs/1609.00345) was checked: it lists only v1, submitted 1 September 2016. It must not be confused with the companion Abhyankar paper, arXiv:1609.00320. The [journal article page](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-017-0097-9/), the [author’s homepage](https://webusers.imj-prg.fr/~yves.andre/) and exact-title/A.3.1 correction searches disclosed no correction of E4. This is a recorded search outcome, not an exhaustive novelty guarantee. No message was sent to the author.

### Pinned libraries and ownership

The fixed library baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The inherited ownership snapshot is `9311f8ee5d78d9c02aee2deac5265940129cea31`. The preceding checkpoint read the relevant atlas descriptions, proposed-roadmap/packet material and the reviewed coverage file; this continuation is not a second exhaustive catalogue audit.

The nine inherited positive items concern regular local/regular rings, regular sequences on arbitrary modules, faithful flatness and its tensor-unit test, flat transport of weak regularity, completion of the Noetherian base, and Witt DVRs. The canonical JSON records their declarations and the predecessor’s source checks. Completion of the Noetherian base is not promoted to the stronger completion-of-an-arbitrary-flat-algebra assertion.

The two new exact suppliers are in [Mathlib/CategoryTheory/CofilteredSystem.lean at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean):

- `CategoryTheory.Functor.surjective_toEventualRanges` supplies surjective maps after restricting a Mittag–Leffler functor to its eventual ranges.
- `CategoryTheory.Functor.toEventualRanges_nonempty` supplies nonempty eventual ranges for a pointwise nonempty Mittag–Leffler functor.

Their actual statements and proofs, including the cofiltered-category hypotheses, were read. Neither assumes that the underlying types are finite. In contrast, the later `eval_section_surjective_of_surjective` is in the finite-system section, and `nonempty_sections_of_finite_cofiltered_system` also requires finite underlying types. They do not apply merely because the modules have finite length. A Tau Ceti code search for `MittagLeffler` returned no match; that limited search is not an exhaustive absence certificate. The four new application adapters keep their fine library reduction inside G7.

The inherited upstream interface guidance remains Mathlib PR #22909’s `Submodule.IsPure` shape and PR #26218’s CM naming. Their predecessor checks are dated and pinned in the JSON; they are not current-status claims or declarations in the fixed baseline. Do not invent competing carriers, and do not wait for an upstream merge before developing the missing contracts in Tau Ceti.

## 3. E4: a zero-divisor counterexample to Appendix A.3.1

### 3.1 The hypotheses that matter

The published proposition starts with a local ring `(R,m)`, not necessarily Noetherian, and an element `r∈m` such that R is r-adically separated. It assumes a local endomorphism σ with R free over σ(R), the containment

`⋂_{j≥0} σ^j(m)R ⊆ rR`,

and an extension R⊂S to which σ extends injectively. Among the stated conditions are a nonzero dual `Hom_R(S,R)` and the existence of an R-linear retraction. The proof attempts to divide a nonzero functional by a power of r to make its image escape rR. There is no printed nonzerodivisor hypothesis on r.

### 3.2 The rings and endomorphisms

Let k be any field, put `A=k[[t]]` and `K=k((t))`, and form the square-zero rings

`R=A⊕εA = A[ε]/(ε²)`,

`S=A⊕εK`.

In pair notation their common multiplication law is

`(a,b)(c,d)=(ac,ad+bc)`.

The inclusion R⊂S is coefficientwise. The ring R is Noetherian local with maximal ideal `(t,ε)`; an element `(a,b)` is a unit precisely when the constant coefficient of a is nonzero. Choose `r=ε=(0,1)`. Then `r²=0`, so `⋂ r^nR=0`: R is r-adically separated despite r being a zero divisor.

Define σ on R, and τ on S, by substituting `t²` for t in both components and fixing k and ε. Substitution preserves sums and products and is injective on formal power series and Laurent series. It is local on R because it preserves the constant coefficient of the first component.

Every power series has a unique even/odd decomposition. Applying this to both components gives

`R = σ(R) ⊕ tσ(R)`

as a σ(R)-module. Thus R is free of rank two over σ(R). Moreover

`σ^j((t,ε))R=(t^(2^j),ε)`.

The intersection of these ideals is `(ε)`: the first component lies in every `t^(2^j)A` and is therefore zero, while the second component is unrestricted in εA. Hence the required intersection containment holds, in fact with equality `⋂ σ^j(m)R=rR`.

The extension S is even integral over R. For `(a,b)∈S`, the square of `(a,b)−(a,0)` is zero, so it satisfies the monic polynomial `(X−a)²`. Integrality alone therefore does not repair the faulty implication.

### 3.3 A nonzero dual but no retraction

Define `λ:S→R` by

`λ(a,b)=(0,a)`.

For `(c,d)∈R` and `(a,b)∈S`,

`λ((c,d)(a,b))=(0,ca)=(c,d)λ(a,b)`.

Thus λ is R-linear, and `λ(1)=ε≠0`. In particular the dual is nonzero.

Now let `ρ:S→R` be any R-linear map. For every positive integer N, S contains `(0,t^(−N))`, and

`ε=t^N(0,t^(−N))`.

Consequently `ρ(ε)∈t^N R` for every N. Since `R=A⊕εA` is t-adically separated,

`ρ(ε)∈⋂_N t^N R=0`.

Every R-linear map kills ε. A retraction of R⊂S would have to send ε to the nonzero element ε. No retraction exists.

There is also a direct tensor witness against purity. Since multiplication by t is surjective on K,

`R/tR ≅ k[ε]/(ε²)`, whereas `S/tS ≅ k`.

The induced map kills the nonzero ε-class. Thus this example satisfies the proposition’s hypotheses and its nonzero-dual condition while failing both splitting and purity.

This is not a counterexample to André’s main theorem: R is not regular, and S is not module-finite over R. It isolates the excessive generality of the appendix. The independent reviewer should check the proposition’s hypotheses against this construction rather than treating the finite algebra diagnostics below as a proof.

### 3.4 A sufficient corrected implication

Keep the hypotheses above and add:

**either r=0, or multiplication by r on R is injective.**

Assume R is nonzero and choose `0≠λ∈Hom_R(S,R)`.

If r=0, λ already has an image outside rR. Otherwise the set of n with `λ(S)⊆r^nR` contains 0 and is bounded: any nonzero value of λ cannot belong to every r-power because R is r-adically separated. Choose its largest n. Multiplication by r^n is injective, so every equation `r^n x=λ(s)` has a unique solution x. These solutions define an R-linear functional λ₀. Uniqueness proves additivity and scalar compatibility; maximality of n gives `λ₀(S)⊄rR`.

Choose s with `λ₀(s)∉rR`, and replace λ₀ by its precomposition with multiplication by s. We may therefore assume `λ₀(1)∉rR`. The intersection hypothesis supplies j such that

`λ₀(1)∉σ^j(m)R`.

Injectivity of τ implies injectivity of σ. Transporting the free σ(R)-module presentation along its iterates and composing free-module presentations proves that R is free over σ^j(R). The latter is a local ring, isomorphic to R, with maximal ideal σ^j(m).

In a σ^j(R)-basis expansion of λ₀(1), at least one coefficient is outside σ^j(m), hence is a unit. Only finitely many coordinates of this element are nonzero, even if the basis is infinite. Project to a unit coordinate and scale by its inverse. This gives a σ^j(R)-linear functional

`μ:R→σ^j(R)` with `μ(λ₀(1))=1`.

Finally put

`ρ=(σ^j:R≅σ^j(R))^(-1) ∘ μ ∘ λ₀ ∘ τ^j`.

For a∈R and s∈S, `τ^j(as)=σ^j(a)τ^j(s)`. The R-linearity of λ₀, σ^j(R)-linearity of μ and final inverse isomorphism yield `ρ(as)=aρ(s)`. Additivity is immediate, and `ρ(1)=1`. This is the required retraction.

The added disjunction is sufficient, not claimed necessary. It retains the r=0 equal-characteristic case and the regular-element setting of the domain applications. It does not validate the other part of A.3.1, whose use of local duality for a possibly noncomplete regular R and infinite integral S remains G6. E2, the undefined letter in the printed coordinate-functional paragraph, is a separate typographical issue.

## 4. Completing the Artinian-retraction argument of §3.4

### 4.1 Why these parameter quotients give the right limit

Fix `A=W(k)[[T_1,…,T_n]]` and write `m_A=(p,T_1,…,T_n)`. For m≥1 let

`I_m=(p^m,T_1^(p^m),…,T_n^(p^m))`.

The sequence is descending. Since `p^m≥m`, one has `I_m⊆m_A^m`. Conversely,

`m_A^(m+n(p^m−1)) ⊆ I_m`.

Indeed, a monomial in p and the n parameters of total degree `m+n(p^m−1)` cannot have p-exponent at most m−1 and every parameter exponent at most p^m−1: those upper bounds sum to one less than the specified degree. Every such monomial is divisible by a generator of I_m.

Thus I_m is m_A-primary and the I_m form a cofinal system with the maximal-ideal powers. The quotients A/I_m have finite length, and completeness of A gives `A≅lim_m A/I_m`. When n=0 the exponent bound is just m. No finiteness of the perfect residue field k is assumed.

### 4.2 Retractions are cosets in finite-length modules

Let B be finite as an A-module, with distinguished element 1. Write

`V_m=Hom_A(B,A/I_m)`,

`H_m={f∈V_m : f(1)=1}`.

An A-linear map B→A/I_m annihilates I_mB, so this is the same retraction set obtained from `B/I_mB`. Splittings modulo p^m give H_m≠∅ by further quotienting the already split inclusion by the parameter powers. It is not necessary to choose those splittings compatibly.

A finite generating family of B gives an injection `V_m→(A/I_m)^q`; hence V_m is Artinian as an A-module. The set H_m is a nonempty affine coset of the submodule `K_m={f:f(1)=0}`.

For l≥m, reduction gives H_l→H_m, and its image is a coset of the image of K_l in V_m. For fixed m these direction submodules form a descending chain. Artinianity makes the chain stabilize. The cosets themselves are nested and nonempty; once their directions agree, the cosets agree, because any point in the smaller one identifies both as its translate by that common direction.

This is exactly the stabilization used on Hochster’s p.30. The crucial property is finite **module length**, not a finite number of elements. Over an infinite k, even A/m_A is an infinite set.

### 4.3 Restrict to stable images before choosing lifts

Let E_m be the eventual image in H_m. It is nonempty. The induced map `E_(m+1)→E_m` is surjective: given x∈E_m, choose l beyond the stabilization indices for both m and m+1, lift x from H_l, and map that lift to H_(m+1). Its image lies in E_(m+1) and maps to x.

The two cited Mathlib declarations already express these nonemptiness and surjectivity conclusions for eventual ranges. Use them after proving the algebra-specific stabilization lemma; do not introduce a second Mittag–Leffler carrier.

Choose a point of E_1 and, recursively, a preimage under each surjection. The resulting f_m are compatible. This is a countable recursive-choice argument; it is not a general assertion that arbitrary surjective diagrams of nonempty sets have nonempty limits.

### 4.4 Recover the actual A-linear functional

For b∈B, the values f_m(b) form a compatible element of `lim_m A/I_m`. Let ρ(b) be its unique preimage in A. Equality in A can be checked in all those quotients, so additivity, A-linearity and `ρ(1)=1` follow componentwise. The same argument gives uniqueness for a prescribed compatible family.

Finite generation of B was used to make V_m Artinian. It is not needed for this last Hom/target-limit step. In particular there is no need to insert an additional theorem `B≅lim_m B/I_mB` into this proof.

The JSON now separates parameter cofinality, coset stabilization, countable compatible choice and functional reconstruction. These four adapters route to the existing proposed `DirectSummandsAndBigCohenMacaulay` direction. The two general eventual-range results are library items and need no route.

## 5. The inherited architecture and its unresolved boundaries

The five routes are retained rather than replacing the previous design.

**DirectSummandsAndBigCohenMacaulay** owns ordinary module/ring purity, splitting obstructions, Noetherian-base completion and annihilator tools, Hochster reductions, Artinian retractions, bounded modifications and the direct-summand/big-CM applications. With the five new missing items, that route takes 50 missing items. The finite depth/CM substrate comes from `DeformationAndDerivedPatchingAlgebra:R03.3`, not a duplicate predicate. The corrected A.3.1 implication is an additional theorem within this same direction.

**PerfectoidSpaces:P0** supplies the generic almost bases, adjoints, reframing, tensor/Hom interfaces and almost-purity comparison. Its source route has ten items, four planned and six missing. Ordinary purity must precede the almost-purity comparison; later commutative-algebra applications consume P0. Record stage-level dependencies so this does not become a false coarse roadmap cycle.

**PerfectoidSpaces:P1–P2** owns the cyclotomic perfectoid example and the integral rational-localization model. The field k in the cyclotomic construction need not be finite, so a locally compact local-field result is not an exact supplier for the whole assertion.

**PerfectoidRamification** is the *same* Part II id and title already proposed by `PAPER-ANDRE-18`. Its nine missing items cover the specified normalized Kummer tower, tubular comparison, almost flatness, finite-level purity, actual left-adjoint flat model and ramified integral closure. This is not a second root-algebra or Abhyankar project. `PerfectoidQuotients:Q3` constructs a related existential p-completely faithfully flat absolutely-integrally-closed extension; it does not, merely by name, identify that extension with André’s specified normalization.

**DeformationAndDerivedPatchingAlgebra:R03.3** receives the ordinary finite CM/depth consumer as a source. Big-CM existence for arbitrary algebras does not belong to its finite-module substrate alone.

Several mathematical distinctions from the first checkpoint remain essential. Theorem 2.5.2 uses the valuation almost ideal; the ramified almost-purity application also involves roots of g. The actual algebra left adjoint `!!` is not the module adjoint `!`. Its flat model contains the products `(ϖg)^(1/p^h)` without thereby containing each g-root separately. In §3.3 the nonzero contraction witness `pg mod p^m` is used for m≥2; the m=1 splitting follows by reduction. In §4.2 the choice p² likewise preserves the noncontainment witness and must not be silently changed to p.

The bounded partial-modification carrier remains held. An arbitrary module-valued polynomial cannot be multiplied as though it were a ring element. Hochster 2002 Lemma 5.1, the denominator estimate, the no-bad-chain argument and Bartijn–Strooker’s balancing theorem still require exact source work. The finite-module Auslander–Buchsbaum formula alone does not prove that an arbitrary balanced big-CM algebra over a regular local ring is faithfully flat; the source’s Tor argument is a separate requirement. Global product-flatness needs the Noetherian/coherent hypothesis. The pure local completion test must cover arbitrary finitely presented modules over the completed base, not just descended ones. Theorem 4.4.2 retains its regular target and separable residue extension.

The published main results are the direct-summand theorem (0.1.1), balanced big-CM existence (0.7.1), and flat domination of finite regular-ring extensions (0.7.2, printed p.75; proof §4.3). Full unqualified weak functoriality is not asserted by this paper. Existing introductory equivalences, several Banach and tower facts, and the remaining lower-level supplier audit are explicitly still missing from a complete extraction.

## 6. Source issues and review instructions

E1–E3 are retained: the incorrect scalar subscript on the dual in A.2.1(4), the undefined letter in A.3.1’s coordinate-functional paragraph, and the missing prime on the right-hand almost-CM base in 4.4.1. They are typographical issues. E4 is different: it changes a stated implication and has an explicit counterexample.

The reviewer should independently verify the six ingredients of E4: locality and separation; freeness over the endomorphism image; the intersection equality; the injective extension of the endomorphism; the nonzero R-linear functional; and the obstruction to any retraction. The corrected proof should be checked independently too, especially unique division, iterated freeness and the final semilinear composition. Nothing here is marked confirmed by the authoring worker.

The result remains partial after these checks because proof of these two portions is not proof of all the paper’s supplier claims. G3 and G6 are narrower, not closed. No source was silently corrected, no review verdict was authored, and no correspondence with the paper’s author was initiated.

## 7. Validation and reproducible diagnostics

No Lean file was created or compiled. API and test entries are planning contracts, not executable Lean proofs. The continuing worker ran **15,066 exact finite algebra identity checks** over F₂, F₃ and F₅, using Laurent polynomials without truncating negative exponents. Those checks support the square-zero multiplication, substitution, linearity, even/odd decomposition and divisibility identities. They do not prove localness, completeness, infinite intersections or nonexistence of a retraction; those are proved in Section 3.

The predecessor reported successful repository checker/unit runs and 3,646 finite diagnostics. Those executions belong to #2210 and are not represented as runs on this revision. The script below preserves those diagnostic families and updates the structural expectations. Its full JSON/graph part is supplied for a checkout; it was not locally run by this browser worker, whose clone attempt failed at DNS resolution. The PR’s actual swarm check runs the repository’s `check_paper.py` and intake validation on the committed files. Consult that check for its outcome.

```python
import collections
import json
import math
from pathlib import Path
from random import Random

path = Path('research/blueprint/papers/PAPER-ANDRE-18-B.result.json')
data = json.loads(path.read_text(encoding='utf-8'))
items = {x['id']: x for x in data['items']}
assert len(items) == len(data['items']) == 83
assert collections.Counter(x['status'] for x in items.values()) == {
    'library': 11, 'planned': 7, 'missing': 65
}
taken = collections.Counter(i for r in data['routes'] for i in r['items'])
assert all(taken[i] == 1 for i, x in items.items() if x['status'] == 'missing')
definitions = [x for x in items.values() if x['kind'] in ('definition', 'construction')]
assert len(definitions) == 18
assert all(x.get('api') and x.get('uses') and len(x.get('tests', [])) >= 3
           for x in definitions)
assert sum(len(x['tests']) for x in definitions) == 54
active, done = set(), set()
def visit(i):
    assert i in items
    assert i not in active, i
    if i in done:
        return
    active.add(i)
    for j in items[i].get('dependencies', []):
        visit(j)
    active.remove(i)
    done.add(i)
for i in items:
    visit(i)
assert sum(len(x.get('dependencies', [])) for x in items.values()) == 62
assert len(data['coverageGaps']) == 8
assert len(data['sourceIssues']) == 4
assert data['status'] == 'partial'

# Retained diagnostics from checkpoint #2210, not proofs of general theorems.
ann_checks = 0
for n in range(2, 49):
    divisors = [a for a in range(1, n + 1) if n % a == 0]
    for a in divisors:
        for b in divisors:
            if math.gcd(b*b, n) != b or b % a:
                continue
            for s in range(0, n, b):
                assert any(((1-r)*s) % n == 0 for r in range(0, n, a))
                ann_checks += 1
pg_checks = 0
for p in (2, 3, 5, 7):
    for m in range(2, 6):
        for g in range(1, 65):
            if g % p:
                assert (p*g) % (p**m) != 0 and (p*g) % p == 0
                pg_checks += 1
split_checks = 0
for n in range(2, 13):
    for a in range(n):
        b = (1-a) % n
        for r in range(n):
            assert (a*r+b*r) % n == r
            split_checks += 1
assert (ann_checks, pg_checks, split_checks) == (2269, 728, 649)

# Exact Laurent-polynomial checks for E4; no finite quotient of K is invented.
rng = Random(2188)
checks = 0
def add(a, b, p):
    return {i: c for i in a.keys() | b.keys()
            if (c := (a.get(i, 0) + b.get(i, 0)) % p)}
def mul(a, b, p):
    out = {}
    for i, x in a.items():
        for j, y in b.items():
            out[i+j] = (out.get(i+j, 0) + x*y) % p
    return {i: x for i, x in out.items() if x}
def smul(r, s, p):
    a, b = r
    c, d = s
    return mul(a, c, p), add(mul(a, d, p), mul(b, c, p), p)
def sadd(r, s, p):
    return add(r[0], s[0], p), add(r[1], s[1], p)
def sig(s):
    return tuple({2*i: c for i, c in a.items()} for a in s)
def lam(s):
    return {}, s[0]
def sample(p, lo, hi):
    return {i: c for i in range(lo, hi+1) if (c := rng.randrange(p))}
def check(a, b):
    global checks
    assert a == b, (a, b)
    checks += 1
for p in (2, 3, 5):
    for _ in range(1000):
        r = (sample(p, 0, 3), sample(p, 0, 3))
        s = (sample(p, 0, 3), sample(p, -3, 3))
        z = (sample(p, 0, 3), sample(p, -3, 3))
        check(sig(smul(s, z, p)), smul(sig(s), sig(z), p))
        check(sig(sadd(s, z, p)), sadd(sig(s), sig(z), p))
        check(lam(smul(r, s, p)), smul(r, lam(s), p))
        check(lam(sadd(s, z, p)), sadd(lam(s), lam(z), p))
        even = tuple({i//2: c for i, c in a.items() if i % 2 == 0} for a in r)
        odd = tuple({(i-1)//2: c for i, c in a.items() if i % 2 == 1} for a in r)
        check(r, sadd(sig(even), smul(({1: 1}, {}), sig(odd), p), p))
    eps = ({}, {0: 1})
    check(smul(eps, eps, p), ({}, {}))
    check(lam(({0: 1}, {})), eps)
    for n in range(1, 21):
        check(smul(({n: 1}, {}), ({}, {-n: 1}), p), eps)
assert checks == 15066
print('structure: 83 items, 65 missing routed once, 18 APIs, 54 tests, 62 acyclic edges')
print('finite diagnostics: 3646 retained cases and 15066 square-zero identity checks')
print('These computations certify neither the general theorems nor Lean elaboration.')
```

The handoff identifies the next exact sources and limits of this checkpoint. The unresolved tasks are mathematical source/API work, not permission to assume their conclusions.
