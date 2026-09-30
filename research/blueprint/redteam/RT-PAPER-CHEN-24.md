# Red team: PAPER-CHEN-24 (William Y. Chen, *Nonabelian level structures, Nielsen equivalence, and Markoff triples*)

Job `RT-PAPER-CHEN-24` (issue #4046), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-CHEN-24.result.json`, in the format of PROTOCOL section 17.

**Result:** 10 findings: 6 medium and 4 low.

- **The extraction.** It is thorough: 123 items, 6 routes and 38 source issues, and the review went deep.
  - All 38 source issues stand.
  - The arithmetic of §5.6 checks out for every prime p ≤ 89.
- **What breaks.**
  - A missed error in the paper's Faltings consequence, copied into two items.
  - The version of record was never read, and the collation machinery wrongly treats it as read.
  - Two duplications with Landesman–Litt 24's new mapping-class-group roadmap, whose review was accepted 34 minutes after this one.
  - Source routes that never reached the blueprint jobs, leaving the coefficient-one Markoff carrier unplanned.
  - A planned status the review over-widened.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-7b31c4` (#1073, PR #1900, 22 September).
  - The review, REV-PAPER-CHEN-24, is by `cc-39fac3` (#1074, PR #2322, 23 September).
  - These are the only session ids in the result, report, review JSON and review report. `cc-f805bf` appears in none of them.
  - There is no errata file or handoff note for this paper.
- **Disclosure.**
  - This session red-teamed Gamburd–Magee–Ronan 19 (PR #4787) and Ellenberg–Venkatesh–Westerland 16 (PR #4811).
  - Finding 5 applies to this paper the handoff defect that GMR19 finding 7 (confirmed) found for CA.4. What it reports is specific to this paper: the coefficient-one surface and the twist.
  - Finding 4 is about Hurwitz stacks over M_{g,n}. It does not rely on EVW16 finding 3, which assigned the Hurwitz action and covering spaces to IG.3/IG.5.

## What was read

- **arXiv 2011.12940v2.**
  - Its hash is the extraction's.
  - I read all of it through pdftotext.
  - There are only two arXiv versions.
- **The version of record.** Ann. of Math. 199 (2024) 301–443.
  - The Annals page shows it was **revised on 28 July 2022**, thirteen months after v2.
  - The publisher served a bot-challenge page, so the published text was not read. Findings are scoped to v2.
- **Chen's 2025 survey** (arXiv 2510.12003v1), §5, for his later statements of the results.
- **The repository.**
  - Every item, route, prerequisite and source issue, and the review report.
  - Every cited stage.
  - The CA, IG, NC and ArithmeticDynamics packets.
  - The queue, and the live issues #1025, #1013, #1020 and #3367.
- **Neighbouring extractions.** Gamburd–Magee–Ronan 19, Martin 25, Ghosh–Sarnak 22, EVW 16, Liu–Wood–Zureick-Brown 24, Wood 19, Landesman–Litt 24, Canning–Larson–Payne 24 and Bergström–Faber–Payne 24.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`. I read every cited declaration.

## What holds up

- **§5 computations,** run over F_p for all primes 5 ≤ p ≤ 89:
  - |𝕏*(p)| = p(p ± 3);
  - Aut(Π) and Aut⁺(Π) are transitive;
  - |f⁻¹(0)| = (deg f + 2)/3, with one γ₀-fixed point (E1);
  - the j = 1728 fibre and its p mod 8 rule;
  - Proposition 5.3.5's cusp formula;
  - Riemann–Hurwitz gives exactly Theorem 5.6.3's genus formula;
  - the parity of the monodromy on 𝕐*(p) matches Theorem 5.6.6's rule mod 16.
- **The review's corrections.**
  - Checked: Theorem 1.1.2's reversed condition (the S₃ and ℤ/2 counterexamples), the Lemma 4.12.2 gap for j ≥ 1, d′ = 1 for D_{2k}, Tr_* not being injective, and the E34 description of 𝕄(F₃).
  - The q = 13, t = 7 example gives a single orbit of size 112.
- **Library claims.** Correct except the four named in finding 8.
- **Routes.** None creates a cycle, and each missing item is routed exactly once.

## Findings

### Medium

1. **Theorem 5.6.4 and Theorem 1.2.9 overstate their Faltings consequence (missed source issue; items 16, 97).**
   - **What the paper says.** "Only finitely many elliptic curves [over K] admit an SL₂(F_p)-structure (cover) with ramification index 2p."
   - **Why it fails over K.**
     - For tr[A,B] = −2 the matrix M = (AB − BA)/2 lies in SL₂(F_p) and conjugates (A, B) to (A⁻¹, B⁻¹). So γ_{−I} acts by an inner automorphism.
     - [−1] ∈ Aut(E) acts on Π as γ_{−I}. So the Galois-invariant structures of Theorem 2.5.2(3) are the same for E and for every quadratic twist E^d.
     - Over any K where the finite fibre is rational, infinitely many K-isomorphism classes of elliptic curves carry such structures.
     - The cover version fails the same way, by descent along an involutive lift of [−1]: the G-equivariant lift ι, or ι composed with an element of order 4.
   - **What is actually proved.** The proof bounds only K-points of the coarse curve M̄_p, that is, finitely many **j-invariants**.
   - The 2025 survey repeats the cover form.
   - **Fix.** Record E39 and correct items 16 and 97.
2. **The version of record was not collated; sourceVersions is missing; collation misfiles the paper.**
   - The published text was revised on 28 July 2022.
   - Six source issues have affects "a stated result", so check_errata requires sourceVersions. The file has none.
   - `collation.py` reads "the published version is behind the journal's paywall and could not be read" as evidence of having read it: PUBLISHER matches "annals.math" and READ_IT matches "published version". So `data/collation.json` records "published", and REQUESTS.md omits the paper.
   - **Fix.** Declare the preprint reading, and fix READ_IT.
3. **Out(F₂), Nielsen and the mapping class group of the once-punctured torus duplicate Landesman–Litt's new roadmap.**
   - MappingClassGroupsAndCanonicalRepresentations owns:
     - Out(G) and Nielsen's generators of Aut(F_N) (LL/96);
     - Mod_{g,n} and Dehn–Nielsen–Baer (LL/113);
     - π₁(M_{g,n}) ≅ PMod_{g,n} (LL/11).
   - Chen's route 6 plans the (1,1) case: Nielsen's theorem (item 123), and Γ_E ≅ Out⁺(Π) ≅ π₁(M(1)^an) (items 35 and 44).
   - The Nielsen generators of Aut(Π), which Proposition 5.2.5 and item 8 rely on, have no item.
   - Item 107 claims Out(Π) as library; Mathlib has no outer automorphism group.
   - **Fix.** Re-route to that roadmap and import.
4. **The Hurwitz stack of G-covers has three owners.**
   - The owners:
     - IG.5, which Liu–Wood–Zureick-Brown 24/30 sources;
     - Landesman–Litt 24/125: a Deligne–Mumford stack, étale over M_{g,n}, with isotropy Z(H);
     - Chen's route 6, for the (1,1) case (items 34, 35, 36, 39, 41). Items 21, 23 and 33 are even stated for general (g, n).
   - **Fix.** Make IG.5 the single owner of the general object. Route 6 keeps the (1,1)-specific theory and imports.
5. **The accepted source routes never reached the blueprint jobs.**
   - Issues #1025, #1013 and #1020 list no Chen source.
   - CA.4 was marked source_decomposed on 24 September from Martin's coefficient-three material alone. Nothing plans 𝕏 : x² + y² + z² = xyz, the twist ξ (an isomorphism over ℤ[1/3], a bijection on ℤ-points), or Markoff's theorem in that normalisation (items 9, 10, 90).
   - Yet the route 2 and route 6 briefs import exactly these from CA.4.
   - Route 6 also imports from `ArithmeticDynamicsPartIIMarkoff`. That job is superseded; the roadmap is now `ArithmeticDynamicsPartII`, issue #3367.
   - **Fix.** Refresh the issues, add the CA.4 nodes, and correct the id.
6. **Item 112 is marked planned beyond what is planned.**
   - The review widened it to Riemann existence for Deligne–Mumford stacks, giving π₁^ét(M(1)_ℚ̄) ≅ SL₂(ℤ)^∧ (Noohi 20.4). It kept the item planned at IG.3 and BelyiMaps layer 8.
   - Both of those plan only curves and Riemann surfaces.
   - **Fix.** Split the item: the stack form is missing, and belongs with items 35 and 44.

### Low

7. **Missing prerequisites.** None of these is listed:
   - Brumfiel–Hilden 1995, the only source for Theorem 5.2.1 over any ring and for Lemmas 5.2.4 and 5.2.9;
   - Deligne 1989 §15, the tangential base points of §4.2, which the NC packet does not cite either;
   - Magnus–Karrass–Solitar and Osborne–Zieschang, for the Nielsen generators and Nielsen's theorem;
   - Knudsen 1983, for item 119.

   Two small inputs also have no item:
   - π₁-invariance under extension of algebraically closed fields, with GAGA (Remark 4.2.4);
   - the facts about SL₂(ℤ/n) and noncongruent covers used in Corollary 5.6.8.
8. **Four wrong library names or paths.**
   - `CategoryTheory.FiberFunctor` does not exist. The class is `CategoryTheory.PreGaloisCategory.FiberFunctor`, Galois/Basic.lean:83.
   - Item 107 claims Out(Π), which the libraries lack.
   - Item 109 points at the module-level `SpecialLinearGroup` (LinearAlgebra/SpecialLinearGroup.lean:52). The matrix group it cites is at Matrix/SpecialLinearGroup.lean:70.
   - Item 111 cites `Mathlib/NumberTheory/Totient.lean`, which does not exist. The file is Data/Nat/Totient.lean.
9. **Two missed misprints.**
   - p. 10 says "m_X divides m′_X". §3.5 proves m′_X | m_X and m_X | 12m′_X.
   - The proof of Corollary 4.12.4 cites a nonexistent part "(c)".
10. **Out-of-date brief and imprecise citations.**
   - The route 6 brief's theorem (1) does not carry the review's item 52 correction: d_X is a coarse degree, e ≥ 2, and the base is algebraically closed of characteristic 0.
   - Item 2's planned citations should be:
     - Katz–Mazur layers 9E and 10, for the coarse j-line and its compactification;
     - R09.4 and R13.2, for the stacks.

     Layer 4 says of itself "not a general theory of algebraic stacks".

## Notes for the fixer and the design jobs

- **Findings that change item statements** (1, 6, 10) must be carried into items 16, 52, 97 and 112, and into the route 6 brief.
- **Findings that move items between owners** (3, 4) touch two pending designs, DESIGN-NonabelianLevelStructures and DESIGN-MappingClassGroupsAndCanonicalRepresentations. They should be applied before either design starts.
- **What stays in NonabelianLevelStructures** is the paper's own mathematics:
  - G-structures on elliptic curves and M(G), with the compactification M(G)‾ = Adm(G)‾ ⫽ Z(G);
  - the reduced ramification divisor and the Higman invariant;
  - the dualizing-sheaf congruence;
  - the cusp analysis by the δ-invariant, and A_{G,u,h};
  - the congruences for simple groups and for SL₂(F_q);
  - the genus formula and noncongruence.
- **Checks:**
  - `scripts/check_redteam.py` on the result reports ok.
  - `research/blueprint/intake.py check-files` on both files reports 0 problems.
