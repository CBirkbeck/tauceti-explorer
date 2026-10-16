# Classical Serre Modularity — the full theorem and the modern proof

This part plans `R27.6` and `R33.1`–`R33.6`. Its endpoint is one statement: an odd absolutely irreducible residual representation of the absolute Galois group of ℚ comes from a normalized characteristic-zero newform of Serre's exact weight and prime-to-characteristic conductor. The classical proof and the modern proof supply that statement through different qualitative arguments and a common conditional refinement. The regular compatible-system and finite-image odd Artin consequences are explicit exports.

This is an additive completion of the accepted parts [R26.1](ClassicalSerreModularity--R26.1.md), [R27.3](ClassicalSerreModularity--R27.3.md) and [R33.5](ClassicalSerreModularity--R33.5.md). The packet refines seven integrated targets using their stable IDs, adds two targets, and references twenty other targets without copying their nodes. All seven stages are **planned**. The five recorded gaps and seven consumer requests prevent proof closure; no arithmetic implementation or completed source-independence audit is asserted.

## Conventions and existing interfaces

Write $G_\mathbb Q=\operatorname{Gal}(\overline{\mathbb Q}/\mathbb Q)$, with a fixed complex conjugation $c$, arithmetic Frobenius and the cyclotomic character $\chi_p$. A residual representation is continuous with coefficients in a finite field $F$ of characteristic $p$, enlarged when necessary. Passing from an algebraic closure of the prime field to a finite coefficient field uses continuity and finite image. All isomorphisms of representations compare actual modules after a stated common coefficient extension. Semisimplified residual representations are named explicitly; a local extension is not determined by its semisimplification.

The single S-type and modularity interfaces are `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`. S-type means continuous, odd and absolutely irreducible of dimension two; odd means $\det\bar\rho(c)=-1$. In characteristic two this determinant condition is automatic: it does not require $\bar\rho(c)\ne1$. Serre's classical weight $k(\bar\rho)\ge2$, prime-to-$p$ conductor $N(\bar\rho)$, character $\varepsilon(\bar\rho)$, twisting laws and finite-extension invariance belong to R15.4–R15.6. Classical weight two or four at $p=2$ must be distinguished from Katz weight one.

A strong witness records a normalized newform $f$, its coefficient field, a place $\lambda\mid p$, a stable integral model, an identification of residue fields and an isomorphism with $\bar\rho$. Its equations include

$$
 \mathrm{wt}$f$=k(\bar\rho),\quad \mathrm{lev}$f$=N(\bar\rho),\quad
 \overline{\varepsilon_f}=\varepsilon(\bar\rho),\qquad
 \det\bar\rho=\varepsilon(\bar\rho)\bar\chi_p^{k(\bar\rho)-1}.
$$

The equality for the reduced character does not identify characteristic-zero characters. The form itself uses the existing `HeckeRing.GL2.Newform N k`, whose nebentypus is a field of its eigenform structure. At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `Newform.qExpansion_coeff_one` states that the first coefficient of its underlying cusp form is one. No replacement form carrier is planned here. The light matrix examples use Mathlib `Matrix`, `Matrix.det` and `Matrix.mulVec` at `082e2d37e8b0463410cdb532e111cd43d5a66174`.

The reviewed library audit marks all seven scoped stages as not built. Searches at both pins and current Tau Ceti found generic representations, cyclotomic characters and newforms, but not the required global Serre interfaces. Current TauCetiRoadmap was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current LocalGaloisGroups roadmap supplies its local group, roots-of-unity and cyclotomic plans; current ModularForms supplies the newform and coefficient-field direction. They are imported, never replanned. The packet's baseline and upstream notes record the exact files and boundaries.

## Sources and ownership

The source locators below refer to these texts, all read on 16 October 2026. Hashes and the portions actually read are in the packet. The text states the mathematics in our own words.

| Key | Text and pagination |
| --- | --- |
| KW I | Khare–Wintenberger, [author preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf), 23 author pages. The Inventiones pagination 485–504 is not substituted for this pagination. |
| DP v2 | Dieulefait–Pacetti, [arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2), 3 May 2022, body pp.1–15. The whole preprint was read. |
| DP published | [RACSAM 117 (2023), article 153](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), 17 article pages. The transfer condition, family statement, Pasos and revised dyadic lemma were compared with v2. |
| BCDT | Breuil–Conrad–Diamond–Taylor, [80-page author copy](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf). Theorem B is author p.1, definitions pp.2–3, Theorem 2.2.1 and proof pp.17–19. The publisher PDF was inaccessible. |
| SW | Skinner–Wiles, [Numdam published scan](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), introduction theorem, printed p.6, PDF page 3. Its hypotheses were checked on the page image. |

Accepted RS-06 fixes the boundary: R24 owns existence of lifts and compatible systems; R32 owns the modern modularity lifting inputs; R25 owns the small-prime base cases and abelian-variety realization; R33 owns their applications. The early R27.1 good-dihedral and Chebotarev facts are usable by the modern proof. The classical level/weight induction is not one of its inputs.

