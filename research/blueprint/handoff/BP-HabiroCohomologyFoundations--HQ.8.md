# BP-HabiroCohomologyFoundations--HQ.8 — handoff

The comparison atlas, and the **second and final part** of the blueprint for
*q-Hodge filtrations and Habiro cohomology*. Part one (HQ.1–HQ.7) shipped as
`BP-HabiroCohomologyFoundations--HQ.1`; everything compared here is built there.

Coverage of `HabiroCohomologyFoundations:HQ.8`: **`source_decomposed`**, empty
`remaining`. With part one, **all nine stages of the roadmap are decomposed.**

- Packet: `research/blueprint/packets/HabiroCohomologyFoundations--HQ.8.json`
- Document: `research/blueprint/readmes/HabiroCohomologyFoundations--HQ.8.md`
- Suggested Lean: `research/blueprint/suggested/HabiroCohomologyFoundations--HQ.8.lean`

**15 nodes** — 2 definitions, 8 theorems, 3 comparisons, 2 applications — with
13 API items, 8 unit tests, **6 planets**, 10 baseline declarations, 4 gaps and
10 requests. `check_blueprint.py`: 0 errors, 0 warnings. No Lean compiled.

## The shape of the layer

The layer is a **discipline plus seven squares plus one theorem**.

The discipline: a square carries a **seven-item record** — base, geometric
hypotheses, completion ideal, what is inverted and *in which order*, Frobenius
linearisation, filtration on each side, and the Tate or Breuil–Kisin twist. A
square with an incomplete record is not a square; a square is asserted over the
**intersection** of the hypothesis sets of its two imported maps; and a
comparison that is an equivalence only after a base change is recorded as that
functor, written out.

The seven squares:

| square | imported from | equivalence? |
| --- | --- | --- |
| local prismatic | `PrismaticCohomology:PR.6` | outright; commutes with the gluing **by construction** |
| q-crystalline | `PR.6` (Prisms Thm 16.22) | framing-dependent model; the compatibility square is the content |
| A_inf | `PR.6`, `AInfCohomology:AI.1` (Prisms Thm 17.2) | only after base change to the perfectoid base |
| décalage | `AI.1` (BMS1 §6, BMS2 Prop 5.8) | the two owned specialisations; and the obstruction |
| Nygaard | `PR.6` (Prisms Thm 15.3) | unique functorial filtered equivalence |
| crystalline | `CrystallineCohomology:CR.4` | the comparison map is **not** claimed to be an isomorphism |
| `q = 1` | `DerivedDeRhamCohomology:DD.2` | a **short exact sequence**, not an isomorphism |

And the theorem: the global arithmetic gluing and the q-Hodge modification
commute with each imported map on the intersection of the hypothesis sets, with
the argument named square by square.

## Three things worth flagging to a reviewer

1. **There is no étale square.** The stage text lists the global compatibility of
   the classical comparisons among the inputs, so a reader may expect one. The
   only route is the A_inf square followed by the classical comparisons, and the
   composite is an equivalence only along a composite of two base changes,
   neither conservative. Recorded in the ledger and in gap 4, with a structural
   note asking that the stage text say so.
2. **The staging rule is mechanically checkable.** The trace roadmap's syntomic
   comparison may be used only after the prismatic roadmap has independently
   constructed its objects, because the prismatic Nygaard filtration is *defined*
   from the Frobenius and the décalage filtration. Feeding the trace
   identification back would define a filtration by the comparison theorem it is
   meant to prove. The check is on the prerequisites of this packet and of the
   trace-theoretic node of part one, and it passes.
3. **The Lean file's contribution at this layer is a structure.** `AtlasSquare`
   has one field per item of the record, so an incomplete square cannot be
   stated. The three records that are written out — local prismatic, A_inf and
   `q = 1` — differ in exactly the fields the document says they differ in.

## Sources

Seven, all LaTeX from the arXiv e-print endpoint and hashed. Beyond the three
Wagner papers already in hand from part one:

| paper | arXiv | SHA-256 |
| --- | --- | --- |
| Bhatt–Scholze, *Prisms and prismatic cohomology* | 1905.08229v4 | `ff3378f0…` |
| Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory* | 1602.03148v3 | `ff989b40…` |
| Bhatt–Morrow–Scholze, *THH and integral p-adic Hodge theory* | 1802.03261v2 | `30968bad…` |
| Scholze, *Canonical q-deformations in arithmetic geometry* | 1606.01796v1 | `3facd5b9…` |

All four use one theorem counter per section, which is the numbering the main
source cites (Prisms Theorem 15.3, §16, Construction 16.20, Theorem 16.22,
Theorem 17.2; BMS1 §6 and Lemma 6.20; BMS2 Proposition 5.8; Toulouse §3 and
Lemma 4.1 — every one of them lands where the citation says).

## Gaps

1. **The proofs of the two comparison theorems** were read as statements and
   strategies. The A_inf comparison's two explicit complexes are what a
   formalisation would have to build; read that proof next.
2. **The classical crystalline corner is imported at statement level** — `CR.4`
   must decompose the relative de Rham–Witt complex *with* its restriction maps,
   so the two operator systems stay apart.
3. **The trace roadmap's syntomic squares are unread**; the staging rule was
   stated from the shape of the construction. Ask `RT.6` to state its squares in
   the seven-item form so the rule becomes a mechanical check.
4. **No étale square**, as above.

## Where the roadmap stands

Both parts are done: HQ.1–HQ.7 and HQ.8, 81 nodes in all. What blocks the
roadmap now is not decomposition but its suppliers. In rough order of leverage:

- `PrismaticCohomology:PR.6` — six of the seven squares import from it, and so
  does the whole local layer of part one. Nothing here can be formalised first.
- `AInfCohomology:AI.1` — the décalage functor, used in both parts.
- `HabiroRings:HR.2`/`HR.4` — Habiro-complete objects and the degree-zero
  q-Witt rings; already blueprinted, so these are ready to build.
- `RefinedTraceMethods:RT.4:q-Hodge` — the only supplier of examples outside the
  smooth and quasi-regular classes.
- `AnalyticHabiroStack` — still a draft roadmap, so HQ.6 has no owner for its
  analytic side. That is the one place where a decision, not work, is needed.
