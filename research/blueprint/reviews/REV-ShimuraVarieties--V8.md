# REV-ShimuraVarieties--V8: independent review

Reviewer: Claude, session `claude-xeFOsL`. Date: 2026-10-06. Issue: [#491](https://github.com/CBirkbeck/tauceti-explorer/issues/491).
The plan under review is BP-ShimuraVarieties--V8 by Codex, session `codex-SyM6RC` (PR #6675). This session wrote none of it.

**Verdict: needs_changes.** The corrected [packet](../packets/ShimuraVarieties--V8.json) and [suggested file](../suggested/ShimuraVarieties--V8.lean) form a sound complete target-level pass with honest gaps, and I would accept them as they now stand. Acceptance is withheld for one reason. The reader [readmes/ShimuraVarieties--V8.md](../readmes/ShimuraVarieties--V8.md) is not a deliverable of #491. It now contradicts the packet on mathematical points, and promotion would publish it as the reviewed document (PROTOCOL §8 requires the two to agree). The revision round only needs to regenerate the reader from this packet. Its review can then check the reader and the three added nodes.

## Counts

| | Before | After |
| --- | ---: | ---: |
| Nodes | 23 | 26 (3 added, `addedBy: REV-ShimuraVarieties--V8`) |
| Constructions with API and tests | 2 | 3 |
| API items | 9 | 16 |
| Unit tests | 8 | 15 |
| Planets | 7 | 7 (unchanged) |
| Baseline declarations | 12 | 12 (all confirmed) |
| Requests | 27 | 30 |
| Gaps | 4 | 4 (two restated) |
| Restructure proposals | 1 | 0 (superseded, see below) |
| Source issues | 8 | 9 (E9 added; all nine confirmed) |

Per-node results in `review.checked`: 11 verified, 12 corrected, 3 added. Both stages stay `planned`, neither `closed`; the packet stays `complete`. Every node remains `implementationStatus: unchecked`.

## Sources

I downloaded all four public sources again. The packet's SHA-256 hashes reproduce exactly. Page mapping: Milne's PDF page equals the printed page. In Pink's typeset copy, printed page p is PDF page p+1. In Deligne's Numdam file, printed page p is PDF page p−121.

- **Milne, *Introduction to Shimura Varieties* (2017):** §5 pp.57–59, 62–63, 65–66; §6 pp.70–74; §12 pp.111–116; §13 pp.117–119; §14 pp.125–127. Also the official errata page and Jungin Lee's list.
- **Milne, *Modular Functions and Modular Forms* v1.31:** pp.98–101, and the Course Notes errata page.
- **Pink's dissertation:** 8.1–8.4, 10.20–10.22, and 12.3–12.13 in full; 12.10 was also read from the page image.
- **Deligne, Bourbaki 389:** pp.153–156, from page images.

Every excerpt is literal at its locator. Some excerpts break across a line in the PDF, for example Pink 12.6's "the morphism descends on some open dense subscheme".

Locator corrections:

| Node | Was | Now |
| --- | --- | --- |
| finite-level-maps | 5.29(a) | 5.29(c) (the excerpt "of the finite group" is in (c)) |
| translation-laws | 5.29(b), pp.65–66 | 5.29(b)–(c), p.65; added p.58 "Note that this is a right action", which pins T(gh)=T(h)∘T(g) |
| level-tower, general-tower | 12.10, p.116 | 12.10, p.115 |
| gl2-moduli-reciprocity, gl2-full-level | 6.11, p.73 | 6.11, p.74 |
| abelian-instance | 14.15–14.16, pp.127–128 | p.127 |
| hecke-span | 5.29, pp.65–66 | 5.29, p.65 |
| minimal-descent | 12.7, p.199 | 12.6–12.7, pp.198–199 |

### Source issues

| Issue | Verdict | Check |
| --- | --- | --- |
| E1 (MF 8.9) | confirmed | The Legendre curve is singular at λ=0,1. A quadratic twist has the same level-2 structure and the same λ, so A¹ is neither coarse nor fine. No Course Notes erratum exists for pp.98–101. |
| E2 (MF 8.7) | confirmed | e_N(z/N,1/N) is constant in z, so it is one reference root. For ζ=ζ_ref^u the first generator becomes u z/N. |
| E3 (SVI 6.3, p.71) | confirmed, new | The arrows a: V→W, a′: V→W′ on p.71 contradict the setup on p.70. Lee's list corrects p.70 only. |
| E4 (SVI 5.29(a)) | confirmed | Already in Lee's list (p.65, line −6). |
| E5 (SVI p.114) | confirmed | Already corrected (Ruida Di; Lee). The `printed` field was not literal: it now uses ρ and Q^a, as printed. |
| E6 (Deligne 5.1.3) | confirmed | The s²=t counterexample with F=Q̄ is correct. Theorem 5.1 uses finite F, so the application is unaffected. |
| E7 (Deligne 5.1.2(b)) | confirmed | The tori are maximal tori of G_C. |
| E8 (Deligne "Lemme 5.13", "4.12") | confirmed | Deligne's 4.12 is an unrelated moduli construction. |
| **E9 (added)** | confirmed, new | SVI p.127: "(14.16) proves the existence for all Shimura varieties of abelian type" should cite (14.15). Neither errata list mentions it. |

The errata author's name is **Jungin** Lee, as on Milne's errata page and in the PDF; the packet wrote "Jungyun". It is corrected in E3–E5.

## Baseline

All 12 declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each exists under the cited name and module, with the stated kind:

- `AlgebraicGeometry.Scheme` (structure), `CategoryTheory.Over` (def), `CategoryTheory.Functor` (structure);
- `Over.pullback`, `Over.pullbackId`, `Over.pullbackComp` (defs; `pullback` needs `HasPullbacksAlong`, which holds for schemes);
- `Limits.span` and `Limits.spanCompIso`;
- `AlgebraicGeometry.IsFinite` and `IsProper` (classes), `IsOpenImmersion` (a `MorphismProperty` abbrev);
- `IntermediateField.LinearDisjoint` (protected abbrev via subalgebras).

None was removed or replaced. The reviewed audit (AUDIT-11) finds V8 not built. Its duplicate notes were checked:

- **AA.5 and R12.2:** imported, not re-planned.
- **PELModuli M5:** it owns the genus-one Siegel comparison with #81, so it is now a prerequisite of gl2-moduli-reciprocity instead of being re-derived.
- **C6 and H5:** these consume V8 and compare different objects (the integral PEL model, Hilbert data). V8 does not duplicate them.

## Mathematical corrections

1. **Determinant target (gl2-determinant-pairing).** The packet identified "the induced zero-dimensional torus datum" with μ_N^prim and derived it from datum-functoriality. Deligne's one-point torus datum (G_m,{det∘h}), which is ShimuraData D5's torus datum, has Shimura set Q^×\A_f^×/det K(N) ≅ (Z/N)^×/{±1} at this level. Its model is Spec of the real subfield Q(ζ_N)^+, a single point at N=3. The correct target is Milne's zero-dimensional Shimura variety Sh(G_m,Y) with Y=R^×/R_{>0}={±1} (pp.62–63; the GL2 example on p.63 gives (Z/N)^×). Its canonical model is defined by (64) on p.119. The map (GL2,H±)→(G_m,Y) is not a morphism of Shimura data, so datum-functoriality does not apply. Two nodes were added:
   - `zero-dimensional-shimura-variety`: the construction, with 7 API items and 4 tests.
   - `component-reciprocity`: Milne (64) with footnote 73. The proof uses special points, reflex-norm functoriality, density (13.5) and the disjoint-field lemma.

   The determinant node now uses them.
2. **Minimal compactification (codim-one-extension added; gap and rescope revised).** The packet treated the arithmetic codimension-one extension S⁺ as a missing supplier input that needs canonical torus torsors. It therefore proposed splitting ShimuraCompactifications C2 into a pre-V8 piece. Pink 12.10 and 12.12 show otherwise for pure data:
   - In the lifted case, S⁺ is the closure of M_K in M(G′,X′)×X_full(N), where (G′,X′)=(G,X)/SL₂.
   - Otherwise, S⁺ is a finite quotient of the extension for G̃=G×_{PGL₂}GL₂.
   - The only arithmetic inputs are V8's own gl2-compact-model, open canonical models, descent of closed subschemes, and finite quotients. Torus torsors (12.8) appear only for mixed data, which C2 owns.

   The new node `codim-one-extension` carries this argument. `minimal-descent` now runs codim-one-extension → 8.2 → 12.12, and no longer cites C0/relative-torus-embedding directly. The restructure entry was removed, because no cycle arises.

   What genuinely remains is complex. These statements are now the restated gap "Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding", whose natural owner is V2:
   - the closed immersion of M_K(ℂ)⁺ into the product;
   - the finite quotient from G̃;
   - extension of datum morphisms to the complex Baily–Borel compactification. V2's stated targets cover level maps only, so minimal-map-extension also depends on this gap.

   The other restated gap, "Abelian auxiliary class for Pink 12.10", now holds only the auxiliary-class question, including Pink-style two-point data. The logarithmic line is routine once M⁺ exists over E.
3. **Datum functoriality** descends over E(D). Milne's compositum E(D)E(D′) equals E(D), because E(D′)⊂E(D) by the argument of Milne 12.3(c).
4. **Finite level maps** are étale when K₂ is neat. "Neat effective levels" was wrong: Y_full(3)→j-line ramifies over 0 and 1728.
5. **gl2-compact-model** claimed that the Layer-10 X_H "has its separate certified comparison". No node or supplier provides that comparison, and V8 does not need it, so the claim was removed.
6. **gl2-gamma0 at N=2.** PR81 9E covers N=1 and N≥3 and says not to use its formula for N=2. PR81 9D is now a prerequisite and a request.
7. **Requests narrowed to supplier scope:**
   - R12.1: uniformisation and the Weil-pairing calibration only.
   - R12.2: the AA.5 agreement belongs to AA.5, which consumes R12.2.
   - R12.5: no adelic dictionary.
   - R12.6: cusp residue fields come from R13.4b.
   - R09.2: only the cocharacter Hom-scheme.
   - V2 and C1: precise statements of what they supply.
   - New requests: V0 (component decomposition), PR81 0D (finite étale schemes ↔ Galois sets) and PR81 9D.
8. **Tests.** The original level-tower and hecke-span tests check only how supplied maps are assembled, so a wrong tower passes them. Three tests that discriminate were added: the degree 24 = |GL₂(F₃)|/2 of the j-map, φ(3)=2 components, and the T_p index p+1 = |P¹(F_p)|.

Every other node was checked and verified. Those checks include:

- **Row-basis dictionary:** from Milne 6.3's [ah, a∘η], right translation by u sends (P,Q) to (aP+cQ, bP+dQ), PR81's convention. All three acceptance examples were recomputed.
- **Γ₁:** K₁(N) fixes P; for N≥4 only the identity automorphism fixes a point of order N.
- **Cusps:** at the infinity cusp the width is N and q=q_c^N.

## Suggested Lean file

The file now contains every node, API and test name in the packet; a script check found none missing. Additions:

- Honest definitions `ZeroDimShimura.rel`, `shimuraSet` (a `Quot`), `mk`, `map`, `singletonEquiv`, `galoisAct` (with the commutation hypothesis stated, not hidden) and `canonicalModel` (sorry-bodied, carrier missing).
- Schematic `component_map_defined_over_reflex` and `codim_one_extension`, in the file's style.
- Numerical tests for the counts that the carriers must reproduce.

`lean-check` at Mathlib 082e2d37e8, with 100 GB of memory available: **no errors; all 56 warnings are `declaration uses sorry`.**

The original theorem forms omit conditions that cannot yet be stated, as §13 permits, and the file's header says they are not valid universal statements. I did not count that as a defect. Restoring those hypotheses is recorded in the Lean-carrier gap.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V8.json`: **0 errors, 0 warnings**.
- The JSON parses; the packet text contains no Lean.
- Only the three deliverables changed.

## For the orchestrator

- Queue the revision BP-ShimuraVarieties--V8~2 with `readmes/ShimuraVarieties--V8.md` among its deliverables. It must regenerate the reader from this packet; the stale passages are listed in `review.notes`. Its review should check the three added nodes.
- The gap "Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding" asks V2 for complex Baily–Borel functoriality under datum morphisms. When V2 is planned, its packet should include that functoriality. Then V8's minimal-map-extension and codim-one-extension close without any change to ShimuraCompactifications.
- The withdrawn rescope proposal should not be acted on.
