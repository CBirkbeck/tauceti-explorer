# REV-RS-11 — review of the RS-11 restructuring (main conjectures and automorphic congruences)

**Verdict: accepted, with seven corrections made in place.** Reviewer: Claude Code, session `cc-39fac3`, 29 September
2026. The proposal was written by ChatGPT (GPT-6 Astra Pro), session `astra-7c41e9`. This reviewer took no part in
it.

The ownership decisions are sound and stay as they are. What needed correcting is the consumer repair: the report
describes edges that the atlas does not have, so three of its seven links pointed at stages that do not consume the
narrowed layers.

**What was read.**
- `RS-11.json`: two members (AutomorphicCongruences, ModularIwasawaMainConjectures), no anchors, and ten directed leads
  (five pairs) from the audits.
- The proposal `RS-11.result.json`, its report `RS-11.md` and the handoff note.
- Both member documents in full: C.L0–L5, L2s, L5a, L5b, L5w and I.L0–L6.
- The consumers of the narrowed stages: I.L3, I.L4, I.L5, RankZeroOneBSD BSD.6a and HeegnerPointEulerSystems HE.8b.
- Every other restructuring with an entry on these stages. RS-08, RS-14, RS-16, RS-24 and RS-30 are accepted; RS-21 is
  pending.
- Burungale–Castella–Skinner, *Base change and Iwasawa Main Conjectures for GL₂*, arXiv:2405.00270v2 (18 March 2025;
  id and version checked with the arXiv API), read on 29 September 2026:
  - Theorem 1.1.2 (p. 2);
  - Theorem 3.2.1 (p. 7);
  - §4.1, with Theorem 4.1.3 and Corollary 4.1.4 (p. 8);
  - §4.2, Theorem 4.2.1 (pp. 8–9);
  - §5.2, Proposition 5.2.1 and the proofs of Theorems 1.1.2, 1.2.2 and 1.2.4 (pp. 9–11).

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-11.result.json` reports `ok` on the
  corrected file.
- The atlas as `scripts/build.py` assembles it at origin/main `0c12867e` (2840 stages, 7792 edges). On it I checked:
  - every stage id in the proposal;
  - the incoming and outgoing edges of all 17 member stages, with the proposal that added each;
  - the cycle test for each link, and for all links together.
- `research/blueprint/atlas/stage-edges.json` at the report's own baseline `cd21d1a9`, compared with the edges the
  report describes.

## 1. Duplication

The five evidence pairs are all resolved, and I agree with each verdict.
- **C.L1 / I.L1.** This is a supplier–assembly handoff. C.L1 proves the SU/FW reverse divisibility with FW §4.8's
  period refinement. I.L1 combines it with Kato's bound (KatoEulerSystems L4). I.L1's text already says "R15.L1–L2,
  with FW §4.8's period refinement, gives the opposite divisibility", so keeping I.L1 unchanged, as a `formerly`
  location, is right.
- **C.L4 / I.L2 and C.L4 / I.L4.** C.L4 says "Deduce FW's universal-family theorem and the pointwise theorem", and
  I.L2 and I.L4 state the same FW Theorems 1.7 and 1.8. One proof owner is right.
  - I.L4's "R15.L3–L4 owns its deformation and descent proof" already points the same way.
  - The LLZ signed comparison stays in I.L4.
- **C.L5 / I.L3 and C.L5b / I.L3.** C.L5b "supplies the cyclotomic theorem", and I.L3 states BCS Theorem 1.1.2.
  - Owning the proof at the child C.L5b, not the aggregate C.L5, is right.
  - Keeping the rational and integral branches as separate owner records is right.

**No duplicate was missed within the family.**
- C.L0's congruence-to-Selmer classes and I.L0's formulations are different objects.
- C.L2's U(3,1) construction and C.L1's U(2,2) construction are different arguments, as the proposal says.

**The source-label correction in C.L5a is right.** C.L5a claims "BCS v2 Theorem 4.2.1's two-variable
Iwasawa–Greenberg comparison". In BCS v2:
- Theorem 4.2.1 is the anticyclotomic theorem, "A refinement of Kolyvagin's methods …", with its Heegner-class
  statements (a) and (b).
- The two-variable product divisibility is Proposition 5.2.1. It comes from Wan's Theorem 3.2.1 by base change.
- The Perrin-Riou/Greenberg two-variable equivalence it uses is Theorem 4.1.3, with Corollary 4.1.4 for products. The
  proof of Proposition 5.2.1 cites this as "Proposition 4.1.3".

HE.8b already pins Theorem 4.2.1 for its anticyclotomic endpoint. Correction 6 makes the locator exact.

## 2. Nothing lost

**The three narrowings.** I.L2, I.L3 and I.L4 each import one proof and keep:
- the hypothesis tables;
- the normalization, period and lattice transport;
- I.L4's whole LLZ signed comparison.

**Consumers of the narrowed layers.** The report's §5 and §6 do not match the atlas. They say:
- "I.L2 feeds I.L3", "I.L3 feeds I.L4" and "I.L4 feeds I.L5 and I.L6";
- "Existing links from … C.L5b to I.L3 remain unchanged";
- "I.L1 → I.L2 → I.L3 → I.L4".

None of these edges exists. The report's own `stage-edges.json` at its baseline `cd21d1a9` already has:
- I.L2 → I.L4 and I.L2 → I.L5;
- I.L3 → I.L5 only;
- I.L4 → I.L5 only (RankZeroOneBSD BSD.6a also consumes I.L4 in the assembled atlas);
- C.L5 → I.L3, from the aggregate, with no edge from C.L5b.

So three repair links pointed at non-consumers:
- **C.L4 → I.L3.** It was meant for I.L2's consumers, but I.L3 is not one of them, and it would make the BCS layer
  wait for FW. It is removed (correction 1).
- **C.L5b → I.L4.** It was meant for I.L3's consumer, which is I.L5. It is retargeted to C.L5b → I.L5 (correction
  2).
- **C.L4 → I.L6.** It was meant for I.L4's consumers, but I.L6 is not one of them. I.L6 re-exports the HE.8b, BSD.6a
  and BSD.7a branches and uses no FW theorem. It is removed (correction 3).

The supplier that the narrowed I.L3 names, C.L5b, had no edge into I.L3, so C.L5b → I.L3 is added (correction 4).

After the corrections, every consumer finds its supplier:
- **I.L2's consumers:** I.L4 already has C.L4 → I.L4, and I.L5 gets C.L4 → I.L5.
- **I.L3's consumer:** I.L5 gets C.L5b → I.L5.
- **I.L4's consumers:** I.L5 gets C.L4 → I.L5. BSD.6a uses "ModularIwasawaMainConjectures L0/L4 for signed local
  conditions and the Kobayashi comparison", which I.L4 keeps, so it needs no FW link.

**The other three links are right as proposed.**
- **K.L4 → I.L1.** I.L1's "R12 gives one divisibility" is Kato's bound.
- **K.L4 → C.L5b.** BCS proves Theorem 1.1.2 "by descending … and appealing to Kato's work".
- **I.L1 → C.L4.** FW's descent uses the ordinary classical points, where the main conjecture comes from I.L1's
  assembly. This is the early ordinary result, not the later FW endpoints.

**Accepted proposals that touch these stages.** None conflicts with RS-11:
- RS-08, RS-14, RS-16 and RS-24 add inputs to C.L0, C.L1, C.L2, C.L3, C.L5 and C.L5w;
- RS-30 adds BSD.6a → I.L6 and BSD.7a → I.L6;
- RS-14 adds AutomorphicPadicLFunctions L5 → I.L5.

Two owner records touch kept layers:
- RS-16 gives the determinant functor on perfect complexes to PadicMeasuresIwasawaAlgebras L5, formerly including
  C.L3.
- RS-14 gives the analytic Coates–Perrin-Riou/Panchishkin existence proposition to AutomorphicPadicLFunctions L5,
  formerly including I.L5.

Correction 7 records both in the reasons of the layers they touch. The pending RS-21 moves co-Whittaker families from
C.L3 to SmoothRepresentationsOfLocalGroups SR.5. That is consistent with C.L3's own "import … co-Whittaker/essential
vectors from SmoothRepresentationsOfLocalGroups".

## 3. Anchors, extensions and format

- There are no anchors, no Part II extension and no title change. Both roadmaps are kept, and every one of their 17
  stages is listed.
- The file has the §15 shape and passes `check_restructure.py`.
- **The links.** All six join existing stages, none is already an edge, and each passes the cycle test on its own and
  all six together:
  - five are shortcuts along existing paths, for example C.L5b → C.L5 → I.L3 and K.L4 → BSD.7a → HE.8b → C.L5b;
  - I.L1 → C.L4 has no existing path, and no path from C.L4 returns to I.L1.

## 4. Corrections made in `RS-11.result.json`

1. **Removed C.L4 → I.L3**, which has no consumer basis.
2. **Replaced C.L5b → I.L4 by C.L5b → I.L5.**
3. **Removed C.L4 → I.L6**, which has no consumer basis.
4. **Added C.L5b → I.L3**, the edge from the supplier that I.L3 names.
5. **Reworded the reason of C.L4 → I.L5**, which repairs both narrowed I.L2 and narrowed I.L4.
6. **C.L5a reason:** the BCS locator is now Proposition 5.2.1, with Theorem 4.1.3 and Corollary 4.1.4, not Theorem
   4.2.1.
7. **C.L3 and I.L5 reasons:** aligned with RS-16's determinant-functor owner and RS-14's analytic-proposition owner.

No layer action or owner record changed. The `review` object is added at the top level.

## 5. For the orchestrator

- **The report `RS-11.md` is not a deliverable of this job, so I left it unchanged.** Its edge descriptions in §5 and
  its cut and witness tables in §6 are wrong, as described in section 2. The corrected JSON is the operative record.
- **When the maintainer applies C.L5a's correction,** the README's "Own BCS v2 Theorem 4.2.1's two-variable
  Iwasawa–Greenberg comparison" should read "Own BCS v2 Proposition 5.2.1's two-variable product divisibility, with the
  Perrin-Riou/Greenberg equivalence of Theorem 4.1.3 and Corollary 4.1.4".
- **An edge the atlas does not record.** I.L6's JSW row says "L0/L4 supplies signed comparison only in its own range",
  but the atlas has no I.L4 → I.L6 edge. Adding it is a link question, outside this restructuring; I did not add it.