The new paper routing puts the **general irregular-system theorem**, KW I Theorem 10.1(ii), and general weight-one descent in `ModularityAndLanglandsExtensions:ML.1`. The finite-image odd Artin Corollary 10.2(ii) remains an explicit R27.6 export as required by confirmed finding `RT-AREA-langlands-2/8`. Over ℚ, ML.1 registers that export, R17.5's solvable results and R19.1's Deligne–Serre construction; it does not reconstruct them. General descent belongs there, with the cohomological and weight inputs imported from R15/R20. There is no ML.1 prerequisite of this part.

## R27.6 — the full classical statement

### The all-characteristic endpoint and its conditional refinement

Retain `R27.6/full-classical-serre-theorem`: every S-type $\bar\rho$, in every characteristic, has the strong witness above. The qualitative classical inputs are `R27.4/theorem-1-2` and `R27.5/hypothesis-H-and-theorem-9-1`; the latter uses the exact dyadic hypothesis-H supplier `GL2ModularityLifting:R22.6/hypothesis-h`. KW I Theorems 1.2 and 9.1, author pp.2 and 18–19, divide the cases as follows:

| Residual case | Classical qualitative supplier |
| --- | --- |
| Odd $p$, odd $N(\bar\rho)$ | Theorem 1.2 |
| Odd $p$, even $N(\bar\rho)$ | Theorem 9.1 |
| $p=2, k(\bar\rho)=2$ | Theorem 1.2 |
| $p=2, k(\bar\rho)=4$ | Theorem 9.1 and hypothesis H |

Add `R27.6/qualitative-to-refined-passage`: **assuming modularity of this representation**, produce its strong witness, uniformly in $p$. This implication is the common refinement used by both proof routes. It assumes neither unconditional classical Serre modularity nor an unconditional refinement hidden inside the R20.6 case table.

For odd $p$, first twist into $2\le k\le p+1$, choose the minimal crystalline lift of KW I Theorem 5.1(1), and apply its Theorem 4.1 using the supplied modular residual witness. The exact suppliers are `R27.4/strong-form-by-minimal-lifts`, R24.3's minimal crystalline lift and `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`. Untwist through R20.3's weight theorem and R15.5 eigenvalue lifting. The cyclotomic twist preserves the prime-to-$p$ conductor. The minimal characteristic-zero level and the residual conductor bound force exact level $N(\bar\rho)$.

At $p=2,k=2$, use the dyadic conditional minimal-lift argument, including scalar local restriction with non-dihedral global projective image. `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic` is the lifting supplier. This scalar branch explains the placement of the implication after R27.4; putting it in R20 would create an ownership reversal. At $p=2,k=4$, the local representation is nonfinite and hence nonscalar. Import `R20.5/nonscalar-dyadic-multiplicity-one` and `R20.5/buzzard-weight-and-level-mod-two`, with the weight-three Katz output raised to classical weight four. The representation induced from ℚ(i) uses the independently supplied dihedral optimisation. The R20.6 table is a map of these conditional cases, not an extra unconditional theorem.

**Checks.** Cover odd $p$, dyadic weight two, and dyadic weight four; include scalar dyadic restriction in the second branch. For $p=5$, a representation with local inertia $\bar\chi_5\oplus\bar\chi_5^2$ can have original Serre weight above six; invoking Theorem 5.1(1) before normalization is invalid. The determinant test must distinguish a character reducing to one from the trivial characteristic-zero character. Every output must name its coefficient place, stable model and common residue field. KW I §3.2, author p.6, omits the refinement details; finding E9 is supplied by this conditional argument.

### Finite-flat weight two and the BCDT specialization

Retain `R27.6/finite-flat-weight-two-export`. For $p\ge5$, an S-type $\bar\rho$ finite flat at $p$ with $\det\bar\rho=\bar\chi_p$ comes from a normalized newform of exact level $N(\bar\rho)$, weight two and trivial nebentypus. Use `R15.4/weight-two-iff-finite-flat-at-p` with its coefficient-field/Raynaud finite-vector-space-scheme hypotheses. A bare group of order (p^2) does not describe an arbitrary $F$-linear residual representation. The determinant identity gives $\varepsilon(\bar\rho)=1$; `R20.4/nebentypus-congruent-character` supplies Carayol's replacement of the characteristic-zero nebentypus by one. The resulting level divides $N(\bar\rho)$, and the residual conductor divides that level, so equality follows. At good primes $r\nmid pN\$, its coefficient satisfies $a_r\equiv\operatorname{tr}\bar\rho(\operatorname{Frob}_r)\pmod\lambda$.

Add `R27.6/bcdt-mod-five-cyclotomic-special-case`. BCDT Theorem B, author p.1, concerns a continuous irreducible representation into **GL₂(𝔽₅)** with cyclotomic determinant. Theorem 2.2.1, author p.17, uses absolute irreducibility. The unbarred coefficient field was checked on the page image. Cyclotomic determinant makes the representation odd; the odd-characteristic irreducibility criterion in R01.4 then gives absolute irreducibility. Applying the full Serre theorem supplies the refined witness, and forgetting refinement recovers BCDT's modularity conclusion. BCDT also give a direct proof for their elliptic-curve application; their wild-three deformation work and full elliptic-curve theorem retain their other owners.

**Checks.** A representation with no 𝔽₅ model lies outside the printed BCDT special case, although the full theorem covers it. Reducibility cannot yield the cuspidal witness claimed here. Theorem B has no finite-flat hypothesis; it must not be reported as an unconditional weight-two theorem. The finite-flat export retains $p\ge5$ and the exact character-change supplier.

