# Handoff: BP-PrismaticCohomology--PR.8

Agent: Claude — claude-DAYn2t. Refs #979. Claim comment 6016084167, confirmed by the bot.
Deliverables: `research/blueprint/packets/PrismaticCohomology--PR.8.json`,
`research/blueprint/readmes/PrismaticCohomology--PR.8.md`,
`research/blueprint/suggested/PrismaticCohomology--PR.8.lean`, this note.

## Status

Packet status **complete**; `PrismaticCohomology:PR.8` coverage **planned** (target level).
76 nodes (18 definitions, 14 constructions, 8 lemmas, 35 theorems, 1 application), 200 API items,
130 unit tests, 6 planets, 14 baseline declarations (Mathlib, read at 082e2d3), 15 requests,
2 gaps, 5 source issues (misprints). No earlier packet existed; this is a fresh plan.

Planets: δ_log-ring; Log prism; Log prismatic site; Log Hodge–Tate comparison; Log Nygaard
filtration; Kummer-étale comparison.

## What the plan covers

Every target of the layer description is realised (see the reader's layer overview):
δ_log-rings, monoid Frobenius, free δ_log-rings, completion/étale extension, associated log
structures, extension along M ⊂ N ⊂ M^gp, exactification (K1 §2); prelog and log prisms, the
standard prelog prisms, prelog/log prismatic envelopes and their flatness, perfectoid monoids,
perfect log prisms ≃ perfectoid log rings (K1 §3, KY §2); relative and absolute log prismatic
sites, cohomology, Čech–Alexander complexes, base change, étale localisation, covers (K1 §4);
Hodge–Tate and completed base change (K1 §5); δ_log-crystalline site and crystalline comparison
(K1 §6, App. B); log q-crystalline cohomology, log q-de Rham complexes, the AΩ comparison on the
semistable overlap with AI.6 and the C_st diagram, Breuil–Kisin cohomology (K1 §§7–8); log
quasisyntomic site, log QRSP basis, derived log prismatic cohomology, derived Hodge–Tate,
quasisyntomic descent, initial log prisms (KY §§3–4); log Nygaard filtration, graded pieces,
Nygaard–Hodge fibre sequence, Lη_I factorisation, de Rham comparison, Frobenius isogeny (KY §5);
Kummer étale site of fs log schemes and the affine comparison (KY §6, Kato II §2); log diamonds,
generic fibre, strictly totally disconnected log perfectoids, quasi-pro-Kummer-étale site,
Kummer towers, comparison with log schemes, the global comparison (KY Theorem 7.30), local
systems, Laurent F-crystals and their equivalence with local systems, smooth proper pushforward
(KY §7); étale comparison over A_inf, Hyodo–Kato isomorphism, BKF modules (KY §8); the standard
semistable chart end to end. The layer's hypotheses (integral M_A, Koshikawa smoothness, qcqs,
I = (p) + Cartier type, mod-p Cartier type, perfect log prism + fs M_0) are kept on every node.

## RS-01

The restructuring proposal RS-01 is accepted (REV-RS-01). It keeps PrismaticCohomology and all its
stages and gives PR.8 no narrowing or new owner; the plan follows the current structure.

## Requests (stage-level, no supplier packets exist yet)

CrystallineCohomology `CR.5:log-algebra` (integral log algebra, Koshikawa smoothness, Cartier
type, exactification of monoids), `CR.5` (log PD envelopes, log crystalline cohomology, semistable
chart differentials), `CR.6` (Hyodo–Kato); DerivedDeRhamCohomology `DD.6` (Gabber's log cotangent
complex and its properties, derived log de Rham, homologically log flat maps and hlf descent,
relatively perfect vanishing) and `DD.5` (BMS2 quasisyntomic site); HodgeTateAndCanonicalSubgroups
`T6:log-sites` (DLLZ log adic spaces and Kummer-étale sites); DiamondsAndVStacks `D1`, `D4`, `D6`;
DiamondEtaleCohomology `C0`; PerfectoidQuotients `Q2` (perfectoidisation); AInfCohomology `AI.0`,
`AI.2` (BKF modules and BMS1 Corollary 4.20), `AI.6` (semistable AΩ); EnhancedDerivedSheaves
`E5:animation`. Each request in the packet states the exact statements needed and the consumers.
Own-roadmap stages PR.0–PR.7 are cited as stages (the Part 1 packet has no nodes for them yet),
except PR.0's δ-structure, localisation and completion nodes, which are cited by node id.
New stage edges implied: PR.0, PR.1, PR.2, PR.4, PR.5, PR.6, PR.7 → PR.8 (all acyclic, since
PR.8 has no consumers), and the external ones above.

