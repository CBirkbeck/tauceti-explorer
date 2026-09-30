# REV-FIX-RT-AREA-langlands-1~2

Independent review of FIX-RT-AREA-langlands-1~2 (Codex, session `codex-J6LwjP`, issue #5140, PR #5267) for issue
#5141.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- the red team (`cc-39fac3`) or its verification (`codex-hjdg0j`);
- either round of fixes (`cc-58621d`, `codex-J6LwjP`);
- the later FIX-RT-AREA-langlands-2~2 (`codex-5ebb6f`);
- GlobalGaloisDeformations or its first review.

**Verdict: accepted, after one correction in place.**

## What I reviewed

**The file.** The only file under review is `research/blueprint/packets/GlobalGaloisDeformations.json`.

**What I read:**
- all 35 findings;
- the verifier's decisions (32 confirmed, and /11, /23, /28 rejected);
- the round-2 report `RT-AREA-langlands-1.fixes-2.md`;
- the round-2 commit's diff of the packet, node by node.

**The sources.** I downloaded both published PDFs the fix cites and checked that their SHA-256 hashes match the packet:
- ACC+, *Potential automorphy over CM fields*, Annals 197 (2023)
  (<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>, `c5429e4f…7f02`). I read printed pp. 1044–1047;
  printed pages are physical pages + 896.
- Calegari–Geraghty, Invent. Math. 211 (2018) (<https://www.math.uchicago.edu/~fcale/papers/CG.pdf>, `c0ba8de0…25c5`).
  I read physical pp. 114–115.

**What round 2 changed in the packet:**
- one new node, `R04.5/chebotarev-selmer-selection`;
- changed proof steps, hypotheses, acceptance tests and sources in `R04.5/odd-taylor-wiles-primes`,
  `G7/enormous-taylor-wiles-primes` and `G7/enormous-taylor-wiles-presentation`;
- two `consumerContracts`, for PA.4 and PA.3;
- a `fixAmendment`;
- the two published sources.

All earlier node ids, baseline declarations and source issues are preserved.

**The later edits.** PR #5282 (FIX-RT-AREA-langlands-2~2) edited the same packet afterwards:
- R04.3/local-to-global-presentation;
- R04.5/image-hypotheses;
- the G8 PA.3 exports;
- gaps, requests and coverage.

I checked those edits only for consistency with /21–/22. The G8 export notes agree with the PA.3 contract. This review
does not accept that job; REV-FIX-RT-AREA-langlands-2~2 covers it.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/GlobalGaloisDeformations.json --index <pinned
  declarations>`: 66 nodes, 0 errors, 0 warnings, before and after my correction.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- Graph: the new node's only external prerequisite is ArithmeticGaloisDuality R02.6. It adds no stage edge.

## /21 (medium, duplicate): one Taylor–Wiles selection owner. Right.

The verifier asked for four things. The packet now does all four.

1. **Shared machinery in R04.5.** `R04.5/chebotarev-selmer-selection` is a conditional lemma:
   - given localization maps on a finite-dimensional H, a detecting Frobenius class for each nonzero x, and a non-empty
     padding class;
   - it returns exactly q ≥ dim H admissible places outside any finite set, with the joint localization injective.

   I checked the argument:
   - Each chosen place strictly lowers the kernel's dimension.
   - Places of residue degree ≥ 2 over Q have Dirichlet density zero, since there are at most [F:Q] above each rational
     prime and they contribute at most Σ ℓ^{−2s}. So the detecting classes still contain degree-one places.
   - Padding keeps injectivity.
   - The test with H = 0 and q > 0 shows why the padding hypothesis is needed.

   `R04.5/odd-taylor-wiles-primes` and `G7/enormous-taylor-wiles-primes` now import the lemma. Each keeps its own
   residual-image argument.
2. **ACC+ Proposition 6.2.33 stays in G7.** It stays with its hypotheses exactly as printed on p. 1047: T = S,
   F = F⁺F₀ with F₀ imaginary quadratic, ζ_p ∉ F, enormous image, and q at least the dual Selmer dimension. It keeps
   g = qn − n²[F⁺:Q]. The published numbering is right: Definition 6.2.29 and Lemma 6.2.30 are on p. 1044, Lemma 6.2.32
   on p. 1045, and Proposition 6.2.25 is cited in the proof on p. 1047. So is the standing assumption on p. 1045 that
   k contains every eigenvalue of ρ̄(G_F).
3. **CG as a comparison only.** CG's Proposition 8.5 is recorded as a `variantComparison`, not as a second theorem. I
   checked it on physical p. 114. It assumes big image and a one-dimensional generalized Frobenius eigenspace, and
   counts q + |T| − 1 − [F:Q]n(n−1)/2 − l₀ variables. The packet says a PA branch using it must request that variant.
4. **The PA.4 contract.** It exports the actual data: Q_N, the orderings, the diamond action and the augmentation
   quotient. It leaves PA the levels, complexes, uniform bounds and specialisation. It also keeps PA's separate
   neatness places apart from the Taylor–Wiles choices.

**A note on "degree one".** ACC+'s proof of Proposition 6.2.33 says that a degree-one place lies over a rational prime
split in F₀. That is right for local degree [F_v : Q_ℓ] = 1, which I take to be ACC+'s meaning. The packet's lemma
selects places by residue degree, so it also excludes the finitely many primes ramified in F₀; its acceptance test is 2
in Q(i). This is harmless and makes the step hold under either reading. It is not a mistake in the source, and I record
none.

## /22 (medium, missing): arithmetic inputs to PA.3. Right.

The PA.3 contract names the actual producers:
- G8's variable-determinant problem, its representability and its presentation;
- G7's local diamond;
- G7's polarized presentation, for the polarized branch only.

It says that fixed-determinant and polarized dimensions must be recomputed rather than borrowed from ACC+'s g. It
leaves PA.3 the matching L7/L8/R08.2 local conditions and the geometric R-to-Hecke maps. It adds no L7 → P9 edge, as the
verifier required: P9 is the abstract algebra owner. No duplicate "export theorem" was created.

## The other findings: handoffs recorded, no change to this file. Right.

The packet is the only file assigned. The round-2 report sends each remaining confirmed high or medium finding to the
blueprint job that owns it: /1–/10, /12–/20 and /24–/27.

I compared four handoffs with the verifier's reasons:
- /2: EDC.8 already reaches AG2.1a, and the missing piece is the stronger Varshavsky theorem;
- /9: the handoff adds the TC terminal producer the verifier requires;
- /19: a single proposed GSp₄ owner;
- /26: the geometric-input-free factor theorem, with its explicit hypothesis comparison.

Each follows the qualified verdict rather than the raw proposal. The rejected findings /11, /23 and /28 get no edit,
which is right. The low findings /29–/35 are outside the §17 fix scope, and the report says where each belongs.

## Correction made

**The three new excerpts.** The three new `ACC-PUBLISHED-2023` excerpts were 6, 19 and 34 characters long: "ζp /∈F",
"g = qn −n2[F + : Q]" and "So by induction, it suﬃces to show". They are literal, but too short to identify their
passages, and PROTOCOL §5 asks for the passage that states or proves the node. I replaced each with a literal excerpt
of at most 300 characters from the same page, and checked it against the PDF:
- **Selection lemma:** the "So by induction …" sentence of Lemma 6.2.32's proof, through the degree-one condition.
- **`G7/enormous-taylor-wiles-primes`:** the statement of Lemma 6.2.32.
- **`G7/enormous-taylor-wiles-presentation`:** Proposition 6.2.33's hypotheses. Its `match` now says that the count
  g = qn − n²[F⁺:Q] is item (3) on the same page.

**Bookkeeping.**
- The `fixAmendment` status now records this review.
- My review object replaces the "pending" placeholder that FIX-RT-AREA-langlands-2~2 left.
- The accepted 2026-09-28 review stays in `reviewHistory`.

## For the maintainer

- **Edges to add.** The stage edges named in the contracts are for the maintainer and
  BP-PotentialAutomorphyInfrastructure to add: G7 → PA.4, and G7/G8/L7/L8/R08.2 → PA.3. The round-2 report checked
  them for acyclicity.
- **L7's wording.** L7's "export to P9" prose should be routed through PA.3, as the verifier says. That belongs to
  LocalGaloisDeformationRings, outside this file.
- **Lean.** The suggested Lean file is not a file under review, and I did not compile it.