### Regular compatible systems

Refine the stable application `R27.6/scope-of-the-final-statement-and-the-compatible-system-export`, KW I Theorem 10.1(i), author p.20. Let $(\rho_\lambda)$ be an E-rational compatible system in KW I §5, every characteristic-zero member irreducible and odd, with fixed Hodge–Tate numbers (a>b), bounded conductor and crystallinity at sufficiently large coefficient primes. After the Tate twist that makes its numbers ({a-b,0}), one normalized newform of weight $a-b+1\ge2$ supplies every member after common coefficient extension.

Use `R24.6/residual-members` to remove the finite exceptional set for residual irreducibility and to enter the Fontaine–Laffaille range. Apply the full strong theorem to infinitely many residual members. Their weights are fixed and levels divide a single integer $B$. The current ModularForms coefficient-field/Hecke layer supplies finiteness of normalized forms of levels dividing $B$; retain the finite choices of characters and coefficient embeddings. The packet requests that exact finite-choice contract rather than recreating the coefficient-field theory.

One form and embedding recur in infinitely many **distinct rational residue characteristics**. For each fixed good prime $r$, the trace and determinant differences are algebraic integers divisible by primes above infinitely many rational primes, so they vanish. The polynomials of the system equal those of the form. `R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent` identifies the representations in each fixed characteristic; `R19.3/fixed-eigenform-compatible-family` supplies the form's system. This is not an isomorphism between representations in different characteristics.

**Checks.** Equal Hodge–Tate numbers do not fit this regular theorem. Irreducibility of every characteristic-zero member does not make every residual member irreducible. A conductor bound must precede the finite-choice argument. Infinitely many coefficient places over finitely many rational primes would not prove equality of algebraic integers.

### The odd Artin export and the weight-one boundary

