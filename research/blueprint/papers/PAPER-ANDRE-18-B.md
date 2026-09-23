# PAPER-ANDRE-18-B — direct summands and big Cohen–Macaulay algebras

Author: Codex, session codex-a71f92. Issue #2188. First checkpoint, 23 September 2026.
Status: partial. This is an extraction and routing proposal, not a formalization.

## 1. Result and coverage boundary

The published paper proves that a finite faithful commutative algebra over a Noetherian regular ring admits a linear retraction to the base. It also proves existence of balanced big Cohen–Macaulay algebras for every Noetherian local ring, and domination of finite extensions of regular rings by faithfully flat algebras. Its final descent theorem assumes a pure local mixed-characteristic extension, a regular target, and separable residue-field extension. Full weak functoriality of big Cohen–Macaulay algebras is posed as a problem in §4.4, not proved without qualifications.

The entire published article, including the appendix and bibliography, was read. The machine-readable extraction currently contains 76 items: 9 library, 7 planned and 60 missing. Every missing item has exactly one route. All 18 definitions and constructions carry use-derived API outlines and three tests each, giving 54 planning tests. A selected dependency spine has 55 edges and is acyclic. It is deliberately not a closed graph: eight coverage gaps name omitted source material, exact external inputs, and required proof decompositions.

Whole-text reading is not the same as complete extraction. In particular, the introduction’s equivalences and homological consequences, the detailed Banach preliminaries, several tower remarks, the bounded modification construction and Appendix A.3 are not certified by this checkpoint. The two held claims are not usable items. A checker pass must not be interpreted as resolving these mathematical gaps.

## 2. Source provenance

