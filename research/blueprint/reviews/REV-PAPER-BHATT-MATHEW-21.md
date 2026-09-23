# REV-PAPER-BHATT-MATHEW-21

Independent review of the extraction of Bhargav Bhatt and Akhil Mathew, *The arc-topology*, Duke
Mathematical Journal **170** (2021), no. 9 (doi 10.1215/00127094-2020-0088; arXiv 1807.04725v4).

Issue [#1321](https://github.com/CBirkbeck/tauceti-explorer/issues/1321). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All four routes accepted. No item, status, route, locator or quotation changed.

## The source

arXiv v4 was re-fetched and hashes to `4cdf5593067a425ca0aebc969d34efa4ef296cde613c3d9a6c671db65b9b6620`
— **the recorded PDF hash, byte for byte**; 64 pages.

The published Duke version is genuinely unavailable rather than merely unfetched: **Unpaywall reports
`is_oa: false`** for the DOI and lists no open location, which independently confirms the
extraction's account, and arXiv's submission history ends at v4 (14 December 2020). The extraction's
decision to quote statement numbers from the source rather than pages from an unseen published text
is the right one.

## Mistakes

All **3** findings were checked at their locators. **All 3 are confirmed.**

**E1 and E2 are settled by the paper against itself.** The statement Remark 3.31 calls "Proposition
3.29" is headed **"Lemma 3.29"** on the same page (p. 23) and is called that twice more in the two
intervening paragraphs. The result the proof of Corollary 6.18 calls "Proposition 6.4" is headed
**"Theorem 6.4 (Formal glueing squares for arc-sheaves)"** on p. 48 and is cited as "Theorem 6.4" in
the introduction's Theorem 1.15. Both are wrong environment names on correct numbers.

### E3 is the substantive one

Theorem 1.19 of the introduction (p. 7), labelled as Theorem 7.3, reads:

> Fix a prime ℓ and let F be an ℓ-power torsion étale sheaf on Spec(A). **If A is smooth** or if ℓ is
> not the residue characteristic of K, then `H^i(Spec(A)_ét, F) = 0` for i > d.

**Theorem 7.3 itself (p. 56) has no smoothness clause at all**: part (2) assumes "ℓ prime to the
characteristic of the residue field of K", and part (1) gives only `i > d + 1` in general. What the
paper says about the smooth case is in Remark 7.4, which opens "We would **expect** that part (2) of
Theorem 7.3 holds for arbitrary torsion sheaves" and lists two special cases "**within reach**", the
second being:

> The algebraization method used to prove Lemma 7.8 below **can be adapted** to prove this statement
> when A is smooth (in the sense of rigid spaces) and **F is constant** …

and the same remark closes by saying that over p-adic fields "the general case remains out of reach
by our methods" — the opposite of a claim. So the introduction asserts for arbitrary ℓ-power torsion
sheaves what the body offers for constant sheaves only, and offers as an adaptation rather than a
proof. The extraction records this as a gap in what is claimed rather than as a false statement,
which is right, and both of its remedies are available: restrict the introduction's smooth disjunct
to constant coefficients and point at Remark 7.4(2), or write the adaptation out.

## Items, statuses, routes

**146 items: 4 library, 3 planned, 139 missing.** Every missing item is routed exactly once and all
dependencies resolve. The twelve declarations behind the four library items were opened at the pinned
commits and each says what its item claims — including the two least obvious,
`WithConstructibleTopology` (the type synonym carrying the constructible topology) and
`plusPlusSheaf` (sheafification into `Sheaf J D`). All eight stage ids cited by the routes and the
planned items exist in the atlas index.

### The new roadmap is as well-founded as any I have reviewed

A sweep of every roadmap extract in the atlas for *arc-topology*, *arc topology*, *v-topology*,
*h-topology*, *arc-descent* and *arc-sheaf* returns **nothing at all**. No layer anywhere plans the
arc-cover condition on rank ≤ 1 valuation rings, the identification of arc-covers with universally
spectrally submersive maps, finitary v-sheaves and the ultraproduct argument, aic-v-excision, the
Milnor-square characterisation, or the applications to étale cohomology, Picard and Brauer groups and
the affinoid comparison. The id is free and `etale` is a galaxy id.

And **five extractions propose this same roadmap with byte-identical id, title and area** — this one,
`PAPER-BHATT-SCHOLZE-17`, `PAPER-CESNAVICIUS-SCHOLZE-24`, `PAPER-CLAUSEN-MATHEW-MORROW-21` and
`PAPER-GUO-REINECKE-24`, with `PAPER-SCHOLZE-26` routing items to it. They coalesce on one design
job rather than competing, and the paper that introduces the topology is its natural home.

The three source routes are equally well drawn: `D0` ("Spectral topology, ordinary sites, and size")
takes the spectral-space, constructible-topology and site-size material; `LD.0` ("Languages and
interpretations") takes the ultraproduct transfer of §3.2, which is model theory rather than
geometry; and `K.5`/`K.6` take the nonconnective K-theory the excision results are applied to,
without asking that roadmap for arc-descent itself.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
