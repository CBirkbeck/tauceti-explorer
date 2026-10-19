# Handoff: DESIGN-SchemeKTheoryOperationsPartII

Refs #3391. Claude (Opus 5.5), session `claude-xzisjs`, 18 October 2026. The claim (comment 6256345976) was confirmed by the bot.

## What was done

A new roadmap, the Part II of K-theory of schemes, localisation and operations: *supported formal K-theory and derived intersection degrees*. The design job had one paper route (PAPER-ZHANG-21 route 10, FormalSupportedIntersections), so nothing was split off.

- `research/blueprint/roadmaps/SchemeKTheoryOperationsPartII.json`: five layers, area `motivic`, parent `SchemeKTheoryOperations`.
- `research/blueprint/packets/SchemeKTheoryOperationsPartII.json`: status `complete`, 31 nodes (9 definitions, 6 constructions, 13 theorems, 2 lemmas, 1 comparison), 119 API items, 65 unit tests and 18 planets. Every stage is `planned`. There are no gaps and one request.
- `research/blueprint/readmes/SchemeKTheoryOperationsPartII.md`: the reader document, about 1,450 lines. It has a hand-written introduction, scope table, conventions and layer introductions; the per-target sections are generated from the packet, so the two agree.
- `research/blueprint/suggested/SchemeKTheoryOperationsPartII.lean`: 239 lines. **It compiled.** `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474) exits 0, and its only warnings are 19 `declaration uses sorry`. Neither library has formal schemes, so the file states the affine and local-algebra forms: the affine formal-support predicate, the stalk-completion inputs, the local codimension formula, local Lemma B.2(i) with Mathlib's `CategoryTheory.Tor`, `K′₀(Spf A)` as Tau Ceti's `ExactK0` of finite modules, the Cartan comparison and its failure on the node, the length-times-rank formula, and the Euler-degree computations. Its definitions have real bodies. The formal-scheme declarations are README targets.

Layers:

- **FK.0, local algebra and formal supports.** On formal schemes, dimension, codimension and support are read on stalks (and via the stalk/A_p/completed-localisation comparison), never on underlying spaces. This layer covers regular and Cohen–Macaulay formal schemes, the codimension formula, regular immersions and Cartier divisors, formal support, and Tor sheaves.
- **FK.1, Grothendieck groups and products.** K′₀ and dévissage; the strict complexes and the Gillet–Soulé group K₀^Y; affine transport to Spec A, which imports the parent's affine results; the homology class map, the cup product, and the Tor pairing with derived intersections.
- **FK.2, comparison and filtrations.** The regular comparison K₀^Y ≅ K′₀(Y) is stated under the resolution property. Then the codimension and dimension filtrations and their comparison, affine (B.3) by transport, and noetherian exhaustion.
- **FK.3, Lemmas B.1 and B.2(i)/(ii)** with corrected statements, and pullback of Cartier divisor classes.
- **FK.4, the Euler degree and the (B.4) pairing.** Base change (factors f and e), the zero-dimensional pairing (length × generic rank: the "r_i = dim X" case of (B.3), proved without Adams operations), the Cartier-divisor pairing, and proper pushforward with the projection formula.

## Paper-route items (PAPER-ZHANG-21 route 10)

| Item | Where |
| --- | --- |
| /128 formal support | FK.0/formal-support |
| /129 K′₀, K₀^Y | FK.1/coherent-grothendieck-group, FK.1/strict-supported-complexes, FK.1/supported-k-zero |
| /130 filtrations | FK.2/codimension-filtration |
| /131 regular comparison | FK.2/regular-supported-comparison, FK.2/filtration-comparison (hypothesis made explicit: E2) |
| /134 locally noetherian groups | FK.2/noetherian-exhaustion-k-groups |
| /135 Euler degree, (B.4)–(B.5) | FK.4/euler-degree, FK.4/derived-euler-pairing, FK.1/tor-pairing |
| /136 Lemma B.1 | FK.3/closed-union-decomposition (noetherian; limits of cokernels for locally noetherian, PAPER-ZHANG-21/E60) |
| /137 Lemma B.2(i) | FK.3/expected-dimension-tor-vanishing |
| /138 Lemma B.2(ii) | FK.3/componentwise-tor-vanishing (proof repaired: E1) |
| /176 cup product | FK.1/supported-cup-product |

The brief's five tests are all present: the DVR torsion-module degree (`eulerDegree_torsion_module`), the transverse regular sequence with no higher Tor, the excess intersection that keeps Tor (`derivedEuler_excess_point_divisor`), the closed union whose overlap map on G₀ is not injective (the node), and the formal sheaf whose topological support is all of Spf but whose J-power support is wrong (`not_isFormallySupported_structureSheaf`).

## Red-team findings handed to this job

- **RT-PAPER-ZHANG-21/10, RT-PAPER-LI-ZHANG-22-B/2 and RT-PAPER-LI-LIU-21/12 (single owner).** This roadmap is the one owner of formal K₀^Y, its filtrations, derived intersections and Euler characteristics. The packet's `restructure` entry (rescope) says that GrossZagierAndArithmeticHeightsPartII imports FK.1–FK.4 rather than constructing them. That covers PAPER-LI-ZHANG-22-B/46 and the K₀^Y part of PAPER-HE-LI-SHI-ETAL-23/9.
- **RT-PAPER-LI-ZHANG-22-B/18 and PAPER-ZHANG-21/E26 (formal (B.3)).** Formal (B.3) is not claimed. It is proved on affine regular formal schemes (FK.2/affine-filtration-product). The case in which some r_i = dim X is proved directly (FK.4/zero-dimensional-pairing). The non-affine case is a stated non-goal.

## Requests

- `AdicSpacesPartII:F0`: EGA III₁ (3.4.2)–(3.4.3). For proper morphisms of locally noetherian formal schemes, R^qp_* is coherent, equals the inverse limit over the reductions, and vanishes above the dimension. FK.4/proper-pushforward-projection needs it. Upstream AdicSpacesPartIII F0 says it owns formal direct images; no atlas node states this theorem.

## Source issues recorded (new)

- **E1.** The proof of Zhang's Lemma B.2(ii) has to localise at primes of the stalks, not at points of |X|. In Spf ℤ_p⟦s, t⟧, the subschemes V(s, t) and V(s, t − p) share their only point. The statement itself is correct.
- **E2.** Zhang asserts the regular comparison K₀^Y(X) ≅ K′₀(Y) on formal schemes without proof. Gillet–Soulé's argument needs global locally free resolutions, so the packet assumes the resolution property, which affine formal schemes have.

## What remains

- Every stage is `planned`. FK.4 closes once the request is met. Lemma-level splits (Tor-sheaf gluing, well-definedness of the K₀^Y relations) are listed in `remaining`.
- Not planned, by design: the non-affine formal (B.3); a locally perfect (Thomason–Trobaugh) model of K₀^Y for formal schemes without the resolution property; continuous K-theory of thickenings.
- For the reviewer: check the prime-level argument of FK.3/componentwise-tor-vanishing and source issue E2. Also check the codimension conventions in FK.0, which use stalk dimension and agree with Spec heights on Cohen–Macaulay affine charts.

## Checks run

- `TAUCETI_BASELINE=…/baseline python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperationsPartII.json`: 0 errors and 0 warnings; 22 baseline declarations, each read in the pinned trees.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: 0 problems.
- `python3 scripts/check_sorry_data.py` on the Lean file: passes.
- `lean-check`: compiles, with only `sorry` warnings (19).
- Dry atlas assembly, with `build.load_promoted` patched to add this packet and definition: the roadmap enters with 5 layers; the new stage edges run only from suppliers (AdicSpacesPartII F0, SchemeKTheoryOperations S.2–S.7, SchemeAndStackFoundations SF.0/SF.4, EnhancedDerivedSheaves E1, GeneralAlgebraicKTheory K.3) into the FK layers. No links were skipped and no existing edge was removed.
- Duplication audit: no TauCetiRoadmap README on main (fetched at 9a305e19) treats formal-scheme K-theory or supports. SchemeAndStackFoundations §5.7 there covers scheme K₀/G₀ and is acknowledged in the scope section.

## Sources

Read:
- Zhang, Ann. of Math. 193 (2021): the published PDF (SHA-256 6f8ac537…). Read Appendix B in full (pp. 971–975), plus §3 p. 881, §4 pp. 889–890 and §5.1 pp. 896–898.
- Li–Zhang, arXiv:1908.01701v3 (SHA-256 7db1843f…): §1.8, §2.4, Corollary 2.8.2, §5.2, §10.4–10.5.
- EGA I (0, 7.6.15–18; I, 10.1.5–6, 10.10) and EGA III₁ (3.4.1–3.4.3), from the cleared library copies.
- About twenty Stacks project tags. A Haiku subagent located them, and each statement was verified on the live pages.

Not read:
- Gillet–Soulé 1987. Its statements are cited through the accepted parent nodes (S.6), not re-read.
- He–Li–Shi–Yang and Li–Liu. Their uses are cited through their paper-extraction items.

Scratch is deleted at the end of this run; nothing in it is needed.
