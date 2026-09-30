# REV-RT-PAPER-ESNAULT-GROECHENIG-20

**Complete: all eleven findings confirmed.** Nine of the fixes need correcting or refining (given below). One sub-claim of /4 is false, and the conclusion stands anyway.

- **Job:** Refs #4311.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence.** The extraction was begun by `codex-a71f92` and finished by `cc-fb70e5`. Its review is by `cc-7b31c4`, and the red team by `cc-f805bf`. None is this session's work.
- **Disclosure.** This session's red team of PAPER-BENOIST-19 (#4776) names EG20 routes 1 and 2 as co-proposers of two Part IIs. No finding here concerns those routes, and no verdict uses that red team.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-ESNAULT-GROECHENIG-20.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources.**
- Published: Acta Math. 225 (2020), 103–158, from International Press. Its SHA-256 matches the record.
- arXiv 1707.00752v4, with its LaTeX source.

**Division of the work.** Three verifiers worked in parallel:
- routes and ownership (1, 2, 5);
- duplicates and library claims (3, 4, 9);
- the paper's mistakes and the items (6, 7, 8, 10, 11).

**Lead check.** I re-read the proof of Lemma 5.5 in the TeX. The step "Thus we have χ(g)=1" does not follow from the displayed trace identity.

## Verdicts

**/1 (high): confirmed.**
- **The cycle.** Item 044 is routed to CR.1 but depends on two items owned by stages that import CR.1:
  - 012 (p-curvature, in the CartierFlows Part II);
  - 015, through 004 (HodgeStructuresPartII).
- Nothing in the live graph breaks the cycle. CR.1's only inputs are CR.0, DD.1, D0 and EnhancedDerivedSheaves stages, and RS-01, RS-02 and RS-28 add no links at CR.1.
- **Wrong statuses.** Items 045 and 046 are marked planned at CR.1 in their p-curvature form (Theorem 2.19, Corollary 2.20, p. 120). CR.1 plans only the quasi-nilpotent form.
- **Better fix:** split 044. The [BO, Ex. 4.14] half stays at CR.1, and the [Ka1, Cor. 5.5] half moves to route 3. Repoint 047 to the new Corollary 2.20 item, and rewrite route 5's reason.
- **Near miss:** item 110, planned at CR.2, depends on 002 in HodgeStructuresPartII.

**/2 (high): confirmed.**
- BP-GlobalGaloisDeformations finished and was promoted on 28 September. Its instructions carry no added sources, so route 6 is never applied, and items 091–093 are planned nowhere. This is the RT-PAPER-ANDRE-18-B/1 pattern.
- Item 090 is planned. The R04.1–R04.2 nodes cover Definition 5.2 with fixed determinant for any profinite group with finite residue field.
- **Corrections:**
  - The "finite extension F′" clause corresponds to the change-of-residue-field node, not the Schur node.
  - The rigidity predicate (corepresentable by an Artinian ring) is in no node, so state it inside 093.
  - Prefer moving 091–093 into route 4, where their consumers 094, 098 and 115 already are.

**/3 (medium): confirmed; fix corrected.**
- HEUER-25 (accepted) plans Faltings's small correspondence in PadicHodgeTheoryPartIIPadicSimpson (items 35, 36, 40).
- Item 095 cannot simply be imported while it sits in route 4, because nothing plans Faltings's small integral version. Move it to a new EG20 part-ii route that joins that Part II. Route 4 keeps 096–098.
- Crystalline local systems (used by 074 and 088) are defined by GUO-REINECKE-24 route 2. Route 3 must import them, with a bridge from the algebraic to the rigid generic fibre. There is no cycle.
- GUO-REINECKE-24 was extracted before EG20 was finished, so "extracted first" excuses only HEUER-25.

**/4 (medium): confirmed; one sub-claim false, fix corrected.**
- ABE-18 (accepted) owns Theorem 4.2.2, the realization and the companion notions in GlobalShtukasPartIICrystallineCompanions.
- The claim that neither extraction mentions the other is false. ABE-18 route 2 names EG20's RigidCompanions and asks it to import Theorems 4.2.2 and 4.4.1. So the real duplicate is the companion relation.
- **Corrections:**
  - Corollary 2.3.4 is ABE-18 item 17, so import it.
  - Item 109 should import ABE-18 item 47 for the p-to-ℓ companions.
  - Route 4's brief imports from that Part II.

**/5 (medium): confirmed; owner corrected.**
- The ℓ-adic weight inputs of Proposition 7.4(2) have no item. DWP.7 plans proper-smooth purity and GS.6 plans Lafforgue on curves, so the prerequisites entry is wrong.
- **Corrections:**
  - The curve case is Lafforgue Théorème VII.6 (EK Theorem 4.4). Prop. VII.7 is the higher-dimensional statement, and EK Appendix B repairs its Bertini step.
  - The accepted PAPER-DELIGNE-80 already routes Weil II Conjecture 1.2.10(i) to DeligneWeightsAndPurity. Route EG20's item there rather than create a second owner.

**/6 (medium): confirmed.**
- The proof of Lemma 4.11 (p. 134) says C(E_s^j) is rigid "by Lemma 3.4". Lemma 3.4 covers only the Frobenius twist w*.
- The red team's repair holds. σ is injective because C⁻¹∘w* is fully faithful and the V_s^i are distinct (Proposition 4.10(c), as corrected in E9). An injective self-map of a finite set is a bijection.
- Item 076 already reaches 052 through 065.
- Record this as E11 (gap, the proof).

**/7 (low): confirmed; affects corrected.**
- "Thus we have χ(g)=1" (p. 140) does not follow. For Q₈, the 2-dimensional representation is invariant under twisting by every linear character.
- The repair is right: χ is K-valued, so the family is constant and the deformation trivial.
- Record this as E12 with affects "the proof", not "nothing". Item 092 needs no change.

**/8 (low): confirmed; three corrections.**
- Slip 3 prints π₁(C_{Q_p}) with no bar, so the correction is π₁(X_{Q_p}).
- Slip 2 is a dropped "of course", not "coarse".
- Slip 4's shift also changes "from (b)" to "from (c)".

**/9 (low): confirmed.**
- The Mathlib Morita declarations exist at 082e2d3 and cover the split matrix algebra used on p. 118. Item 023 stays missing: Mathlib's own TODO lists the projective-generator form.
- `obj` is on line 42, not 41.

**/10 (low): confirmed.** An algebraic integer of absolute value 1 is a unit: α⁻¹ = ᾱ is a root of the same minimal polynomial. The locator "§4.17" should read "Corollary 4.17 (§4.2)".

**/11 (low): confirmed, with qualifications.**
- No checker enforces sourceVersions for extractions.
- The rule entered PROTOCOL on 24 September, after this extraction was accepted.
- The gap is visible: `collation.py` labels the record "preprint".

## For the maintainer

- **Accepted source routes are not reaching pending blueprint instructions.** The issue bodies of BP-CrystallineCohomology--CR.0 (#704) and BP-GlobalGaloisDeformations (#743) carry no added-sources block, although EG20 was accepted on 23 September. So route 5 of this paper takes effect only once the queue and the issue bodies are regenerated. The promoted GlobalGaloisDeformations blueprint cites none of the ten accepted extractions routed into its stages.
- **Missing sourceVersions is systemic.** About 140 extractions quote a stated result without sourceVersions. A backfill would fix this better than one fix job per paper.
- **Double ownership of Deligne's companion conjectures.** ABE-18 item 1 owns them, and DELIGNE-80 also routes them to DeligneWeightsAndPurity.