The source is the [published Numdam PDF](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Yves André, La conjecture du facteur direct, Publications Mathématiques de l’IHÉS 127 (2018), 71–93, DOI 10.1007/s10240-017-0097-9. It was fetched on 23 September 2026; its SHA-256 is 34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053. It has 23 pages. PDF page 1 is printed page 71.

All 1,132 extracted text lines were read. Because text extraction drops hats, primes, intersections and exponents, page images were additionally checked for printed pages 79–88 and 90–91. This established the two different almost bases, the exponent p^m on the Artinian parameter quotients, the p² choice in §4.2, and the target/residue hypotheses in 4.4.2.

The [journal metadata](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-017-0097-9/) identifies the published article directly. The [arXiv page](https://arxiv.org/abs/1609.00345) lists a 2016 v1; it is not the version used for locators. The companion Abhyankar paper is arXiv:1609.00320, DOI 10.1007/s10240-017-0096-x, and must not be confused with this paper.

The exact baseline pins are recorded in JSON:

- Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
- Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
- Atlas snapshot used for ownership: 9311f8ee5d78d9c02aee2deac5265940129cea31.

The full upstream AdicSpaces and LocalFieldsRamification roadmap documents were read. Their useful discipline here is explicit carrier reuse, hypotheses on completion and nonarchimedean norms, and separation of an infinite perfectoid tower from arithmetic of one finite local-field extension. The residue field k in André’s construction is only perfect, not necessarily finite, so the locally compact local-field setting cannot be substituted for the whole cyclotomic-field input.

## 3. Library and ownership audit

The reviewed coverage file supplies AUDIT-17, reviewed by REV-AUDIT-17, for DeformationAndDerivedPatchingAlgebra:R03.1–R03.3 and R03.5. It marks regular sequences as built, and CM/depth infrastructure as absent or partial. There are no reviewed rows in that file for PerfectoidSpaces, PerfectoidQuotients or AdicSpacesPartII at the recorded snapshot. Unreviewed audit leads were not promoted to baseline evidence.

Actual source statements were read for the following positive claims.

| Contract | Pinned declaration and file |
|---|---|
| Regular local and regular ring predicates | IsRegularLocalRing and IsRegularRing, Mathlib/RingTheory/RegularLocalRing/Defs.lean |
| Weak and ordinary regular sequences on arbitrary modules | RingTheory.Sequence.IsWeaklyRegular and IsRegular, Mathlib/RingTheory/Regular/RegularSequence.lean |
| Faithful flatness and proper-ideal criterion | Module.FaithfullyFlat and iff_flat_and_proper_ideal, Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean |
| Tensor unit detects zero for a faithfully flat algebra | Module.FaithfullyFlat.one_tmul_eq_zero_iff, same file |
| Weak regularity under flat base change | RingTheory.Sequence.IsWeaklyRegular.of_flat_of_isBaseChange, Mathlib/RingTheory/Regular/Flat.lean |
| Flatness of completion of a Noetherian base ring | AdicCompletion.flat_of_isNoetherian, Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean |
| Witt vectors of a perfect field form a DVR | WittVector.isDiscreteValuationRing, Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean |

Three tempting matches are not exact suppliers. Ideal.Pure means that R/I is flat; it is not the general pure-module-map predicate. The universally injective scheme-morphism predicate is about geometric points and residue extensions, not tensor injectivity of ring maps. Finally, completion of a Noetherian ring is a special case of Lemma 1.1.1, not its full assertion for a possibly non-Noetherian flat algebra S over Noetherian R. The finite-module completion/base-change equivalence in AsTensorProduct.lean likewise does not remove that mismatch.

The source trees were searched for ordinary pure submodules/maps, CM and big-CM predicates, and the stated tower/application material. This checkpoint does not claim that every lower-level commutative-algebra supplier is missing: G7 calls for the remaining fine audit of Ext, Tor, Artin–Rees, Krull intersection, normalization and coherent colimits.

An upstream-development search found [Mathlib PR #22909](https://github.com/leanprover-community/mathlib4/pull/22909), open at c2ab6bbf5e75dfa6ab145d538e276a883e0af724. Its full Pure.lean was read. The proposed carrier is Submodule.IsPure, with algebra base-change tests, an arbitrary-universe baseChange_injective theorem and a complemented-submodule theorem. The new work must use that shape and prove the module-test/algebra-test comparison; it must not create a competing PureLinearMap carrier. This open PR is not part of the pinned baseline.

[PR #26218](https://github.com/leanprover-community/mathlib4/pull/26218), open at a455cf35efd99183700c2401b40cd070ce5f8a33, proposes ModuleCat.IsCohenMacaulay and IsCohenMacaulayLocalRing. Its opening declarations were read as interface guidance for R03.3, not counted as implementation. Historical Zulip discussion of commutative-algebra coverage is only a search lead, not a current absence certificate. No external implementation is copied.

### Route decisions

1. DirectSummandsAndBigCohenMacaulay is a new commutative-algebra direction. Its 45 missing items comprise ordinary purity, completion/annihilator tools and the direct-summand/big-CM applications. R03.3 supplies the finite CM/depth substrate, but has no big-CM existence or direct-summand target. Neither the adic-space roadmap nor the perfectoid-quotient roadmap owns these application theorems.
2. PerfectoidSpaces:P0 receives ten items, six missing and four planned, on generic almost purity, Hom lifting, Ext annihilation, adjoints and reframing. The ordinary purity prefix is imported from the new direction. Generic almost objects are not redeclared.
3. PerfectoidSpaces:P1–P2 receives the two already-planned cyclotomic and rational-localization inputs.
4. PerfectoidRamification receives nine missing tower/ramification interfaces. This is exactly the id, parent and title of the Part II already proposed by PAPER-ANDRE-18. It is not yet an atlas roadmap or a roadmap-definition file, so these entries cannot be called planned at this snapshot. The design is shared; this source adds the normalized Kummer flatness/application adapters without duplicating its generic root algebra, tubular comparison or Abhyankar theorem.
5. DeformationAndDerivedPatchingAlgebra:R03.3 receives the already-planned ordinary CM predicate/characterization as a source consumer.

PerfectoidQuotients:Q3 is deliberately not an exact supplier for Theorem 2.5.2. Q3 constructs an existential p-completely faithfully flat integral-perfectoid extension that is absolutely integrally closed, following the later prismatic route. André 2.5.2 concerns one specified normalized Kummer extension and valuation-almost faithful flatness. An equivalence or alternative proof would require a mathematical comparison, not a shared name.

The stage order matters. Ordinary purity and Noetherian-base completion can be built before the additional P0 almost-purity comparisons and before the Kummer application. The later direct-summand stage consumes those outputs. A coarse mutual roadmap import is not a license to create a declaration cycle.

## 4. The two almost bases and the direct-summand argument

Fix a perfect field k of characteristic p, A=W(k)[[T_1,…,T_n]], and a nonzero g∈A. Let K_j=Frac(W(k))(ζ_(p^j)) with compatible roots. The generic root algebra A_jk adjoins coordinate p^j-roots and a p^k-root of g before inverting p; its integral model A_jk° is the integral closure of A in that algebra. It must not be identified with the naive root quotient without proof. Even the generic algebra need not be a domain, as g=1 at a level containing the relevant roots of unity shows.

The coordinate tower at k=0 has finite faithfully flat transition maps and explicit integral models. Its completed generic algebra is perfectoid. The normalized root extension is described through the completed colimit of tubular neighborhoods of U=g in the perfected Tate ball. Theorem 2.5.2 gives almost faithful flatness over the uncompleted integral coordinate union A_∞0°.

At this point the almost ideal is the valuation ideal K_∞°°. It does not involve g. The proof passes through compatible-root approximations of U−g, the same tubular localization, explicit finite-stage integral presentations, generic-fibre flatness and a monic special-fibre relation. Nonzero residue fibres supply faithfulness. The completed colimits must be checked relative to each finite Noetherian stage. Lemma 1.1.1 does not allow one to pretend that A_∞0° is Noetherian.

The algebra left adjoint produces an actual faithfully flat algebra

S = (Â_∞∞°^a)_!! = A_∞0° + K_∞°° Â_∞∞°.

The algebra !! is not the module !. S contains and is stable under the products (ϖg)^(1/p^h); this does not assert that S contains every g-root separately. This distinction explains the smaller almost base used in Corollary 3.2.2.

Now let A⊂B be finite. After the specified reduction, choose g∈A outside pA such that B[1/(pg)] is finite étale over A[1/(pg)]. Let D be the integral closure of C°=Â_∞∞° in B⊗_A C[1/g]. The companion’s ramified Abhyankar theorem gives almost faithful flatness of C°/p^m→D/p^m. Here the almost base has changed: its ideal is generated by products of g-roots and the valuation ideal. A finite-étale statement alone needs its faithful/nonzero-fibre qualification before it supplies this assertion.

The map B⊗_A S→D and the reframing of almost modules give almost purity of S/p^m→(B⊗_A S)/p^m. This is a factorization argument, not a claim that B⊗S is normal or finite étale integrally.

For m≥2, write R=A/p^m and e for the extension class of

0 → R → B/p^m → (B/p^m)/R → 0.

R is Noetherian and the quotient is finite, so a finite-free resolution through the required degrees gives flat Ext base change. Appendix A.4.1 shows that the ramified root ideal kills the base-changed class. Apply Lemma 1.1.2 to the finite cyclic module R e and the faithfully flat algebra S/p^m. The contraction of the idempotent ideal contains pg modulo p^m, which is nonzero because g∉pA and m≥2. Thus e=0. At m=1 this particular element is zero; use reduction of a splitting at a higher exponent.

The annihilator lemma is stronger than an argument valid only over a domain. It yields (1−r)s=0 for r∈Ann_R(M). If R is local and M≠0, then r lies in the maximal ideal, so 1−r is a unit. A nonzero s gives the contradiction even when s is a zero divisor.

One still needs an integral retraction. Independently chosen splittings modulo p^m need not be compatible. Section 3.4 passes to A/(p^m,T_1^(p^m),…,T_n^(p^m)); these are Artinian quotients. The retraction sets are torsors under finite modules over those quotients. Their images stabilize, giving a Mittag–Leffler construction of a compatible system. The exact proof and comparison with the inverse limit of finite B remain G3; the extraction does not replace this step by unproved surjectivity of transition maps. Hochster’s reduction from arbitrary regular Noetherian rings to this complete unramified base is another required supplier.

## 5. Big Cohen–Macaulay algebras

There are three distinct predicates in Definition 4.1.1. Big CM for one parameter system requires both its regularity on C and m_B C≠C. Balanced big CM quantifies over all systems of parameters. Almost big CM fixes compatible p-power roots of a nonzerodivisor π, lets J be their generated ideal, requires J to annihilate all parameter colon quotients, and requires J⊄m_B C. Merely requiring C≠m_B C is weaker than this last almost condition.

These predicates apply to arbitrary B-algebras. No finite-module or Noetherian hypothesis on C may be inserted. They reuse Mathlib’s regular-sequence predicate. For example, the fraction field of a DVR fails the nontriviality condition although multiplication by its parameter is injective. Polynomial algebras over a regular local ring provide nonfinite-module balanced examples by faithful flatness.

Proposition 4.1.2 goes from almost big CM to balanced big CM by bounded partial modifications and completion. The precise module construction, its distinguished element, the denominator estimate from Hochster 2002 Lemma 5.1, and the balancing theorem of Bartijn–Strooker must be supplied. The printed vector-polynomial notation cannot be turned into multiplication of two arbitrary module-valued polynomials. Accordingly, this construction is held, rather than represented by a guessed usable definition. Likewise, no unverified strengthened factorization through the original D is used.

Lemma 4.1.3 provides two routes to almost CM after a finite local extension A⊂B with A CM. The first uses comparison with a faithfully flat A-algebra and nonzero contraction of πD. The second works modulo x_1, requiring D to be x_1-torsion-free and (πD)∩A not contained in x_1A. The comparison algebra need not contain B.

In §4.2, x_1=p² is intentional. For the ramified integral model D and π=ϖg, the contraction of πD supplies pg, which survives modulo p² because g∉pA. The p²-reduction of D has an almost-isomorphic faithfully flat comparison algebra. Lemma 4.1.3(b), followed by the modification theorem, yields the balanced big-CM algebra. Replacing p² by p would remove the noncontainment witness in this argument.

A balanced big-CM algebra over a regular local A is faithfully flat even when it is not a finite A-module. The paper’s footnote uses bounded projective dimension of finite modules and descending Tor vanishing. Citing the finite-module Auslander–Buchsbaum formula alone does not prove this assertion.

For the global flat-domination theorem, complete R at each maximal ideal, normalize the finite algebra over that complete regular local base, and choose big-CM algebras on the resulting local factors. Their product is R-flat because R is Noetherian, hence coherent; the nonzero maximal fibres give faithfulness. No finiteness of T or S-flatness of T is claimed.

Finally, Proposition 4.4.1 takes an already compatible almost-CM square, with δ(π_h) dividing π′_h for every h, to a compatible big-CM square. The construction is existential. Theorem 4.4.2 requires the regular target and separable residue extension. Later results mentioned in §0.8 are not grounds for strengthening the theorem extracted here.

## 6. Source issues and unresolved checks

Three image-verified typographical findings are recorded in sourceIssues, awaiting independent review.

- E1: the dual in A.2.1(4) must be R-linear, not S-linear. R has no given S-module structure. The generator-to-splitting proof can be written using finitely many evaluations summing to one: ρ(t)=Σ_i λ_i(s_i t). It does not require a preselected single evaluation with value one.
- E2: the linear form in A.3.1 is on the chosen finite free summand M; the printed N is undefined.
- E3: the primed almost-CM triple in 4.4.1 is over B′, not B.

The journal page, arXiv history, author page and exact-title correction searches yielded no existing correction link. “new” means no correction was found in those searches, not that novelty is independently established. No author contact was made.

The remaining questions about A.3.1 are not reported as discovered errors: its r-adic division and local-duality steps require checking against Hochster’s source. The absolute integral closure application is held too. Similarly, questions about the exact modification/factorization proof are extraction gaps, not an allegation that the headline existence theorem is false.

## 7. Validation and next work

The result passes check_paper.py. The custom structural checks enforce all 60 missing routes exactly once, all 18 API/use/test blocks, reference integrity and acyclicity of the 55 selected edges. The finite diagnostics perform 2,269 instances of the idempotent-annihilator conclusion in cyclic rings, 728 checks of the pg witness, and 649 checks of linear diagonal splittings: 3,646 finite cases total. They are regression diagnostics, not proofs of the general statements.

No Lean was created or compiled: this paper issue authorizes JSON, report and handoff only. API names outside the cited pinned declarations are proposed contracts, including upstream-PR interface guidance, not claims of implementation. The 54 mathematical tests are planning specifications, not an elaborated Lean test suite.

Resume with G3 and G4: read the precise Hochster and Bartijn–Strooker inputs, give the retraction-torsor construction and bounded modification algebra their declaration-sized statements, and then finish G0–G2 and G5–G7. The source and item ids in this checkpoint should be preserved where the mathematical contract remains the same. The existing companion paper files and other roadmap files are outside this issue’s edit scope.

### Reproducible diagnostics

Run this standard-library-only Python script with the result JSON path as its sole argument. The repository regression tests and intake checks are listed in the handoff.

```python
"""Structural and finite algebra diagnostics, not proofs of the paper."""
import collections
import json
import math
import sys
from pathlib import Path

path = Path(sys.argv[1])
data = json.loads(path.read_text())
items = {x["id"]: x for x in data["items"]}
assert len(items) == len(data["items"]) == 76
assert collections.Counter(x["status"] for x in items.values()) == {
    "library": 9, "planned": 7, "missing": 60
}
taken = collections.Counter(i for r in data["routes"] for i in r["items"])
assert all(taken[i] == 1 for i, x in items.items() if x["status"] == "missing")
definitions = [x for x in items.values() if x["kind"] in ("definition", "construction")]
assert len(definitions) == 18
assert all(x.get("api") and x.get("uses") and len(x.get("tests", [])) >= 3
           for x in definitions)
assert sum(len(x["tests"]) for x in definitions) == 54
active, done = set(), set()
def visit(i):
    assert i in items
    assert i not in active, i
    if i in done:
        return
    active.add(i)
    for j in items[i].get("dependencies", []):
        visit(j)
    active.remove(i)
    done.add(i)
for i in items:
    visit(i)
edges = sum(len(x.get("dependencies", [])) for x in items.values())
assert edges == 55
assert len(data["coverageGaps"]) == 8
assert len(data["sourceIssues"]) == 3
assert data["status"] == "partial"

# Lemma 1.1.2 with S=R=Z/n, M=R/(a), K=(b).
# a,b divide n. K^2=K iff gcd(b*b,n)=b.
ann_checks = 0
for n in range(2, 49):
    divisors = [a for a in range(1, n+1) if n % a == 0]
    for a in divisors:
        for b in divisors:
            if math.gcd(b*b, n) != b or b % a:
                continue
            for s in range(0, n, b):
                assert any(((1-r)*s) % n == 0 for r in range(0, n, a))
                ann_checks += 1

# Why m>=2 is used: pg is nonzero modulo p^m when p does not divide g.
pg_checks = 0
for p in (2, 3, 5, 7):
    for m in range(2, 6):
        for g in range(1, 65):
            if g % p:
                assert (p*g) % (p**m) != 0
                assert (p*g) % p == 0
                pg_checks += 1

# Linear splittings of the diagonal R -> R x R.
# rho(x,y)=a*x+b*y with a+b=1; multiplicativity is not required.
split_checks = 0
for n in range(2, 13):
    for a in range(n):
        b = (1-a) % n
        for r in range(n):
            assert (a*r+b*r) % n == r
            split_checks += 1
assert (2*1) % 2 == 0  # tensor witness against purity of 2Z -> Z
print("structure: 76 items, 60 missing routed once, 18 APIs, 54 tests, 55 acyclic edges")
print(f"finite diagnostics: annihilator={ann_checks}, pg={pg_checks}, splittings={split_checks}")
print("These computations do not certify the general theorems or Lean elaboration.")
```
