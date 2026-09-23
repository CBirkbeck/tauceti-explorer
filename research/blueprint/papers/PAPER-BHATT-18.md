# PAPER-BHATT-18 — direct summands and the derived variant

Agent: Codex. Session: codex-hjdg0j. Issue: #2182. Status: **partial checkpoint**.

Bhatt proves that a finite injective extension of a Noetherian regular ring splits as a module map, and that the unit into the coherent cohomology of any proper surjective scheme over that ring splits in the derived category. The second assertion requires control of the whole complex. Splitting its zeroth cohomology would not suffice.

The main public paper has been read completely. The JSON contains 64 items: 7 library imports, 11 planned imports, and 46 missing items, each of the last group routed exactly once. It has nine routes, definition/construction APIs and mathematical tests, a dependency graph, eight source findings, and nine gap groups. This is **not** a completed extraction: cited-input closure, some declaration-level proof decomposition, and full published-version collation remain unfinished. None of the proposed mathematics is claimed to be formalized.

## Sources and reading boundary

The primary source is [arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2), dated 11 November 2017, 12 PDF pages. All sections, footnotes and references were read. Rendered pages 1, 9 and 11 were checked for the three Bhatt findings. The [publisher page](https://link.springer.com/article/10.1007/s00222-017-0768-7) identifies the article as *Inventiones Mathematicae* 212 (2018), 297–317, published online 15 November 2017. Its public abstract, references and footnotes match the public version's organization and inputs. The full journal text was not available in this reading: no line-by-line equivalence with the journal article is asserted.

The maintainer's adjacent source is **PAPER-ANDRE-18-B**, *La conjecture du facteur direct*. Its complete 15-page [arXiv v1](https://arxiv.org/pdf/1609.00345v1) was read. The [published article](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), *Publications Mathématiques de l'IHÉS* 127 (2018), 71–93, was obtained and §2.5, pp. 79–82, and Appendix A, pp. 89–92, were compared. The rest of that 23-page publication was not independently reread. Published pp. 90–92 were also inspected as rendered pages.

Selected original proofs were checked in [Scholze, *Perfectoid spaces*](https://www.math.uni-bonn.de/people/scholze/PerfectoidSpaces.pdf): Lemma 6.4, Corollary 6.7, Proposition 6.14 and Theorem 7.9. The existing accepted, partial PerfectoidSpaces decomposition supplies a finer proof graph for these results. Its underlying gaps remain gaps; reading its review does not establish all its original-source leaves anew.

All four PDFs were retrieved on 23 September 2026:

| Document | SHA-256 |
|---|---|
| Bhatt arXiv v2 | 08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430 |
| André arXiv v1 | 57a439666e580a6ef58229d706a33d4c4a93ff248e77bc627f2464cf593a41f0 |
| André published | 34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053 |
| Scholze author PDF | 2c7e645a4ec3c56d5ee9e012cfe52d99e45973eefb99f8383e3bb69f0211afd9 |

## The proof and its interfaces

Section 2 adjoins compatible roots of a specified element by shrinking rational neighborhoods of its graph in a perfectoid root disc. Almost faithful flatness is proved for each neighborhood modulo the pseudouniformizer and then passed to the completed colimit. The integral convention matters: the preliminary model may need the almost-elements normalization in footnote 6. Lemma 2.6 explains why the root-relation presentation can be interpreted in the derived sense. Its proof uses discreteness of the perfection of a simplicial characteristic-p algebra; that original input still needs source closure.

Section 3 introduces an almost-zero condition for towers with quantifiers: for every root index k and level n, there exists a later level m(n,k). It is weaker than being zero in the pro-category of almost modules, where one later level must work for all roots. Example 3.3 supplies the distinction. Lemmas 3.4–3.6 connect it to derived inverse limits and arbitrary A-linear functors. No exactness of that functor is assumed. A coherent cone and inverse-limit interface is still needed to make the short source arguments declaration-sized.

Section 4 gives the estimate that drives both splitting proofs. In the almost category for roots of t, the map A/t^m→A⟨t^n/g⟩/t^m has almost-zero kernel, while cokernel transitions are killed by g^(1/p^k) after **c=p^k m** steps, independently of n. Combining the two almost bases gives the assertion for roots of tg. The monomial proof divides at exponent e=1/p^k: large exponents acquire t^m, while smaller exponents are converted into base-ring elements by the root relation.

Remark 4.3 extends this to derived tensor and gives vanishing of nonzero Koszul homology for a **regular sequence**. A comparison for an arbitrary sequence does not itself make the source homology vanish. Remark 4.4 uses a universal root variable and derived base change to remove the regularity assumption on g from the final almost-pro-isomorphism. It does not automatically remove that hypothesis from every separate pointwise assertion.

Section 5 first lifts flatness from a complete reduction, then constructs perfectoid covers of regular local rings. The ramified construction initially gives a general integral perfectoid ring. Adjoining roots of a unit and normalizing produces the field-based convention. The two outputs of Proposition 5.2 must stay separate: positive Tor is almost zero, and almost vanishing after tensor detects zero **ordinary** modules.

For the finite splitting theorem, a nonzero connecting morphism is detected modulo a power of p. Krull intersection chooses a root small enough to preserve it after almost faithfully flat extensions. Each rational annulus almost kills the obstruction by almost purity. The quantitative tower theorem and the A-linear Hom lemma remove the inverse-limit obstruction and yield a contradiction. The p²g-to-pg annihilator calculation and the complete-local reductions remain explicit proof-decomposition tasks.

Section 6 uses proper coherent cohomology, its perfectness over a regular local base, and a generic multisection. The corresponding annular assertion is Proposition 6.2. After almost purity reduces its generic fiber to an isomorphism, an admissible blowup dominates the completed proper map. The integral perfectoid generic fiber maps through that model, and all-degree almost acyclicity yields an almost left inverse. This requires the non-Noetherian formal-model theorem cited from GR2, not just invariance of a known blowup's generic fiber.

## Ownership and routes

The full upstream **AdicSpaces** and **JacobianChallenge** roadmaps were read for comparison. Full current PerfectoidSpaces, PerfectoidQuotients, DerivedDeRhamCohomology and EnhancedDerivedSheaves documents were read, together with the pertinent commutative-algebra, formal-model and scheme stages. The reviewed AUDIT-17, AUDIT-22 and AUDIT-01 entries listed in the JSON were checked. No reviewed library-coverage entries for PerfectoidSpaces, PerfectoidQuotients or DD.1 were found at this snapshot; their decompositions are not being mislabeled as those audits.

| Route | What it receives |
|---|---|
| PerfectoidSpaces P0–P3 | Almost-pro definitions and estimates, derived rational presentations, and imports for integral conventions, approximation, acyclicity and almost purity |
| PerfectoidQuotients Q0:integral-algebra, Q3 | General integral convention, the geometric root-adjoining proof and the source's functorial AIC variant |
| DerivedDeRhamCohomology DD.1 | Generic Koszul/completion interfaces and Proposition 5.1's complete flatness and faithfulness |
| EnhancedDerivedSheaves E1, E2, E5:animation | Splitting-obstruction triangles, coherent derived towers and simplicial perfection discreteness |
| DeformationAndDerivedPatchingAlgebra R03.1 | Finite adic Hom pro-comparison and vanishing lim-one |
| SchemeAndStackFoundations SF.2, SF.4 | Requests for proper coherent cohomology, integral global functions and generic multisections |
| AdicSpacesPartII R2 | Request for non-Noetherian admissible blowup domination and integral generic-fiber factorization |
| Pending **PerfectoidRamification**, Part II of PerfectoidSpaces | Quantitative Riemann extension and its derived/uniform refinements |
| Proposed **RegularRingSplittings**, Part II of DeformationAndDerivedPatchingAlgebra | Regular local perfectoid covers, obstruction argument, and both final splitting theorems |

The quantitative route reuses the **same pending PerfectoidRamification proposal** already made in PAPER-ANDRE-18, the *Abhyankar lemma* paper. No registered stages or independent review of that proposal were found at this snapshot. Its results remain missing, and the design job must combine the two briefs. It must not create two Riemann-extension projects.

Q3 already has the node PerfectoidQuotients:Q3/andre-flatness-lemma, asserting a p-completely faithfully flat absolutely integrally closed extension. The new request concerns this paper's exact field-based and functorial formulation and its alternative proof. Generic perfectoidization and root-adjoining are not re-owned by the splitting roadmap.

The scheme and formal-model routes are **requests**, not claims that existing narrower packets provide these results. Coherent proper base change is not étale proper base change. The non-Noetherian base in Proposition 6.2 is not covered merely by F0's Noetherian formal-scheme scope. Exact original hypotheses and supplier nodes must be resolved before these routes are considered complete.

The main Part II imports the existing commutative-algebra foundations. It must coordinate with PAPER-ANDRE-18-B and the pending singularity vocabulary in PAPER-BHATT-ETAL-23. The current final theorems use explicit retractions, so they require no competing definition of splinter. Suitable later planet names include “Almost-pro-zero towers”, “Quantitative Riemann extension”, “Perfectoid covers of regular local rings”, “Direct summand theorem” and “Derived direct summand theorem”; this paper issue does not edit planet files.

## What the libraries already supply

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every declaration attached to a library item was read at these pins:

- IsRegularRing, IsRegularLocalRing and the cotangent-space characterization;
- Module.FaithfullyFlat and its tensor-detection criteria;
- AdicCompletion and IsAdicComplete;
- DerivedCategory and DerivedCategory.Q, at the root namespace;
- Ideal.exists_pow_inf_eq_pow_smul, the finite-module and ring forms of local Krull intersection;
- TauCeti.ArtinRees.exists_controlled_lift, whose shift is chosen before the source module, surjection and depth.

These imports do not establish almost rings, derived tensor, derived completion or either splitting theorem. The regular-local file records localization regularity as unfinished; a local predicate cannot be silently converted into the global regular-ring predicate.

## Source findings

The JSON records locators, short quotations, corrections, arguments and correction searches. All findings await independent review.

- **E1:** arXiv Proposition 6.2 omits generic surjectivity. For mixed-characteristic perfectoid K, take A=K°×K° and Y the first component. The map is finite, proper and étale, but its unit is projection. The other idempotent survives multiplication by every root of p, so there is no almost left inverse. The corrected item requires a finite étale **surjective** generic map.
- **E2:** in the ramified proof of Proposition 5.2, the ring containing the newly adjoined roots and carrying the stated field-base structure is A, not the original A′.
- **E3:** the introductory characteristic-zero trace shortcut needs the equal-characteristic-zero/Q-algebra convention. Mere characteristic zero includes Z; in Z[(1+√5)/2], the degree-two trace of that generator is 1, and normalized trace is not integral. The theorem itself is unaffected.
- **E4–E5:** André's arXiv definitions of pure and almost-pure submodules use an unbound algebra symbol in their tensor maps. Both formulas are corrected in the published Appendix A.
- **E6–E7:** André's published Appendix A retains the incorrect scalar subscript on a Hom and a reference to N where the finite free summand is M.
- **E8:** the intermediate-module sentence in André's almost-purity discussion has a backward arrow. The relevant factorization is M→M′→N; almost purity of the composite implies that of the first map without the extraneous condition.

The Bhatt findings are certified only against the public version read, not the unavailable full journal text. The scoped searches found no separate corrections to E1–E3 or E6–E8. “New” means not found in those searches, not an exhaustive historical priority claim. The local-duality step in André A.3.1 remains a reading question in G9, without an error verdict.

## Validation and continuation

The paper checker passes. Additional integrity checks require every missing item to have exactly one route, all local dependencies to exist and form a DAG, every definition/construction to have nonempty uses, API and tests, and every proposed area to be an actual galaxy ID. The submission check is run on exactly the two deliverables and this job's handoff.

The reproducible exact-arithmetic sanity check below exercises **188,100** monomial cases and **120** valuation cases, and checks the trace example. It does not prove the perfectoid or derived assertions, nor are the planning tests Lean compilations.

~~~python
from fractions import Fraction as F

count = 0
for p in (2, 3, 5):
    for m in range(5):
        for k in range(5):
            c, cutoff = p**k * m, F(1, p**k)
            for n in range(1, 5):
                for r in range(5):
                    for a in range(2 * p**r + 1):
                        e = F(a, p**r)
                        if e >= cutoff:
                            assert c * e >= m
                        else:
                            assert cutoff - e >= 0
                            assert c * e + n * e == (n + c) * e
                        count += 1
assert count == 188100

count = 0
for p in (2, 3, 5):
    for n in range(1, 6):
        for k in range(8):
            m = max(n, k)
            assert F(1, p**k) >= F(1, p**m)
            transition = F(1, p**n) - F(1, p**m)
            assert transition >= 0
            assert transition + F(1, p**(m+1)) < F(1, p**n)
            count += 1
assert count == 120
matrix = ((0, 1), (1, 1))  # multiplication by phi, phi^2=phi+1
assert sum(matrix[i][i] for i in range(2)) == 1
assert F(1, 2).denominator != 1
~~~

Resume at the [handoff](../handoff/PAPER-BHATT-18.md). The most consequential next work is G6 (the original non-Noetherian formal-model theorem and coherent base change), G4 (derived uniformity and inverse limits), and G2–G3 (the original simplicial and almost-algebra interfaces). The equal-characteristic branches and complete-local reductions need full proof-leaf extraction. Remark 5.5 remains a question in this paper and is not an acceptance theorem. No Lean file is authorized by this paper issue, and none was created or compiled.