Retain `R27.6/odd-artin-weight-one-modularity`, KW I Corollary 10.2(ii), author p.21. A continuous irreducible odd $\rho:G_\mathbb Q\to\mathrm{GL}_2(\mathbb C)$ in the Artin setting has finite image and comes from a normalized weight-one newform. If $N$ is its Artin conductor, put $N'=N$ when $N\ge5$ and $N'=5N$ otherwise. A witness of level dividing (N'), character $\det\rho$, and $\rho\simeq\rho_f$ suffices. Exact conductor equality for the characteristic-zero attached representation is a separate R19.1 comparison, not needed to overstate this conclusion.

The finite-image proof uses the following contracts directly. It is not an invocation of the general irregular-system theorem that ML.1 owns.

1. Choose a number-field model of the finite group representation and stable lattices. Outside finitely many primes dividing the group order, discriminant and denominators, Maschke/averaging preserves absolute irreducibility and inertia invariants. Thus the residual representations are S-type, have conductor $N$, and are unramified at the coefficient prime. The existing `R27.6/artin-reductions-of-serre-type` helper gives this finite-group argument through R01.1’s coefficient/lattice comparison and R01.3’s conductor. R01.5 supplies final recognition. This finite-group argument is narrower than a claim about every compatible system.
2. Chebotarev applied to the complex-conjugation class gives infinitely many distinct odd coefficient primes for which residual Frobenius has distinct eigenvalues (1,-1). After excluding the finite exceptional set, this is the nonexceptional unramified branch of `R20.3/edixhoven-weight-theorem`. The strong Serre theorem and the weight theorem yield Katz weight-one cusp eigenforms at fixed level dividing (N'). Classical Serre weight at an unramified Artin prime is the characteristic, not one.
3. Fix the fine compactified Γ₁((N')) curve over $A=\mathbb Z[1/N']$ and its weight-one cusp sheaf. R15.2 supplies the integral section lattice and Hecke action. Proper coherent **H¹ finiteness**, together with the reduction exact sequence, implies that the cokernel of reduction is its (ell)-torsion. It vanishes outside finitely many (ell). This is an exact request to R15.2: finite generation of H⁰ alone and Katz's low-level base-change theorem do not establish it. Character projectors are used only after excluding their finitely many denominator primes.
4. Use `R15.5/deligne-serre-eigenvalue-lifting-lemma` on the finite integral Hecke module and `R15.1/all-weight-analytic-comparison`. There are finitely many characteristic-zero weight-one eigensystems at the fixed level. One eigensystem recurs infinitely often, so its good traces and determinants equal those of $\rho$, by the algebraic-integer argument above. `R19.1/weight-one-artin-representation` constructs its Deligne–Serre representation; R01.5 then identifies it with $\rho$.

General statements about descent from infinitely many residual weight-one witnesses move to ML.1. The older R27.6 descent nodes are assembly redirects, not fresh duplicate nodes. The required arrows are R19.1→ML.1, R17.5→ML.1 and R27.6→ML.1. None points back here.

**Checks.** The odd irreducible S₃ representation is a finite-image test case; its weights ((0,0)) exclude it from the preceding regular-system theorem. Exclude primes dividing the image order before claiming reduction preserves irreducibility. Exclude the finite H¹ torsion set before claiming surjectivity. A proof that treats every Katz weight-one form as the reduction of a characteristic-zero form fails at the stated boundary. The non-solvable Artin case cannot be obtained merely by citing Langlands–Tunnell.

## R33.1 — qualitative target and first weight change

The stable `dp-target-and-the-weight-at-least-two-convention` uses R15.6's modularity predicate with some characteristic-zero cuspidal eigenform of weight at least two. An oldform witness is replaced by its newform with the same good eigenvalues, then recognized using residual absolute irreducibility. The preliminary theorem assumes a weight-one witness and replaces it by a weight-at-least-two witness; it does not assume the qualitative Serre theorem. For odd solvable image, `R17.5/q-solvable-residual-weight-one` supplies that input. Apply `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`: multiply an integral model by an Eisenstein E_n congruent to one, with n≥4 even and divisible by p−1, then lift the resulting good eigensystem. E₄ works at p=2,3. The form is already in an integral reduction image, so this step needs no general Katz weight-one base-change theorem. DP Remark 1, p.1 (published p.2), invokes this Deligne–Serre congruence. The nonsolvable qualitative goal remains R33.4/R33.5’s conclusion. Prescribed weight and level are not hypotheses of the qualitative proof.

The stable `dp-modularity-lifting-inputs` is an application table, not another owner of modularity lifting. All characteristic-zero inputs are continuous, odd, finitely ramified and regular de Rham of dimension two.

| Branch | Exact conditions and supplier |
| --- | --- |
| Odd residual irreducible | Common residual representation absolutely irreducible on $G_{\mathbb Q(\sqrt{p^*})}$, $p^*=(-1)^{(p-1)/2}p$. Use `R32.6/transfer-residually-irreducible-odd`, including $p=3$. The restriction criterion is R01.4, not global irreducibility alone. |
| Dyadic residual irreducible | Common nonsolvable residual image. Use `R32.6/transfer-dyadic`, for the respective regular weights of both lifts. |
| Residual reducible, $p\ge5$ | Characteristic-zero irreducibility and regular de Rham behavior. Use `R32.6/transfer-residually-reducible`. No residual modularity or ordinarity is inserted. |
| Residual reducible, $p=3$ | After the specified twist, residual semisimplification $1\oplus\bar\chi_3$; characteristic-zero inertia has a trivial quotient; determinant $\psi\chi_3^{k-1}$, $k\ge2$, $\psi$ finite order. Use `R32.5/p-three-residually-reducible-branch` and `R21.5/theorem-a-at-three`. |

SW printed p.6 requires the residual character to be nontrivial on the decomposition group. Here $\bar\chi_3$ is already nontrivial on inertia. This resolves the old R27.3 packet's second-bullet gap for DP Theorem 1.7. Pan's $p\ge5$ branch is not used at three. DP's suppressed finite-order qualification on $\psi$ is retained from the exact SW theorem.

Within a single system, `R24.6/linked-systems-modularity-transfer` compares each member with the member of the modular-form system in the **same** coefficient characteristic. Between two different systems, a common residual representation requires the appropriate lifting theorem; characteristic-polynomial recognition alone does not cross a congruence.

Retain `fontaine-laffaille-member-not-bad-dihedral`, `solvable-residual-termination` and `paso-1-weight-two-system`. For initial odd $p$, twist to $2\le k\le p+1$, choose a minimal crystalline lift and its KW system. Select (w>2k) outside the system's ramification set. The $w$-adic member is crystalline with residual normalized weight $k$. R15.4's bad-dihedral weight consequence would force $w=2k-1$ or (2k-3), both excluded. A reducible reduction terminates by the $p\ge5$ branch; an irreducible solvable reduction terminates by Langlands–Tunnell plus the odd lifting branch. Otherwise choose KW Theorem 5.1(2)'s weight-two lift and system and transfer modularity at $w$. This lift need not be crystalline at $w$. Its system ramification set (S_1) may include $w$; an equality with the old system's set is unnecessary.

**Checks.** At weight two, any auxiliary odd (w>3) avoids bad dihedral; $w=3$ is not covered. Residual reducibility never contradicts the assumed irreducibility of the characteristic-zero member. The output has weights ({0,1}), a finite ramification set, all members odd and irreducible, and the old representation is modular if the new system is modular. DP §2 Paso 1, pp.9–10, and KW I Theorem 5.1(1),(2), p.9, supply these choices. The full arbitrary de Rham version of DP Theorem 1.11 is not needed.

## R33.2 — good-dihedral auxiliary ramification

### Local type already owned by the preceding part

Import `R33.2/dihedral-local-type-at-n`. Choose odd primes (q>5), $N\ne q$, with $q\mid N+1$. A niveau-two tame character $\kappa$ of the unramified quadratic extension of ℚ_N has exact order $q$, is trivial on the uniformizer and takes values in the integers $\mathcal O$ of a finite extension of ℚ_q containing $\mu_q$. Its induction has standard lattice $\mathcal Oe_1\oplus\mathcal Oe_2$, inertia matrices $\operatorname{diag}(\kappa,\kappa^N)$ and Frobenius swapping the basis. This is the existing local-type construction, not a new node here.

Its API includes the exact-order character, uniformizer normalization, induced representation, characteristic-zero irreducibility, irreducible reduction away from $q$, named standard lattice, its split reduction $1\oplus\eta$ in characteristic $q$, and lattice-independent **semisimplified** reduction. The integral closure symbol over ℤ_q was checked in DP's page image; the paper does not assert that ℤ_q itself contains an element of order $q$.

The inherited tests distinguish $|\mathbb F_{25}|=25$ from $|\mathbb F_{25}^{\times}|=24$; $q=7,N=13$ gives niveau two, whereas $q=3,N=7$ gives a niveau-one character and fails the local irreducibility test. On the standard lattice in characteristic $q$, inertia becomes trivial and Frobenius trace is zero. Removing uniformizer normalization can add scalar image; it cannot be ignored in an image-order assertion. At $(q,N)=(3,2)$, the adapted lattice below has nontrivial residual inertia, so no full residual-module assertion may omit the lattice.

### Insertion construction and API

Refine `dp-lift-existence-and-good-dihedral-insertion`. From the weight-two system choose $q>\max(S_1\cup\{5\})$, $q\equiv1\pmod4$, split completely in the coefficient field $K$. The selected completion and residual coefficient field are then ℚ_q and 𝔽_q. A solvable reduction terminates as in R33.1. Otherwise early `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` supplies $N\notin S_1$ such that residual Frobenius has trace zero, $N\equiv-1\pmod q$, $N\equiv1\pmod8$, and $N\equiv1\pmod r$ for every odd prime (r<q). After an unramified twist the residual local module is $\bar\chi_q\oplus1$.

Use `R24.3/modern-prescribed-type-lifts` with a specified determinant and definite local lifting problem, crystalline weight two at $q$, the induced type at $N$, and actual local solutions. Its residual restriction and the $p=5$ exceptional-image conditions are satisfied in this use. The local solution at $N$, including determinant and full Frobenius compatibility, is an explicit R08.6 consumer request. A matching semisimplified inertial type is not enough. The resulting crystalline weight-two lift is within `R24.5/dieulefait-families`'s accepted A/B/C scope. The system has ramification **contained in** $S_1\cup\{N\}$, with the $N$-type present, and is modular exactly when the old system is.

The planned namespace is `TauCeti.SerreConjecture.DP`. The six API items serve the following consumers:

| Declaration suffix | Contract |
| --- | --- |
| `GoodDihedralInsertion` | Package the chosen $q,N,\kappa$, system, local lifting problem and all inequalities/congruences. Used by Pasos 3–5. |
| `.system` | Project the irreducible odd weight-two almost strictly compatible system with the stated ramification bound. |
| `.type_at_N` | Identify its inertial WD parameter with $\kappa\oplus\kappa^N$. Used in the protected-image argument. |
| `.congruences` | Return the congruences modulo 8, all small primes and $q$, without unfolding choices. |
| `.modular_iff` | The two systems are modular simultaneously through the odd lifting theorem. |
| `.residual_iso` | The selected integral q-adic model reduces to the old full residual Galois module after common finite scalar extension; any modular form witness uses the existing Newform carrier. |

**Unit tests.** (1) For $q=13$, the prime $N=406561$ is one modulo (8,3,5,7,11) and minus one modulo 13. This checks congruences, not that this particular prime has the required Galois Frobenius. (2) $13\mid406562$ and $13\nmid406560$, distinguishing niveau two. (3) If $q$ is inert in a quadratic coefficient field, the residual coefficient field is 𝔽_q²; 𝔽_q-rationality is not automatic, so the rational version of the prime-choice lemma cannot simply be used. (4) $q=5$ fails the required bound (q>5). (5) This construction cannot answer a request for all four branches of DP Theorem 1.9; R24.3 owns that theorem. (6) Residual weight (q+1) cannot be used for this crystalline weight-two clause. The source is DP Paso 2, pp.10–11; its lift existence is imported from §1.3, pp.5–6, with the exact supplier qualifications above.

Retain `lemma-2-1-large-image`: the induced $N$-type protects nonsolvable residual image at every coefficient prime in $S_1\cup\{2,3\}$. The order-$q$ inertia survives reduction because those primes differ from $q$. The irreducible local decomposition module rules out a split quadratic inducing field; congruences force splitting at $N$ for every possible quadratic field unramified outside the controlled small primes. Ramification at $N$ is excluded by the odd inertia order. Dickson's classification excludes the remaining solvable possibilities. This uses only early R27.1 image and Chebotarev facts plus R01.4, not its mixed alias containing dihedral modularity.

Retain `paso-3-killing-the-odd-level`. Iterate on the finite set of unwanted odd primes other than $N$. Reduce at such a prime $r$, use the protected nonsolvable image, choose the normalized minimal crystalline lift and its KW system, and transfer modularity at $r$. Minimality in KW's sense preserves the exact prime-to-$r$ $N$-type; DP's weaker unramified-place definition alone does not. The new system WD parameter at $r$ is unramified, so its finite ramification set loses $r$. The characteristic-zero $r$-adic member itself has cyclotomic determinant and is not claimed unramified at $r$. The cardinality of the unwanted odd set strictly decreases, and the output ramifies only at (2,N), or only $N$. Keep $N$ in every bound; the printed Paso 3 bound suppresses it. Source: DP Paso 3, p.12; KW I §5 minimality, pp.8–9.

## R33.3 — two, the order-three type, and the auxiliary prime

Retain `paso-4-removing-two`. If the system from Paso 3 is already unramified at two, proceed to removing $N$. Otherwise protected nonsolvable residual image at two permits two cases. Weight two has a minimal crystalline dyadic lift and system, removing two. Weight four first requires a weight-two Steinberg lift at two, then the following congruence at three, then the weight-two conclusion and a minimal crystalline lift at two. The order matters. All uses at two have the exact nonsolvable-image dyadic transfer, and the congruence at three uses the odd transfer. The type at $N$ is retained throughout.

### The order-three construction, two lattices and its API

Refine `dp-dyadic-transition-and-the-order-three-type`, DP Lemma 2.3, pp.12–13, compared with the published version at the same pages. The input system has weights ({0,1}), is unramified at three, and is Steinberg at two with an unramified twist; its mod-three image is nonsolvable. The 3-adic member is crystalline of weight two at three. Locally at two its residual module is an unramified twist of an extension of (1) by $\bar\chi_3$. At arithmetic Frobenius two these characters have eigenvalues (1,-1). Residual inertia is trivial or a nontrivial order-three unipotent module. The tame relation makes these the two relevant local normal forms.

Let $\mathcal O=\mathbb Z_3[\zeta]$, $\zeta^2+\zeta+1=0$, $\pi=\zeta-1$. Induce a normalized order-three character of $G_{\mathbb Q_4}$, where ℚ₄ denotes the unramified quadratic extension of ℚ₂. On $L_0=\mathcal Oe_1\oplus\mathcal Oe_2$, write

$$
 D_0=\begin{pmatrix}\zeta&0\\0&\zeta^2\end{pmatrix},\quad
 F_0=\begin{pmatrix}0&1\\1&0\end{pmatrix}.
$$

On $L_1=\mathcal O(e_1+e_2)\oplus\mathcal O\pi e_2$, the matrices are

$$
 P=\begin{pmatrix}1&0\\1&\pi\end{pmatrix},\quad
 D_1=\begin{pmatrix}\zeta&0\\\zeta&\zeta^2\end{pmatrix},\quad
 F_1=\begin{pmatrix}1&\pi\\0&-1\end{pmatrix},
 \qquad D_0P=PD_1,\quad F_0P=PF_1.
$$

They satisfy $D_i^3=F_i^2=1$ and $F_iD_iF_i^{-1}=D_i^2$. The determinant of (P) is $\pi$, nonzero but a nonunit. After reduction, $D_0=1$, whereas $D_1=\left(\begin{smallmatrix}1&0\\1&1\end{smallmatrix}\right)$ has one-dimensional invariants. The Frobenius traces agree but the full residual inertia modules do not. Swapping the adapted basis gives upper-unipotent inertia and Frobenius $\operatorname{diag}(-1,1)$, matching the nontrivial Steinberg reduction after its unramified twist.

For trivial residual inertia, the published lemma permits a minimal lift unramified at two, removing two immediately. If an order-three type is selected, (L_0) matches that residual module. For nontrivial residual inertia use (L_1); the published proof uses the equivalent integral standard representation of S₃. In that branch apply KW I Theorem 5.1(4) at coefficient prime three and local prime two: $3\mid2+1$, residual weight two, absolute irreducibility on $G_{\mathbb Q(\mu_3)}$, and the required local extension shape. The exact R24.3 part-(4), R08.6 local condition and `R24.5/kw-theorem-5-1-systems` suppliers yield the changed system. This restricted KW theorem avoids an unsupported assertion that every inertially compatible type has a global lift. The symbol for the induced local representation at two has **3-adic coefficients**; it is not the new dyadic member.

The API, in the same DP namespace, has nine entries:

| Declaration suffix | Contract and use |
| --- | --- |
| `orderThreeCharacter` | Normalized order-three niveau-two character valued in $\mathcal O^	imes$, trivial on the uniformizer; used to define the induced type. |
| `orderThreeType` | Induced local representation with inertia $\chi'\oplus\chi'^2$, monodromy zero. |
| `orderThreeType.standardLattice` | (L_0,D_0,F_0) above, agreeing with R33.2's standard induced lattice. |
| `orderThreeType.adaptedLattice` | (L_1,D_1,F_1) and integral intertwining identities; the ramified residual branch. |
| `orderThreeType_standardLattice_reduction` | Split $1\oplus\eta$ as a full local module, with trivial inertia. |
| `orderThreeType_adaptedLattice_reduction` | Nonsplit inertia module with the displayed Frobenius and one-dimensional invariants. |
| `orderThreeType_exists_lattice_reduction_iso` | Select (L_0) for the split branch and (L_1) for the nonsplit branch, including the unramified twist and full decomposition-group isomorphism. |
| `orderThreeType_isCompatible` | Produce the local stable-lattice compatibility used by the lift theorem, together with trace zero at Frobenius. |
| `typeChangeAtTwo` | Modularity equivalence of the input and changed systems, by the odd transfer at three. |

**Unit tests.** (1) $|\mathbb F_4^	imes|=3$ and $|\mathbb F_2^	imes|=1$, distinguishing niveau two. (2) The splitting field ℚ₄$(\sqrt[3]2)$ has total degree six and **ramification index three** over ℚ₂; only the latter is used. (3) Steinberg monodromy is nonzero, so it cannot be identified with the potentially crystalline order-three type. (4) Ramification of the system at three invalidates the automatic crystalline-weight-two input there. (5) Verify the standard matrices' order and tame relation. (6) Verify both integral intertwining identities and the corresponding relations on the adapted lattice. (7) Compute the adapted residual invariants: precisely vectors with first coordinate zero are fixed. (8) The standard lattice fails to match ramified residual inertia because its invariant space has dimension two. (9) In the split case standard Frobenius has the distinct eigenvalues (1,-1), agreeing with $\bar\chi_3(\operatorname{Frob}_2)=2$. These checks use the actual matrix action and distinguish lattices, rather than comparing only traces.

### Dyadic weight and removal of N

Retain `remark-6-weight-two-after-type-change`. The new dyadic member becomes crystalline of weights ({0,1}) over the splitting field of the order-three type, with ramification index three. The R07 crystalline-to-Barsotti–Tate comparison makes its residual representation finite flat there. A very ramified mod-two representation is finite flat over **no** extension of odd ramification index; the exact R15.4 contract therefore gives weight two. DP Remark 6's mention of flatness over an even-index extension does not by itself contradict flatness over an odd-index one. The stronger obstruction is an explicit open supplier obligation. It is imported from R15.4/R07, not from R27.5. Then a minimal crystalline weight-two lift removes two from the system's ramification set.

Retain `paso-5-killing-the-good-dihedral-prime`, DP p.14. The remaining weight-two system has ramification set contained in ({N}). Reduce its $N$-adic member. If the reduction is reducible, apply the $p\ge5$ branch, using characteristic-zero irreducibility and regular **de Rham** behavior only. Almost strict compatibility supplies no ramified WD comparison in this branch, and none is needed. If the reduction is irreducible, it cannot be bad dihedral: its residual level is one, and `R25.5/level-one-dihedral-classification` requires a bad-dihedral prime to be three modulo four, while $N\equiv1\pmod8$. Normalize its Serre weight, choose a minimal crystalline lift and its KW system, then transfer modularity at $N$. The new system has empty ramification set; its weight is not asserted to remain two.

**Checks.** All congruences before removing $N$ preserve the protecting $N$-type. The level-one exclusion at $N$ must be used before that prime is removed. At a ramified coefficient prime with reducible residual image, inserting full WD compatibility would invalidate the proof's stated scope. An empty system ramification set does not mean a p-adic representation is unramified at its own coefficient prime.

## R33.4 — terminal characteristic five

Refine `dp-terminal-characteristic-five-and-the-schoof-base-case` and retain `dp-odd-characteristic-assembly`. Start with the system of empty ramification set from Paso 5. At five, residual reducibility terminates by the $p\ge5$ branch. The level-one bad-dihedral case is excluded because $5\not\equiv3\pmod4$. Otherwise the even twist-normalized weights are (2,4,6). DP Paso 6, pp.14–15, is an application of R25.5's terminal-case package, not a new owner of its results.

For weights two or four, take a minimal crystalline lift in a system of empty ramification set and reduce its 3-adic member. `R25.2/tate-serre-base-case` makes that reduction reducible. `R25.5/ordinary-reducible-terminal-weights`, through the Berger–Li–Zhu consequence at R06.4/R21.5, makes the crystalline member ordinary in weights (2) and $4=3+1$. After fixing the unramified quotient, the global residual characters are $1,\bar\chi_3$: they are unramified outside three, and the ordinary restrictions have exponents (0,k-1), with (k-1) odd. The determinant has the finite-order factor required by SW. Thus `R21.5/theorem-a-at-three` applies. Compatibility gives level one on the modular side. The spaces in weights two and four at level one vanish, yielding the needed terminal contradiction, or equivalently ending modularity propagation at the modular member.

For weight six, choose a weight-two lift Steinberg at five and unramified elsewhere. `R25.5/snowden-realisation` produces a positive-dimensional GL₂-type abelian variety with the corresponding Tate realization; `R25.5/reduction-of-the-realisation` compares **all** conjugate Tate components and the coefficient/Hodge normalization to get good reduction outside five and semistability at five. `R25.4/schoof-theorem` excludes such a nonzero variety. A single component without the realization comparison is insufficient to assert the reduction behavior of the entire variety; that exact consumer obligation is retained.

Transfer at five returns to the level-one system and then through the saved modularity equivalences to the initial representation. No unconditional Serre theorem is used in the terminal argument. **Checks:** cover all three weights and both reducibility branches; include the boundary $k=3+1$ in the ordinarity theorem; require the finite-order determinant factor; require $dim A\ge1$; and keep the Tate–Serre and Schoof base cases at R25 rather than substituting the classical level-one induction.

## R33.5 — characteristic two and qualitative closure

Retain `auxiliary-odd-prime-for-the-dyadic-system`, refine `dp-characteristic-two-closure`, and retain `qualitative-serre-theorem` and `globalisation-dependency-check`. For an irreducible mod-two representation with solvable image, R01.4's dyadic classification gives dihedral image. Import `R17.6/weight-two-witness`, including its Rohrlich–Tunnell modularity supplier. This branch needs no characteristic-two lifting theorem.

For nonsolvable image, choose the irreducible odd weight-two KW system: Theorem 5.1(1) for dyadic weight two, or (2) for weight four. Select an odd rational prime (w>3) outside its finite ramification set. The $w$-adic member is crystalline of weight two and irreducible. Its reduction can be reducible: then use the $p\ge5$ branch directly. If irreducible, it has residual weight two and is not bad dihedral; the **already established odd-characteristic** qualitative theorem supplies residual modularity, and the odd transfer makes the $w$-adic member modular. Identify every member with that form's system, separately in each coefficient characteristic; the original dyadic residual representation is then modular. If comparing a separately chosen dyadic lift, use the exact nonsolvable-image dyadic transfer. Neither path assumes the dyadic Serre theorem being proved. Source: DP §3, p.15, including the published version.

The node-level qualitative dependency path uses early R27.1 image/Chebotarev facts and R01/R15/R17/R24/R25/R32 suppliers. It has no unconditional R26 or R27.2–R27.6 endpoint. This is a necessary graph check, not a source-independence certificate. The accepted complete R32.3 packet still records open globalisation proof obligations at `R32.6/globalisation-dependency-audit`: its Tung, CEG+16, Emerton–Paškūnas, BLGG13 and Gee–Kisin inputs require the stated independent source paths. Pan Theorem 1.0.4/Remark 8.0.4 and Emerton §7.3 cannot be substituted because they use unconditional Serre input. The supplier's accepted status does not close that audit.

**Checks.** Auxiliary residual reducibility must be handled, not ruled out by assumption. The auxiliary prime is strictly above three. The family is the chosen KW lift system with every characteristic-zero member irreducible and odd, not an arbitrary system. No cross-characteristic Brauer–Nesbitt isomorphism appears. The source-audit limitations remain visible in the final comparison.

## R33.6 — one refined statement, two proof routes

Retain the four targets `modern-and-classical-modularity-agree`, `strong-form-by-the-modern-route`, `two-routes-comparison` and `elliptic-curve-export-via-either-route`. The first compares the DP eigenform witness with the R15.6 newform witness: pass to the newform with the same good eigenvalues and recognize the irreducible residual representation. Weight-one input is first replaced by a weight-at-least-two congruent witness. There is one modularity predicate and one strong theorem statement.

For the second, feed `R33.5/qualitative-serre-theorem` into **the conditional** `R27.6/qualitative-to-refined-passage`. Assembly redirects its existing direct case list to this implication. The classical route supplies qualitative existence by KW's induction and Theorems 1.2/9.1; the modern route supplies it by the six Pasos and dyadic reduction. Both share minimal-lift and weight/level optimisation, including R27.4's scalar dyadic branch. Thus the modern *qualitative* argument avoids the classical induction; its refined theorem still shares substantial KW lifting input. The source-independence audit remains open as stated above.

The elliptic-curve-facing export is conditional for the given $\bar\rho$: $p\ge5$, finite flat, cyclotomic determinant, S-type, and a strong witness imply a weight-two exact-level trivial-character witness. Instantiate the strong-witness hypothesis from the modern route. Its proof uses R15.4, R15.6, Carayol's R20.4 character change and R24.6's conductor bound. The unconditional **classical** finite-flat export is not a prerequisite, so downstream R29 can choose a route without silently taking both.

**Checks.** Compare the two output witnesses with the same $k,N,\varepsilon$ and residue-field conventions. Test the scalar dyadic non-dihedral case explicitly. The modern refinement must not use `full-classical-serre-theorem` as a proof input. A dependency on the R20.6 manifest must select conditional rows rather than follow its documentary downstream references. The conditional elliptic export must have no classical endpoint ancestor.

## Assembly map, planets and outstanding contracts

The packet's `retainedTargets` lists all twenty stable imported targets, grouped by the seven scoped stages, with explicit prerequisite/refinement maps for assembly; the nine owned nodes carry the detailed refinements and additions above. Assembly must preserve the IDs while applying its four restructuring records: finite Artin/general descent separation; early/late R27.1 separation; one conditional refinement and public witness; exact lift/family and ramification wording. The coarse `R26.6→R27.1` stage edge must be restricted to its actual late consumer, or removed after node verification. Otherwise a stage-only graph would report a false classical ancestor of the early good-dihedral inputs.

The seven new or retained planet labels in this packet are: **Qualitative-to-refined Serre theorem**, **BCDT mod-five modularity theorem**, **Weight-at-least-two modularity witnesses**, **Good-dihedral auxiliary ramification**, **Order-three local type at two**, **Terminal characteristic five**, and **Characteristic-two modularity**. Existing targets keep their prior planets at assembly; each stage remains within six planets. The regular-system application stays a target without adding another planet.

The seven consumer requests are precise: ModularForms' finite list of fixed-weight bounded-level newforms and coefficient embeddings; R01.2's local tame normal forms; R08.6's determinant-compatible actual local insertion solution; R15.2's fixed-level weight-one H¹/reduction contract; R32.6's independent globalisation paths; R15.4's odd-ramification finite-flat obstruction; and R25.5's all-component realization/reduction comparison. Five grouped gaps track the source audit, full local solution, dyadic flatness supplier, weight-one eventual reduction and supplier/assembly closure. Exact existing nodes remain imports even where their owners have open proof obligations.

The compact suggested file states the elementary matrix milestones on existing carriers and gives a few discriminating examples, including the actual Newform normalization API. The heavy representation and coefficient interfaces remain targets of this reader, as required by the current roadmap shape. A completed plan is ready for independent review; none of the seven stages is labelled closed.