## Gaps

1. Bhatt–Lurie Riemann–Hilbert correspondence in characteristic p (KY Lemma 8.5), needed by
   `etale-comparison-over-ainf` and `log-prismatic-bkf-module`: no roadmap plans it.
2. arc-descent for étale cohomology (Bhatt–Mathew Corollary 6.17), needed by
   `kummer-etale-vs-qpket`: the ArcTopologyAndDescent roadmap named in the BS22 routing does not
   exist yet.

## Source issues

Five misprints, all `affects: nothing`, recorded as PrismaticCohomology/E8.1–E8.5 (ids chosen not
to collide with PR.0's E1): KY footnote 5 "Corollary 7.30" → Theorem 7.30 (the atlas description of
PR.8 repeats this misprint; the plan realises Theorem 7.30); KY "[26, Remark 4.4]" → Remark 4.5;
KY proof of Proposition 4.12 "[26, Proposition 6.1]" → Proposition 5.1; KY Definition 7.4(1)
"chart of M_X" → M_Y; K1 Remark A.1 "Lemma A.8" → Lemma A.9.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.8.json
  --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files` on the four files: see the pull request.
- Every API and unit-test name of the packet occurs in the suggested file (checked by script);
  the reader is generated from the packet, so the two agree node for node.

## Suggested Lean file

Compiled with `lean-check` (a single `lake env lean`) in the shared build at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174: exit 0, the only diagnostics are 30 `declaration uses
sorry` warnings. The shared build's Tau Ceti checkout is cf38662, not the pinned f790474; the file
imports only Mathlib modules, so this does not affect it. The typed core is the algebra that
Mathlib can express: δ-structures (restated from PR.0's suggested file), δ_log-rings with their
API and tests, the monoid Frobenius, the extension to M^gp, the exactification monoid, the
δ_log-triple carrier, perfect log prisms on that carrier, perfectoid/perfect/pseudo-perfectoid
monoids (Mathlib `Perfection`, `Associates`), and Kummer-type maps (38 packet names typed). The
remaining 292 API items and tests, which need prisms, log formal schemes, Gabber's cotangent
complex, derived ∞-categories, diamonds or A_inf, are recorded in documentation comments under
their packet names with the reason; no condition is replaced by a `Prop` field.

## Sources read

K1 = arXiv:2007.14037v3 (SHA-256 90f68a84…a180d); KY = arXiv:2306.00364v1 (SHA-256 7c55cba2…541b);
Kato II = arXiv:1905.10678 (SHA-256 75644f00…160a), all read 2026-10-06; sections as listed in the
packet's `readSections`. Not read: the published versions (if any) of K1 and KY; Nakayama's
*Logarithmic étale cohomology* I/II and DLLZ (cited through KY and T6); the proof interiors of KY
Lemmas 4.18, 4.20, 6.6, 6.9–6.10, 6.17–6.18, 8.5–8.6 and Proposition 2.47; KY §9 (outside PR.8's
scope by the layer text).

## Where to resume (follow-up work, not blocking review)

- At lemma level: split the Hodge–Tate, Nygaard and affine Kummer-étale proofs into the lemma
  nodes listed in the coverage record.
- When CR.5, DD.6, T6:log-sites and PR.0–PR.7 have packets, replace stage prerequisites by node ids.
- Close the two gaps once an owner exists (a characteristic-p Riemann–Hilbert stage; the arc
  topology roadmap).
