# RT-PAPER-LIU-WOOD-ZUREICKBROWN-24

Red team of the extraction PAPER-LIU-WOOD-ZUREICKBROWN-24: Liu, Wood and Zureick-Brown, *A
predicted distribution for Galois groups of maximal unramified extensions*, Invent. Math. 237
(2024) 49–116, read as arXiv 1907.05002v2. The red team is Claude Code, session `cc-c2c06b`,
30 September 2026, issue #4136. The extraction is by `cc-39fac3` and its review by `cc-442dc5`.
I did neither.

**Result: 4 findings, all low.**

This is a careful extraction with a strong review:
- **Items.** 45 items: 42 missing, 2 planned and 1 library.
- **Source issues.** 29, several of them substantive (E5, E6, E7).
- **Routes.** Seven routes, and all of them hold. The accepted ArithmeticStatistics blueprint already
  carries out route 4 and imports route 2 as intended.

The findings are about two notes, the prerequisites, and bookkeeping.

## Findings

**1. Item 10 says a pro-odd 𝓕_n needs no Feit–Thompson. It is the other way round. (error, low)**
- Item 10's note ends: "When Γ is solvable, or 𝓕_n is pro-odd, no Feit–Thompson is needed."
- 𝓕_n is pro-|Γ|′, so it is pro-odd exactly when |Γ| is even.
- Conjugacy of complements is known when the normal subgroup or the quotient is solvable. An
  odd-order group is solvable only by Feit–Thompson.
- The paper itself says so (p. 17): "when |Γ| is odd, our random groups are not necessarily
  pro-solvable".
- **Why it matters.** Item 4's note rightly says Theorem 1.4's hypotheses force |H| odd. Read
  together, the two notes suggest Theorem 1.4 needs no Feit–Thompson for any Γ. It does.
- The accepted ArithmeticStatistics blueprint gets this right. It states Lemma 9.3 and Theorem 1.4
  under an explicit hypothesis (SZ), "all sections are H-conjugate", and proves (SZ) only for
  abelian H.
- **Fix.** Say that conjugacy without Feit–Thompson needs Γ solvable or H solvable (abelian,
  nilpotent, or pro-p as in §7). Point to the (SZ) hypothesis.

**2. Item 43 claims Layer 4 plans the paper's pro-𝒞 completions. It does not. (error, low)**
- Item 43 is planned at ProfiniteProPGroups Layers 4–5, for "free pro-|Γ|′ groups on finite sets
  and their pro-𝒞 completions".
- Layer 4 plans pro-C completions only for a `FiniteGroupClass`. That is a class of finite groups
  with no Γ-action, and it must be closed under extensions: the layer rules out nilpotent groups
  for that reason.
- The paper's completions are the Γ-equivariant level-𝒞 completions of item 1. There 𝒞̄ is closed
  only under products, Γ-subgroups and Γ-quotients, so most of its 𝒞 are not extension-closed:
  - the groups of p-class ≤ c in Theorem 7.5;
  - the groups of order ≤ ℓ in §5.
- Only two cases fall under Layer 4: the pro-|Γ|′ completion that builds F_n, and the pro-p
  completion of §7.2.
- Item 1 already carries level-𝒞 completions as missing on route 7.
- **Fix.** Restrict item 43 to free pro-|Γ|′ and free pro-p groups and pro-p presentations. Point
  level-𝒞 completions to item 1.

**3. The prerequisites omit Bertin–Romagny and Romagny–Wewers. (missing, low)**
- §11 uses both:
  - it refers to [BR11] "for general facts about Hurwitz spaces" (p. 41);
  - the definition of Hur^n_G (item 30) takes étaleness of the branch locus from [BR11,
    Proposition 3.1.1];
  - §11.3, the topological Hurwitz space of item 31, is "model[led] on [RW06, Section 3]"
    (p. 44).
- No extraction, packet or papers.json entry cites either work.
- The other §11 sources are foundations of stacks, algebraic spaces and coarse spaces, which the atlas
  plans (SF.1, R09.3, R09.5, ComplexComparisonPartII:C3). Those are rightly left out under §16.
  They are Keel–Mori, Rydh, Olsson, Knutson, Artin 1970 and the Stacks Project.
- **Fix.** Add both, alongside the Wewers thesis:
  - Bertin–Romagny, *Champs de Hurwitz*, Mém. SMF 125–126 (2011), doi 10.24033/msmf.437;
  - Romagny–Wewers, *Hurwitz spaces*, Sémin. Congr. 13 (2006) 313–341.

**4. There is no `sourceVersions` list. (other, low)**
- Six source issues affect a stated result: E5, E6, E7, E8, E12 and E25. All were read against arXiv
  v2 only.
- What was read is recorded only in free text: readSections, and each finding's `searched`.
- The collation worklist does list this paper, with 6 statements on a preprint and a blocked
  publisher, so the §18 safeguard is working.
- OpenAlex (checked today) finds no open-access copy of the version of record.
- **Fix.** Record arXiv v2 (with its hash) and the unread published version, and keep the six
  findings scoped to arXiv v2.

## What held

**Routes.** All ten cited stage ids exist in the assembled atlas (2840 stages, 8007 edges).
- RS-29 narrowed IG.3 and IG.4. IG.3 keeps braid/Hurwitz actions on Nielsen classes (route 3). IG.4
  keeps finite embedding problems with local constraints, supplied by ProfiniteProPGroups Layer 5
  (route 1).
- RS-17 narrowed DWP.7, which still keeps the H_c upper weight bound (item 44).
- IG.5, ST.5, SF.2 and EDC.2:pairings are kept, and GN.4 is unchanged.

**The blueprint.**
- The accepted ArithmeticStatistics blueprint (#2864) has ST.5 nodes for Lemma 9.3, Theorem 1.4 and
  Corollary 1.5.
- It imports IG.5 for Lemmas 10.2–10.3 and Theorem 10.4, and leaves Theorem 6.2 to route 7's Part II.
- It re-records E6, E7 and E28 as known, with the extraction's ids, so nothing is recorded twice.

**Part IIs.**
- Route 6 coalesces with WOOD-19's route 8, with the same id and title. Its parent title is the
  current title of the Tau Ceti roadmap InductionRestriction.
- Route 7 reproduces ArithmeticStatistics' current title.
- No other extraction routes random Γ-groups, level-𝒞 completions or profinite Schur–Zassenhaus.

**Statuses.**
- All eight Mathlib names that item 45 cites exist at the pin.
- Tau Ceti has only the braid-group presentation.
- Neither library has profinite Schur–Zassenhaus or free pro-C groups, and ProfiniteProPGroups plans
  neither Schur–Zassenhaus nor conjugacy of complements. So item 10 is rightly missing.

**Source issues I re-derived.**
- E7's counterexample. x³ − 4x + 1 has discriminant 229, and h(ℚ(√229)) = 3 with a unit of norm
  −1. So there is exactly one totally real S_3-field with rDisc 229, against N = 6.
- E12's Z/4 example, E8's a = (1, 0) example and E25's n = 0 edge case.
- I did not re-verify E5 or E6 beyond reading their arguments.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-LIU-WOOD-ZUREICKBROWN-24.result.json`: ok.
- No Lean was compiled.
